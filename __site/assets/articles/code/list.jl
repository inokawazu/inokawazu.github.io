# This file was generated, do not modify it. # hide
article_suffixes = ["html", "md"]
remove_suffix(x) = "./" * basename(reduce((path, suff) -> chopsuffix(path, "." * suff), article_suffixes, init = x))