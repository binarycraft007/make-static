const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const config_h = b.addConfigHeader(.{
        .style = .{ .autoconf = b.path("src/config.h.in") },
        .include_path = "config.h",
    }, .{
        .ENABLE_NLS = 1,
        .FILE_TIMESTAMP_HI_RES = 1,
        .HAVE_ALLOCA = 1,
        .HAVE_ALLOCA_H = 1,
        .HAVE_ATEXIT = 1,
        .HAVE_CLOCK_GETTIME = 1,
        .HAVE_DCGETTEXT = 1,
        .HAVE_DECL_BSD_SIGNAL = 1,
        .HAVE_DECL_DLERROR = 1,
        .HAVE_DECL_DLOPEN = 1,
        .HAVE_DECL_DLSYM = 1,
        .HAVE_DECL_SYS_SIGLIST = 0,
        .HAVE_DECL__SYS_SIGLIST = 0,
        .HAVE_DECL___SYS_SIGLIST = 0,
        .HAVE_DIRENT_H = 1,
        .HAVE_DUP = 1,
        .HAVE_DUP2 = 1,
        .HAVE_FCNTL_H = 1,
        .HAVE_FDOPEN = 1,
        .HAVE_FILENO = 1,
        .HAVE_GETCWD = 1,
        .HAVE_GETGROUPS = 1,
        .HAVE_GETLOADAVG = 1,
        .HAVE_GETRLIMIT = 1,
        .HAVE_GETTEXT = 1,
        .HAVE_INTTYPES_H = 1,
        .HAVE_ISATTY = 1,
        .HAVE_LIMITS_H = 1,
        .HAVE_LOCALE_H = 1,
        .HAVE_LSTAT = 1,
        .HAVE_MEMORY_H = 1,
        .HAVE_MKSTEMP = 1,
        .HAVE_MKTEMP = 1,
        .HAVE_PIPE = 1,
        .HAVE_READLINK = 1,
        .HAVE_REALPATH = 1,
        .HAVE_SA_RESTART = 1,
        .HAVE_SETEGID = 1,
        .HAVE_SETEUID = 1,
        .HAVE_SETLINEBUF = 1,
        .HAVE_SETREGID = 1,
        .HAVE_SETREUID = 1,
        .HAVE_SETRLIMIT = 1,
        .HAVE_SETVBUF = 1,
        .HAVE_SIGACTION = 1,
        .HAVE_SIGSETMASK = 1,
        .HAVE_STDINT_H = 1,
        .HAVE_STDLIB_H = 1,
        .HAVE_STRCASECMP = 1,
        .HAVE_STRCOLL = 1,
        .HAVE_STRDUP = 1,
        .HAVE_STRERROR = 1,
        .HAVE_STRINGS_H = 1,
        .HAVE_STRING_H = 1,
        .HAVE_STRNCASECMP = 1,
        .HAVE_STRNDUP = 1,
        .HAVE_STRSIGNAL = 1,
        .HAVE_SYS_PARAM_H = 1,
        .HAVE_SYS_RESOURCE_H = 1,
        .HAVE_SYS_STAT_H = 1,
        .HAVE_SYS_TIMEB_H = 1,
        .HAVE_SYS_TIME_H = 1,
        .HAVE_SYS_TYPES_H = 1,
        .HAVE_SYS_WAIT_H = 1,
        .HAVE_TTYNAME = 1,
        .HAVE_UNISTD_H = 1,
        .HAVE_WAIT3 = 1,
        .HAVE_WAITPID = 1,
        .HAVE_LINUX_BINFMTS_H = 1,
        .HAVE_SYS_USER_H = 1,
        .MAKE_HOST = "x86_64-unknown-linux-gnu",
        .MAKE_JOBSERVER = 1,
        .MAKE_LOAD = 1,
        .MAKE_SYMLINKS = 1,
        .PACKAGE = "make",
        .PACKAGE_BUGREPORT = "bug-make@gnu.org",
        .PACKAGE_NAME = "GNU make",
        .PACKAGE_STRING = "GNU make 4.1",
        .PACKAGE_TARNAME = "make",
        .PACKAGE_URL = "http://www.gnu.org/software/make/",
        .PACKAGE_VERSION = "4.1",
        .PATH_SEPARATOR_CHAR = ':',
        .RETSIGTYPE = .void,
        .SCCS_GET = "get",
        .STDC_HEADERS = 1,
        .ST_MTIM_NSEC = .@"st_mtim.tv_nsec",
        .TIME_WITH_SYS_TIME = 1,
        .VERSION = "4.1",
        ._ALL_SOURCE = 1,
        ._GNU_SOURCE = 1,
        ._POSIX_PTHREAD_SEMANTICS = 1,
        ._TANDEM_SOURCE = 1,
        .__EXTENSIONS__ = 1,

        .CLOSEDIR_VOID = null,
        .CRAY_STACKSEG_END = null,
        .C_ALLOCA = null,
        .C_GETLOADAVG = null,
        .DGUX = null,
        .GETLOADAVG_PRIVILEGED = null,
        .HAVE_CASE_INSENSITIVE_FS = null,
        .HAVE_CFLOCALECOPYCURRENT = null,
        .HAVE_CFPREFERENCESCOPYAPPVALUE = null,
        .HAVE_DOS_PATHS = null,
        .HAVE_GETHOSTBYNAME = null,
        .HAVE_GETHOSTNAME = null,
        .HAVE_GETTIMEOFDAY = null,
        .HAVE_GUILE = null,
        .HAVE_ICONV = null,
        .HAVE_LIBDGC = null,
        .HAVE_LIBKSTAT = null,
        .HAVE_MACH_MACH_H = null,
        .HAVE_NDIR_H = null,
        .HAVE_NLIST_H = null,
        .HAVE_PSTAT_GETDYNAMIC = null,
        .HAVE_SETLOCALE = null,
        .HAVE_SOCKET = null,
        .HAVE_STRCMPI = null,
        .HAVE_STRICMP = null,
        .HAVE_STRNCMPI = null,
        .HAVE_STRNICMP = null,
        .HAVE_STRUCT_NLIST_N_UN_N_NAME = null,
        .HAVE_SYS_DIR_H = null,
        .HAVE_SYS_NDIR_H = null,
        .HAVE_UNION_WAIT = null,
        .NLIST_NAME_UNION = null,
        .NLIST_STRUCT = null,
        .SCCS_GET_MINUS_G = null,
        .STACK_DIRECTION = null,
        .STAT_MACROS_BROKEN = null,
        .SVR4 = null,
        .UMAX = null,
        .UMAX4_3 = null,
        .WINDOWS32 = null,
        .WITH_DMALLOC = null,
        ._FILE_OFFSET_BITS = null,
        ._LARGE_FILES = null,
        ._MINIX = null,
        ._POSIX_1_SOURCE = null,
        ._POSIX_SOURCE = null,
        .@"const" = null,
        .gid_t = null,
        .pid_t = null,
        .size_t = null,
        .uid_t = null,
        .uintmax_t = null,
    });

    const exe = b.addExecutable(.{
        .name = "make",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    exe.addConfigHeader(config_h);
    exe.addCSourceFiles(.{
        .root = b.path("."),
        .files = &make_src,
        .flags = &.{"-std=gnu99"},
    });
    exe.defineCMacro("LIBDIR", "\"/usr/lib\"");
    exe.defineCMacro("LOCALEDIR", "\"/usr/share/locale\"");
    exe.defineCMacro("INCLUDEDIR", "\"/usr/include\"");
    exe.defineCMacro("HAVE_CONFIG_H", null);
    exe.addIncludePath(b.path("src"));
    exe.addIncludePath(b.path("src/glob"));
    b.installArtifact(exe);
}

const make_src = [_][]const u8{
    "src/ar.c",
    "src/arscan.c",
    "src/commands.c",
    "src/default.c",
    "src/dir.c",
    "src/expand.c",
    "src/file.c",
    "src/function.c",
    "src/getopt.c",
    "src/getopt1.c",
    "src/guile.c",
    "src/implicit.c",
    "src/job.c",
    "src/load.c",
    "src/loadapi.c",
    "src/libmake.c",
    "src/misc.c",
    "src/output.c",
    "src/read.c",
    "src/remake.c",
    "src/rule.c",
    "src/signame.c",
    "src/strcache.c",
    "src/variable.c",
    "src/version.c",
    "src/vpath.c",
    "src/hash.c",
    "src/remote-stub.c",
};
