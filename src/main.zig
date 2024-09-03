const std = @import("std");

extern fn make_main(argc: c_int, argv: [*c][*c]u8, envp: [*c][*c]u8) c_int;

pub fn main() u8 {
    const argv = std.os.argv;
    const envp = std.os.environ;
    const rc = make_main(@intCast(argv.len), @ptrCast(argv.ptr), @ptrCast(envp));
    return @intCast(rc);
}
