import plotly
import chroma
import vector
import ../libs/constants
import std/tables


proc showGraph*(v: seq[Vec2], dates: seq[string], option: GraphOption) =
  # show graph.
  let c1: seq[float] = COLORS[option.colors[0]]
  let c2: seq[float] = COLORS[option.colors[1]]
  let color1: seq[Color] = @[Color(r: c1[0], g: c1[1], b: c1[2], a: c1[3])]
  var color2: seq[Color] = @[Color(r: c2[0], g: c2[1], b: c2[2], a: c2[3])]

  var d1 = Trace[int](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
  var d2 = Trace[int](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
  let size = @[option.size.int]
  d1.marker = Marker[int](size: size, color: color1)
  d2.marker = Marker[int](size: size, color: color2)

  var x: seq[int]
  var y1: seq[int]
  var y2: seq[int]
  var i: int = 1
  for row in v:
    y1.add(int(row[0]))
    y2.add(int(row[1]))
    x.add(i)
    i = i + 1

  d1.xs = x
  d1.ys = y1
  d2.xs = x
  d2.ys = y2
  d1.text = dates
  d2.text = dates
  
  let layout = Layout(title: option.title, width: option.width, height: option.height, xaxis: Axis(title:"x"), yaxis: Axis(title:"y"),autosize:false)
  let p = Plot[int](layout: layout, traces: @[d1, d2])
  p.show()
