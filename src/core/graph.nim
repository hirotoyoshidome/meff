import plotly
import chroma
import vector


proc showGraph*(v: seq[Vec2], dates: seq[string]) =
  # show graph.
  let color1 = @[Color(r:0.9, g:0.4, b:0.0, a: 1.0)]
  let color2 = @[Color(r:0.2, g:0.9, b:0.2, a: 1.0)]
  var d1 = Trace[int](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
  var d2 = Trace[int](mode: PlotMode.LinesMarkers, `type`: PlotType.Scatter)
  let size = @[8.int]
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
  
  let layout = Layout(title: "sample", width: 1200, height: 400, xaxis: Axis(title:"x"), yaxis: Axis(title:"y"),autosize:false)
  let p = Plot[int](layout: layout, traces: @[d1, d2])
  p.show()
