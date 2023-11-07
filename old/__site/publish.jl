#!/usr/bin/env -S julia --startup-file=no

import Pkg
Pkg.activate(@__DIR__)

update_docs_path = joinpath(@__DIR__, "update_docs.sh")

update_docs_cmd = run(`sh $update_docs_path`)

if !success(update_docs_cmd)
    @error "There was an error with the document update."
    exit(1)
end

using Franklin
publish()
