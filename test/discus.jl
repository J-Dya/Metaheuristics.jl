using Metaheuristics
using Base.Test

# write your own tests here
@testset "Discus" begin
    function test_result(result::Vector, fitness::Float64, D::Int, tol::Float64)
        @test ≈(fitness, 0.0, atol=tol)
    end

    # Dimension
    D = 10

    # Objective function
    discus(x::Vector{Float64}) = 1e6x[1].^2 + sum(x[2:end] .^2)

    result, fitness = eca(discus, D; showResults=false)
    test_result(result, fitness, D, 1e-5)


end