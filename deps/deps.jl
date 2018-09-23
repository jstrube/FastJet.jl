import Libdl
global const libfastjet = joinpath(dirname(@__FILE__), "usr/lib/libfastjet.so")
global const libfastjettools = joinpath(dirname(@__FILE__), "usr/lib/libfastjettools.so")
global const libfastjetwrap = joinpath(dirname(@__FILE__), "usr/lib/libfastjetwrap.so")
function check_deps()
    global libfastjet
    if !isfile(libfastjet)
        error("$(libfastjet) does not exist, Please re-run Pkg.build(\"LCIO\"), and restart Julia.")
    end

    if Libdl.dlopen_e(libfastjet, Libdl.RTLD_LAZY|Libdl.RTLD_DEEPBIND|Libdl.RTLD_GLOBAL) in (C_NULL, nothing)
        error("$(libfastjet) cannot be opened, Please re-run Pkg.build(\"LCIO\"), and restart Julia.")
    end

    global libfastjettools
    if !isfile(libfastjettools)
        error("$(libfastjettools) does not exist, Please re-run Pkg.build(\"LCIO\"), and restart Julia.")
    end

    if Libdl.dlopen_e(libfastjettools) in (C_NULL, nothing)
        error("$(libfastjettools) cannot be opened, Please re-run Pkg.build(\"LCIO\"), and restart Julia.")
    end

    global libfastjetwrap
    if !isfile(libfastjetwrap)
        error("$(libfastjetwrap) does not exist, Please re-run Pkg.build(\"LCIO\"), and restart Julia.")
    end

    if Libdl.dlopen_e(libfastjetwrap, Libdl.RTLD_LAZY|Libdl.RTLD_DEEPBIND|Libdl.RTLD_GLOBAL) in (C_NULL, nothing)
        error("$(libfastjetwrap) cannot be opened, Please re-run Pkg.build(\"LCIO\"), and restart Julia.")
    end

end
