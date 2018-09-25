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

export PseudoJet, JetDefinition, antikt_algorithm, ClusterSequence, inclusive_jets, sorted_by_pt, pt, rap, phi, constituents
import Base.length, Base.getindex
length(v::JetVec) = size(v)
getindex(v::JetVec, i) = at(v, i-1)
end # module
