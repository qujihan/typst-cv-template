#let project-root = "../"

#let template-root = "./"

#let config-file-name = "cvconfig.json"

#let get-config(attr) = {
  let current-file = config-file-name
  let parent-file = "../" + config-file-name
  if attr in json(parent-file) {
     return json(parent-file).at(attr)
  }
  if attr in json(current-file) {
    return json(current-file).at(attr)
  }
  return ""
}

#let icon-text-box(icon-path, text, size: 16pt, baseline: 0pt) = {
  box(baseline: baseline)[#image(project-root + icon-path, height: size)]
  box(baseline: baseline)[#text]
}

#let emphasize(content) = {
  highlight(
    fill: black,
    top-edge: 0.2pt,
    bottom-edge: -1.5pt,
    content,
  )
}

#let boldline() = {
  v(6pt)
  line(length: 100%, stroke: (paint: black, thickness: 1.3pt))
  v(6pt)
}

#let thinline() = {
  v(4pt)
  line(
    length: 100%,
    stroke: (paint: black, dash: ("dot", 5pt, 5pt, 5pt)),
  )
  v(4pt)
}

#let display-cv-info(info) = {
  block(above: 0pt, below: 3pt, height: 5em, width: 100%)[
    #set align(center)
    #set text(fill: black, weight: "bold", 2em)
    #info.name
    #set align(center + horizon)
    #set text(fill: black, weight: "regular", 0.5em)
    #info.email
    #info.wechat \
    #info.github
    #info.phone
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
  set text(1.1em, weight: 500, fill: black)
  set pad(bottom: 0.1em)
  icon-text-box(icon-path, content, size: 16pt, baseline: 2pt)
  boldline()
}

#let subsection-list(str-arr) = {
  set text(1.1em, weight: 500, fill: black)
  set pad(bottom: 0.1em)
  show-string-arr-one-line(str-arr)
}
