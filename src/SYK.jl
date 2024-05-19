module SYK

using LinearAlgebra
using LinearAlgebra: kron
using SparseArrays, BenchmarkTools
using ThreadsX, Combinatorics
using LuxurySparse
using Distributions
using KrylovKit
using Plots



export H


"Majorana fermion ψ(K,i) where 2K = N for N fermions (so i=1:N) using PermMatrices"
function ψ(K::Int, i::Int)
    sx = PermMatrix([2, 1], [1 / √2, 1 / √2])
    sy = PermMatrix([2, 1], [-1im / √2, 1im / √2])
    sz = PermMatrix([1, 2], [1, -1])
    if K > 1 && K % 1 == 0
        if i % 1 == 0 && 1 <= i <= (2 * K) - 2
            return kron(ψ(K - 1, i), -sz)
        elseif i == (2 * K) - 1
            return kron(IMatrix(2^(K - 1)), sx)
        elseif i == (2 * K)
            return kron(IMatrix(2^(K - 1)), sy)
        else
            print("i = $i out of range!")
        end
    elseif K == 1
        if i == 1
            return sx
        elseif i == 2
            return sy
        else
            print("i = $i out of range!")
        end
    else
        print("K = $K is out of range!")
    end
end
    
     
    

"Majorana fermion Γ(K,i) in chiral rep where 2K = N for N fermions (so i=1:N) using PermMatrices"
function γ(K::Int, i::Int)
    σx = PermMatrix([2, 1], [1 , 1])
    σy = PermMatrix([2, 1], [-1im , 1im])
    σz = PermMatrix([1, 2], [1, -1])
    if K > 1
        if 1 <= i <= (2*K) - 1
            return kron(σx, γ(K - 1, i))
        elseif i == 2*K
            return kron(σy, IMatrix(2^(K - 1)))
        elseif i == (2*K) + 1
            return kron(σz, IMatrix(2^(K - 1)))
        end
    elseif K == 1
        if i == 1
            return σx
        elseif i == 2
            return σy
        elseif i == 3
            return σz
        end
    end
end








"Hamiltonian of syk model"
function H(K::Int, q::Int, J::Int)
    μ, σ = 0, (J * √factorial(q - 1)) / ((2 * K)^((q - 1) / 2))
    d = Normal(μ, σ)
    interaction_list = [m for m in combinations(1:2*K, q)]
    return (1im^(q / 2)) * ThreadsX.sum(j for j in (rand(d) * reduce(*, (ψ(K, i) for i in m)) for m in interaction_list))
end



function H_BD(K::Int, q::Int, J::Int)
    μ, σ = 0, (J * √factorial(q - 1)) / ((2 * K)^((q - 1) / 2))
    d = Normal(μ, σ)
    interaction_list = [m for m in combinations(1:2*K, q)]
    return (1im^(q / 2)) * ThreadsX.sum(j for j in (rand(d) * reduce(*, (γ(K, i) for i in m)) for m in interaction_list))
end
  


h(K,q,J) = H_BD(K,q,J)[1:2^K ÷ 2,1:2^K ÷ 2]


function Ps(K,q,J)
    Es = eigvals!(Matrix(h(K,q,J)))
    if (2 * K) % 8 != 0   #so it is 2,4,6 in the N even case which is equlivalent to being doubly degenerate
        diffs = diff(Es[begin:2:end]) 
    elseif (2 * K) % 8 == 0 
        diffs = diff(Es) 
    end
    m = mean(diffs)
    diffs/m
end






function Ps(nr,K,q,J)
    Es = []
    for i in 1:nr
        append!(Es,Ps(K,q,J))
    end
    Es
end


res  = Ps(100,8,4,1)


histogram(res,bins=100)


function plot_Ps(nr,K,q,J)
    ps = Ps(nr,K,q,J)
    histogram(ps, bins = :sqrt, normalize=:pdf, label = "N = $(2 * K) \n nr = $(nr)")
end


plot_Ps(400,8,4,1)


end # module


