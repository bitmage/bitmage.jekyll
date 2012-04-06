---
---

window.onload = ->
  canvas = document.getElementById("fractal")
  paper.setup canvas
  Circ = (x, y, radius) ->
    circ = new paper.Path.Circle(new paper.Point(x, y), radius)
    circ.radius = radius
    circ.x = x
    circ.y = y
    circ.strokeColor = "black"
    circ

  rotateInner = (outer) ->
    i = 0

    while i < outer.inner.length
      circ = outer.inner[i]
      origin =
        x: circ.x - outer.x
        y: circ.y - outer.y
      i++

  genFractal = (outer, depth) ->
    if depth > 0
      inner = []
      sqrt3 = Math.sqrt(3)
      radius = (sqrt3 / (2 + sqrt3)) * outer.radius
      inner[0] =
        x: outer.x
        y: outer.y - (2 / (2 + sqrt3)) * outer.radius

      inner[1] =
        x: outer.x - radius
        y: outer.y + (1 / (2 + sqrt3)) * outer.radius

      inner[2] =
        x: outer.x + radius
        y: inner[1].y

      i = 0

      while i < inner.length
        coord = inner[i]
        coord.circ = Circ(coord.x, coord.y, radius)
        coord.inner = genFractal(coord.circ, depth - 1)
        i++
      inner

  start = new Date()
  outer = Circ(128, 128, 127)
  inner = genFractal(outer, 1)
  paper.view.draw()
  end = new Date()
  console.log "time: ", (end - start) / 1000, "s"
