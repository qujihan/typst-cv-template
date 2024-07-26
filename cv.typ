#import "utils.typ": *

#let cv(
  info: (),
  // global
  font-en: "Lora",
  font-zh: "Source Han Serif SC",
  font-size: 10pt,
  font-weight: 200,
  // info
  info-name-size:2em,
  info-other-size:0.75em,
  // icon-text 
  icon-text-size:1em,
  icon-text-baseline:0.5em,
  // boldline/thinline-space
  boldline-space: 6pt,
  thinline-space:4pt,

  title-color: rgb("#000000"),
  head-color: rgb("#181818"),
  subtitile-color: rgb("#1f1f1f"),
  content-color: rgb("#222222"),
  // 
  emphasize-color: rgb("#00bbbb"),
  body,
) = {
  set document(author: info.name, title: info.name)

  set page(
    number-align: center,
    margin: (x: 0.5in, y: 0.5in),
  )

  set par(
    justify: true,
    leading: 0.75em,
    linebreaks: "optimized",
  )

  set text(font: (font-en, font-zh), size: font-size, weight: font-weight)

  body
}