(function() {

  window.onload = function() {
    var Circ, canvas, end, genFractal, inner, outer, randomColor, start;
    canvas = document.getElementById("fractal");
    paper.setup(canvas, function() {
      return console.log(arguments);
    });
    randomColor = function() {
      return "#" + Math.floor(Math.random() * 16777215).toString(16);
    };
    Circ = function(x, y, radius, line, fill, width) {
      var circ;
      circ = new paper.Path.Circle(new paper.Point(x, y), radius);
      circ.radius = radius;
      circ.x = x;
      circ.y = y;
      if (line != null) circ.strokeColor = line;
      if (width != null) circ.strokeWidth = width;
      if (fill != null) circ.fillColor = fill;
      return circ;
    };
    genFractal = function(outer, depth) {
      var boxHack, circ, coord, coords, inner, innerGroup, radius, sqrt3, subgroup, _i, _len;
      if (depth > 0) {
        coords = [];
        inner = [];
        subgroup = [];
        sqrt3 = Math.sqrt(3);
        radius = (sqrt3 / (2 + sqrt3)) * outer.radius;
        coords[0] = {
          x: outer.x,
          y: outer.y - (2 / (2 + sqrt3)) * outer.radius
        };
        coords[1] = {
          x: outer.x - radius,
          y: outer.y + (1 / (2 + sqrt3)) * outer.radius
        };
        coords[2] = {
          x: outer.x + radius,
          y: coords[1].y
        };
        for (_i = 0, _len = coords.length; _i < _len; _i++) {
          coord = coords[_i];
          circ = Circ(coord.x, coord.y, radius, randomColor(), null, 2);
          if (depth > 1) subgroup.push(genFractal(circ, depth - 1));
          inner.push(circ);
        }
        boxHack = new paper.Path.Circle(outer.x, outer.y + outer.radius - 1, 1);
        innerGroup = new paper.Group(inner.concat(subgroup, boxHack));
        innerGroup.turn = function(angle) {
          var circ, _j, _len2, _results;
          innerGroup.position = outer.position;
          innerGroup.rotate(angle, outer.position.x, outer.position.y);
          _results = [];
          for (_j = 0, _len2 = subgroup.length; _j < _len2; _j++) {
            circ = subgroup[_j];
            _results.push(circ.turn(angle));
          }
          return _results;
        };
        return innerGroup;
      }
    };
    start = new Date();
    outer = Circ(128, 128, 127, '#FF6A00', '#0A4500', 2);
    inner = genFractal(outer, 4);
    paper.view.onFrame = function(event) {
      var count, delta, time;
      count = event.count, time = event.time, delta = event.delta;
      if (count < 360) return inner.turn(0.5);
    };
    end = new Date();
    return console.log("time: ", (end - start) / 1000, "s");
  };

}).call(this);
