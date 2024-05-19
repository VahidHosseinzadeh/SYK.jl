using SYK
using BenchmarkTools

@btime H(10,4,1)

using Test

@testset "SYK.jl" begin
    ### test
function commutator(op1, op2)
    return op1 * op2 - op2 * op1
end


function anticommutator(op1, op2)
    return op1 * op2 + op2 * op1
end

function CliffordCheck(K)
    for m in combinations(1:2*K, 2)
        if anticommutator(ψ(K, m[1]), ψ(K, m[2])) != spzeros(2^K, 2^K)
            print("this is not a represention of Clifford algebra! m = $m")
            return false
        end
    end

    for i in 1:2*K
        if anticommutator(ψ(K, i), ψ(K, i)) != ((1 / √2)^2 + (1 / √2)^2) * I
            print("this is not a represention of Clifford algebra! i = $i ")
            return false
        end
    end
    return true
end



function CliffordCheckGamma(K)
    for m in combinations(1:2*K, 2)
        if anticommutator(γ(K, m[1]), γ(K, m[2])) != spzeros(2^K, 2^K)
            print("this is not a represention of Clifford algebra! m = $m")
            return false
        end
    end

    for i in 1:2*K
        if anticommutator(γ(K, i), γ(K, i)) != 2 * I
            print("this is not a represention of Clifford algebra! i = $i ")
            return false
        end
    end
    return true
end


end
