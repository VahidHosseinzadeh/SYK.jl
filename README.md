# A Julia package for SYK computations

```Julia
    using SYK
    #20 fermions 
    @btime H(10,4,1)
    681.257 ms (1288342 allocations: 2.76 GiB) # on macbook pro (intel 2020, 16 gig ram) with putting nthreads = 8. number of interactions is 4 here. 
    1024×1024 SparseArrays.SparseMatrixCSC{ComplexF64, Int64} with 262144 stored entries:
    ⎡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣦⎤
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣷⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣿⣿⢿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎢⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎥
    ⎣⠻⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⎦

```

[![Build Status](https://github.com/VahidHosseinzadeh/SYK.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/VahidHosseinzadeh/SYK.jl/actions/workflows/CI.yml?query=branch%3Amain)
