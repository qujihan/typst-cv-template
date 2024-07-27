#import "params.typ": *

#let icon-text-box(
  icon-path,
  txt,
  size: 16pt,
  baseline: 3.5em,
  h-size: 0.5em,
  icon-factor: 1.2,
) = {
  box(baseline: baseline, outset: (x: 0pt))[#image(
      project-root + icon-path,
      height: size * icon-factor,
    )]
  h(h-size)
  box(outset: (y: 0pt), height: auto)[#text(size: size)[#txt]]
}

#let emphasize(color: default-config.emphasize-color, content) = {
  highlight(
    fill: color,
    top-edge: 0.2pt,
    bottom-edge: -1.5pt,
    content,
  )
}

#let boldline(v-size: default-config.bold-line-space) = {
  block(
    below: 0pt,
    above: 0pt,
    {
      v(v-size * 0.1)
      line(length: 100%, stroke: (paint: black, thickness: 0.8pt))
      v(v-size * 0.9)
    },
  )
}

#let thinline(v-size: default-config.thin-line-space) = {
  v(v-size * 0.3)
  line(
    length: 100%,
    stroke: (paint: black, dash: ("dot", 5pt, 5pt, 5pt)),
  )
  v(v-size * 0.7)
}

#let display-cv-info(
  info,
  name-size: default-config.head-info-name-size,
  other-size: default-config.head-info-other-size,
  name-color: default-config.head-info-name-color,
  other-color: default-config.head-info-other-color,
) = {
  let block-size = name-size + other-size * 2 + 1em
  block(above: 0em, below: 2em, height: block-size, width: 100%)[
    #set align(center + horizon)
    #set text(fill: name-color, weight: "bold", name-size)
    #info.name
    #set align(center + bottom)
    #set text(fill: other-color, weight: "regular", other-size)
    #box(
      align(center)[
        #info.email #info.wechat
      ],
    )
    #linebreak()
    #box(
      align(center)[
        #info.phone
      ],
    )
  ]
}

#let show-string-arr-one-line(str-arr) = {
  let len = str-arr.len()
  columns(len, gutter: 0%)[
    #for i in range(len) {
      if i == 0 {
        align(left)[#str-arr.at(i)]
        colbreak()
      } else if i == len - 1 {
        align(right)[#str-arr.at(i)]
      } else {
        align(center)[#str-arr.at(i)]
        colbreak()
      }
    }
  ]
}

#let section-title(icon-path, content) = {
  block(
    above: 2em,
    below: 0.5em,
    {
      set text(weight: 500, fill: black)
      icon-text-box(
        icon-path,
        content,
        size: 1.3em,
        baseline: 0.2em,
        h-size: 0.5em,
        icon-factor: 1,
      )
      v(0.4em)
      boldline()
    },
  )
}

#let subsection-list(str-arr) = {
  set text(1.1em, weight: 400, fill: black)
  show-string-arr-one-line(str-arr)
}
