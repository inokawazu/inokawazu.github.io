### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 5bc098a2-8466-11ee-2f14-c5fef742ad59
using LinearAlgebra

# ╔═╡ 496cd9aa-956c-490a-972c-b53735154237
function averge_rolls_to_complete(A)
	v0 = zeros(eltype(A), size(A,2))
	v0[1] = 1
	sum((one(A) - A)\v0)
end

# ╔═╡ 38226060-8274-48ed-8b6e-33a131897848
md"""
# Transition matrix (S1)
"""

# ╔═╡ 9d388d26-1bd4-4dd5-9a5a-7503f9f5aaad
S1 = [ 
	1//2 0    0    0 
    1//2 1//2 0    0 
    0    1//2 1//2 0
    0    0    1//2 1//2
]

# ╔═╡ 9fec8227-eb56-4fee-b9b7-55f2da7a6c9a
averge_rolls_to_complete(Float64.(S1))

# ╔═╡ ce0b5ae9-889a-4344-81e9-c4c332da8d1c
md"""
# Transition matrix (S2)
"""

# ╔═╡ 245fd646-db0e-4f43-bb8c-93ee1bc0b254
S2 = [( j < i <= j+3 ? 1//3 : 0//1) for i in 1:16, j in 1:16]

# ╔═╡ 0c282111-ceba-4827-a2c5-edbfeccea4c4
averge_rolls_to_complete(Float64.(S2))

# ╔═╡ f2259a45-1c9f-43ce-acfc-98b5d7bb0edb
md"""
# Transition matrix (S3)
"""

# ╔═╡ 21f93cad-b5e1-422f-add0-1d6ffaf2f8ab
S3 = let 
	S3t = copy(S2)
	S3t[10, 7:9] .= 0/1
	S3t[4, 7:9] .= 1//3
	S3t
end

# ╔═╡ ee108117-f34c-43b9-baa5-8273f9559233
averge_rolls_to_complete(Float64.(S3))

# ╔═╡ 916ff3cf-1516-420b-bc4a-835e268a5175
md"""
# Transition matrix (S4)

$${ \sum_i \left( PD^nP^{T} v \right)_i - v_i = 0 }$$
$${ \sum_i \left( \left( PD^nP^{T} - PP^{T} \right) v \right)_i = 0 }$$
$${ \sum_i \left( \left( PD^n - P \right) ( P^{T}v ) \right)_i = 0 }$$
$${ \sum_i \left( \left( D^n - \mathbb I \right) w \right)_i = 0 }$$
"""

# ╔═╡ 2e54bf18-1d15-4dc5-b4bf-5b0ff750a73c
S4 = [ 
	1//2 0    0    1//2 
    1//2 1//2 0    0 
    0    1//2 1//2 0
    0    0    1//2 1//2
]

# ╔═╡ 57aecf8f-7d77-4728-af63-4c0018d52088
Diagonal(eigvals(S4))

# ╔═╡ d838a480-53e9-4bad-97ef-29bda506d9bd
Diagonal(eigvals(Float64.(S4)))*[1,0,0,0]

# ╔═╡ cd288f83-cec8-4ac9-9478-1eea47a2f490
Float64.(S4)^200*[1/2,0,0,1/2]

# ╔═╡ f5402721-037e-4684-8f44-b398445344c5
P4 = eigvecs(Float64.(S4))

# ╔═╡ 6b185eef-f8f9-4cf5-8b41-d3ee243632e7
U4 = -im*log(S4)

# ╔═╡ 29cb07fa-02f4-414f-afea-a37837a118c1
exp(im*U4*0.1)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.4"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"
"""

# ╔═╡ Cell order:
# ╠═5bc098a2-8466-11ee-2f14-c5fef742ad59
# ╠═496cd9aa-956c-490a-972c-b53735154237
# ╟─38226060-8274-48ed-8b6e-33a131897848
# ╠═9d388d26-1bd4-4dd5-9a5a-7503f9f5aaad
# ╠═9fec8227-eb56-4fee-b9b7-55f2da7a6c9a
# ╟─ce0b5ae9-889a-4344-81e9-c4c332da8d1c
# ╠═245fd646-db0e-4f43-bb8c-93ee1bc0b254
# ╠═0c282111-ceba-4827-a2c5-edbfeccea4c4
# ╟─f2259a45-1c9f-43ce-acfc-98b5d7bb0edb
# ╠═21f93cad-b5e1-422f-add0-1d6ffaf2f8ab
# ╠═ee108117-f34c-43b9-baa5-8273f9559233
# ╟─916ff3cf-1516-420b-bc4a-835e268a5175
# ╠═2e54bf18-1d15-4dc5-b4bf-5b0ff750a73c
# ╠═57aecf8f-7d77-4728-af63-4c0018d52088
# ╠═d838a480-53e9-4bad-97ef-29bda506d9bd
# ╠═cd288f83-cec8-4ac9-9478-1eea47a2f490
# ╠═f5402721-037e-4684-8f44-b398445344c5
# ╠═6b185eef-f8f9-4cf5-8b41-d3ee243632e7
# ╠═29cb07fa-02f4-414f-afea-a37837a118c1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
