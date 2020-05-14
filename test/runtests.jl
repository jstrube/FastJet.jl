using CxxWrap: StdVector
using FastJet
using Test

function printInfo(jets)
    # print out some infos
    # println("Clustering with ", description(jet_def))
    # print the jets
    println("        pt y phi")
    for i = 1:length(jets)
        println("jet ", i, ": ", pt(jets[i]), " ", rap(jets[i]), " ", phi(jets[i]))
        constits = constituents(jets[i])
        # for j = 1:length(constituents)
        #     println("    constituent ", j, "'s pt: ", pt(constituents[j]))
        # end
    end
end

# this is the example from http://www.fastjet.fr/quickstart.html
function main()
    particles = PseudoJet[]
    # an event with 3 particles:  px    py   pz   E
    push!(particles, PseudoJet(  99.0,  0.1, 0, 100.0))
    push!(particles, PseudoJet(   4.0, -0.1, 0,   5.0))
    push!(particles, PseudoJet( -99.0,    0, 0,  99.0))
  
    # choose a jet definition
    @testset "Core functionality" begin
        R = 0.7
        jet_def = JetDefinition(antikt_algorithm, R)
        # run the clustering, extract the jets
        cs = ClusterSequence(StdVector(particles), jet_def)
        jets = inclusive_jets(cs, 0.0)
        @test length(jets) == 2
        printInfo(jets)
    end
    @testset "Plugins" begin
        vp = FastJet.ValenciaPlugin(1.2, 0.8)
        jet_def = JetDefinition(vp)
        # run the clustering, extract the jets
        cs = ClusterSequence(StdVector(particles), jet_def)
        jets = inclusive_jets(cs, 0.0)
        @test length(jets) == 2
        printInfo(jets)
    end
end 
main() 
