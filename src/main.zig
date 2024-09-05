const std = @import("std");
const builtin = @import("builtin");
const make = @import("root.zig");

pub fn main() !void {
    var arena_allocator = std.heap.ArenaAllocator.init(std.heap.c_allocator);
    defer arena_allocator.deinit();
    try make.run();
}
