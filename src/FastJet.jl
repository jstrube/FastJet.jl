module FastJet
using CxxWrap
const depsfile = joinpath(dirname(dirname(@__FILE__)), "deps", "deps.jl")
if !isfile(depsfile)
  error("$depsfile not found, CxxWrap did not build properly")
end
include(depsfile)

@wrapmodule(libfastjetwrap)

function __init__()
    @initcxx
end

end # module
