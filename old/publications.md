@def title = "Publications"

+++
using HTTP, JSON
inspireinfo = JSON.Parser.parse(HTTP.get("https://inspirehep.net/api/authors/1778034").body |> String)["metadata"]
articles = JSON.Parser.parse(String(HTTP.get("https://inspirehep.net/api/literature?sort=mostrecent&size=50&page=1&q=Markus%20Garbiso").body))["hits"]["hits"]

titles = []

authreg = r"_(.*)$"
art_auths = []

arxivdates = []

#pubyears = []
#publinks = []
#pubjourtitle = []
for article in articles
  art_auth = [match(authreg, author)[1] for author in article["metadata"]["facet_author_name"]]
  push!(art_auths, join(art_auth,", ", " and "))

  push!(titles, article["metadata"]["titles"][1]["title"])
  # pi = article["metadata"]["publication_info"][1]
  #  push!(pubyears, string(pi["year"]))
  #  push!(publinks, pi["journal_record"]["\$ref"])
  push!(arxivdates, article["metadata"]["earliest_date"])
end
artdata = zip(art_auths, titles, arxivdates)
+++

{{for (authors, title, adate) in artdata}}
### {{fill title}}

*{{fill authors}}* --- *{{fill adate}}*

---
{{end}}
