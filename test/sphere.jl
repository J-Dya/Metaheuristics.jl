using Metaheuristics
using Base.Test

# write your own tests here
@testset "Sphere" begin
    function test_result(result::Vector, fitness::Float64, D::Int, tol::Float64)
        @test ≈(fitness, 0.0, atol=tol)
    end

    # Dimension
    D = 10

    # Objective function
    sphere{T <: Vector}(x::T) = sum(x.*x)

    # ECA results
    result, fitness = eca(sphere, D; showResults=false)
    test_result(result, fitness, D, 1e-5)

    # ED results
    result, fitness = DE(sphere, D; F = 1, CR = 0.5, showResults=false)
    test_result(result, fitness, D, 1e-5)

    # PSO results
    result, fitness = pso(sphere, D; limits=(-10, 10), showResults=false)
    test_result(result, fitness, D, 1e-5)
end