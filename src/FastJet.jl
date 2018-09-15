module FastJet
using CxxWrap

@wrapmodule(joinpath("path/to/built/lib","libhello"))

function __init__()
    @initcxx
end

end # module
