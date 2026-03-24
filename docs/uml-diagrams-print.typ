#set document(title: "G-Code Viewer — UML Diagrams")

// Title page
#page(paper: "a4", margin: 1cm)[
  #align(center + horizon)[
    #text(size: 28pt, weight: "bold")[G-Code Viewer]
    #v(1em)
    #text(size: 16pt, fill: rgb("#666"))[UML Diagrams]
  ]
]

// uml-architecture.svg: 4273x1927 -> landscape
#page(paper: "a4", flipped: true, margin: 1cm)[
  #text(size: 9pt, fill: rgb("#999"))[uml-architecture]
  #v(0.3em)
  #align(center + horizon)[
    #image("uml-architecture.svg", width: 100%, height: 100%, fit: "contain")
  ]
]

// uml-seq-file.svg: 1930x2491 -> portrait
#page(paper: "a4", margin: 1cm)[
  #text(size: 9pt, fill: rgb("#999"))[uml-seq-file]
  #v(0.3em)
  #align(center + horizon)[
    #image("uml-seq-file.svg", width: 100%, height: 100%, fit: "contain")
  ]
]

// uml-seq-main.svg: 2317x3486 -> portrait
#page(paper: "a4", margin: 1cm)[
  #text(size: 9pt, fill: rgb("#999"))[uml-seq-main]
  #v(0.3em)
  #align(center + horizon)[
    #image("uml-seq-main.svg", width: 100%, height: 100%, fit: "contain")
  ]
]

// uml-seq-simulation.svg: 1439x3236 -> portrait
#page(paper: "a4", margin: 1cm)[
  #text(size: 9pt, fill: rgb("#999"))[uml-seq-simulation]
  #v(0.3em)
  #align(center + horizon)[
    #image("uml-seq-simulation.svg", width: 100%, height: 100%, fit: "contain")
  ]
]

// uml-states.svg: 1525x1516 -> landscape (w > h)
#page(paper: "a4", flipped: true, margin: 1cm)[
  #text(size: 9pt, fill: rgb("#999"))[uml-states]
  #v(0.3em)
  #align(center + horizon)[
    #image("uml-states.svg", width: 100%, height: 100%, fit: "contain")
  ]
]
