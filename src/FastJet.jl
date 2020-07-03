module FastJet
using FastJet_jll
using CxxWrap
using FastJet_Julia_Wrapper_jll

@wrapmodule(libfastjetwrap)

function __init__()
    @initcxx
end

export PseudoJet, JetDefinition, antikt_algorithm, ClusterSequence, inclusive_jets, sorted_by_pt, pt, px, py, pz, e, E, rap, phi, constituents, exclusive_jets, modp2, set_user_index, user_index
end # module
