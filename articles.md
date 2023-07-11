+++
title = "Articles"
+++

# {{fill title}}

```julia:./code/article_list
#hideall
using Dates
using Franklin: pagevar
import Franklin

article_suffixes = ["html", "md"]
remove_suffix(x) = basename(reduce((path, suff) -> chopsuffix(path, "." * suff), article_suffixes, init = x))

article_files = readdir("articles", join=true)
article_paths = "./" .* remove_suffix.(article_files)

dates = Date.(pagevar.(article_files, "date", default=""))
titles = pagevar.(article_files, "title", default="")

println(dates)
println()
println(titles)
println()

order = sortperm(dates, rev=true)

#for (article_path, article_title, article_date) in zip(article_paths[order], titles[order], dates[order])
#println("## [$article_title - *$article_date*]($article_path)")
#end
```
\textoutput{./code/article_list}
