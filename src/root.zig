const std = @import("std");
const testing = std.testing;
const builtin = @import("builtin");

pub extern fn make_main(argc: c_int, argv: [*:null]const ?[*:0]const u8, envp: [*:null]const ?[*:0]const u8) c_int;

pub fn run() !void {
    var arena_allocator = std.heap.ArenaAllocator.init(std.heap.c_allocator);
    defer arena_allocator.deinit();
    const arena = arena_allocator.allocator();

    const argv = try std.process.argsAlloc(arena);
    defer std.process.argsFree(arena, argv);

    const argv_buf = try arena.allocSentinel(?[*:0]const u8, argv.len, null);
    for (argv, 0..) |arg, i| argv_buf[i] = arg;

    const envp = (try std.process.createEnvironFromExisting(arena, @ptrCast(std.os.environ.ptr), .{})).ptr;
    const rc = make_main(@intCast(argv_buf.len), argv_buf, envp);
    std.debug.assert(rc == 0);
}

pub const RunOptions = struct {
    argv: []const []const u8,
    env_map: ?*const std.process.EnvMap = null,
};

pub fn runWithOptions(options: RunOptions) !void {
    var arena_allocator = std.heap.ArenaAllocator.init(std.heap.c_allocator);
    defer arena_allocator.deinit();
    const arena = arena_allocator.allocator();

    const args = try std.process.argsAlloc(arena);
    defer std.process.argsFree(arena, args);

    const argv_buf = try arena.allocSentinel(?[*:0]const u8, options.argv.len + 1, null);
    argv_buf[0] = args[0];
    for (options.argv, 0..) |arg, i| argv_buf[i + 1] = try arena.dupeZ(u8, arg);

    // If env_map is defined, use it, else because we are always linking libc, create it from existing
    const envp: [*:null]const ?[*:0]const u8 = m: {
        if (options.env_map) |env_map| {
            break :m (try std.process.createEnvironFromMap(arena, env_map, .{})).ptr;
        } else {
            break :m (try std.process.createEnvironFromExisting(arena, std.c.environ, .{})).ptr;
        }
    };
    const rc = make_main(@intCast(argv_buf.len), argv_buf, envp);
    std.debug.assert(rc == 0);
}
