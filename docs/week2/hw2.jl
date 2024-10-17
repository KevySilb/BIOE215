using GLMakie

function makecirc(N::Integer)
    A = rand(N, 2) .- 0.5
    return A ./ sqrt.(sum(A .^ 2, dims = 2))
end

function parta()
    fig = Figure();
    ax = Axis(fig[1,1], aspect = DataAspect())
    N = 100
    A = Observable(makecirc(N))
    
    points = scatter!([Point2f(A[][i, 1], A[][i, 2]) for i in 1:N])
    on(A) do mat
        points[1] = [Point2f(mat[i, 1], mat[i, 2]) for i in 1:N]
    end
    
    xlims!(ax, -2, 2)
    ylims!(ax, -2, 2)
    return fig, ax, A
end


function getShear(k::Float64)
    return [[1 k]; [k 1]]
end

function getRotation(θ::Float64)
    return [[cos(θ) -sin(θ)]; [sin(θ) cos(θ)]]
end

function getStretch(s::Float64)
    return [[s 0]; [0 s]]
end

fig, ax, A = parta()

display(fig);

shear = getShear(0.01)

for i=1:400
    A[] = A[] * shear
    sleep(0.01)
end
