---
---

window.onload = ->
  canvas = document.getElementById("fractal")
  paper.setup canvas, () ->
    console.log arguments

  randomColor = () ->
    "#" + Math.floor(Math.random() * 16777215).toString(16)

  Circ = (x, y, radius, line='black', fill) ->
    circ = new paper.Path.Circle(new paper.Point(x, y), radius)
    circ.radius = radius
    circ.x = x
    circ.y = y
    circ.fillColor = fill if fill?
    return circ

  genFractal = (outer, depth) ->
    if depth > 0

      coords = []
      inner = []
      subgroup = []

      sqrt3 = Math.sqrt(3)
      radius = (sqrt3 / (2 + sqrt3)) * outer.radius
      coords[0] =
        x: outer.x
        y: outer.y - (2 / (2 + sqrt3)) * outer.radius

      coords[1] =
        x: outer.x - radius
        y: outer.y + (1 / (2 + sqrt3)) * outer.radius

      coords[2] =
        x: outer.x + radius
        y: coords[1].y


      for coord in coords
        circ = Circ coord.x, coord.y, radius, null, randomColor()
        subgroup.push genFractal(circ, depth - 1) if depth > 1
        inner.push circ

      boxHack = new paper.Path.Circle outer.x, outer.y + outer.radius - 1, 1

      innerGroup = new paper.Group (inner.concat subgroup, boxHack)

      innerGroup.turn = (angle) ->
        #pt = Circ outer.position.x, outer.position.y, 1, 'red'
        innerGroup.position = outer.position
        innerGroup.rotate angle, outer.position.x, outer.position.y
        #pt = Circ innerGroup.position.x, innerGroup.position.y, 1, 'green'
        circ.turn angle for circ in subgroup

      return innerGroup

  start = new Date()

  outer = Circ 128, 128, 127, null, '#AB3612'
  inner = genFractal outer, 4

  paper.view.onFrame = (event) ->
    {count, time, delta} = event
    inner.turn 0.5 if count < 360

  end = new Date()
  console.log "time: ", (end - start) / 1000, "s"
