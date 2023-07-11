+++
using Dates

title = "Articles"
article_files = filter(!contains("index"), readdir("articles", join=true))
# article_files = readdir("articles", join=true)

article_suffixes = ["html", "md"]
remove_suffix(x) = "./"*basename(reduce((path, suff) -> chopsuffix(path, "." * suff), article_suffixes, init = x))

article_paths = remove_suffix.(article_files)

list_array = zip(article_files, article_paths)
+++

# {{fill title}}

{{for (article_file, article_path) in list_array}}
- [{{fill article_path}}]({{fill title article_file}}) *{{fill date article_file}}*
{{end}}
