fieldsMandatory <- c("sex", "ht" ,"wt")

fields <- c("sex", "ht", "wt","nfs","nbs","mb","bg","slpr","necksp","arm","stback","hback","slouch","feet","over","standst","standsl","pressure")

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}



appCSS <-
  ".mandatory_star { color: red; }"
