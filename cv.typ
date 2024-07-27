#import "utils.typ": *
#import "params.typ": *

#let cv(info, body) = {
  set document(author: info.name, title: info.title)

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

  set footnote.entry(clearance: 0.5em, gap: 0.4em, indent: 2em, separator: none)
  show footnote.entry: set align(right)
  show footnote.entry: set text(size: default-config.font-size * 0.7)

  body
}