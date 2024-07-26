#import "utils.typ": *
#import "params.typ": *

#let cv(info, body) = {
  set document(author: info.name, title: info.name)

  set page(
    number-align: center,
    margin: (x: 0.5in, y: 0.5in),
  )

  set par(
    justify: true,
    leading: 0.8em,
    linebreaks: "optimized",
  )

  set text(
    font: (default-config.font-en, default-config.font-zh),
    size: default-config.font-size,
    weight: default-config.font-weight,
  )

  body
}