using GLMakie


#= henon map

x_t+1 = 1-ax_t^2 + by_t
y_t+1 = x_t

=#

# a = 1.4
# b = 0.3
# x = 0
# y = 0.9

function henon_map()
    a = 1.4
    b = 0.3
    x₀ = 0
    y₀ = 0.9

    N = 10000
    fig = Figure()
    ax = Axis(fig[1,1])

    sol = Matrix{Float64}(undef, N, 2)
    sol[1, :] = [x₀, y₀]
    for t = 2:N
        sol[t, :] = [1 - a*sol[t-1, 1]^2 + b*sol[t-1, 2], sol[t-1, 1]]
    end

    scatter!(ax, sol[:, 1], sol[:, 2])

    display(fig)
end

