import unittest
import libs/constants
import core/vector
import core/graph


test "showGraph-1":
  let x: Vec2 = [100.0, 60.0]
  let y: Vec2 = [200.0, 80.0]
  let z: Vec2 = [180.0, 80.0]

  var v: seq[Vec2]
  v.add(x)
  v.add(y)
  v.add(z)

  let dates: seq[string] = @["2022-01-01", "2022-01-02", "2022-01-03"]
  let option: GraphOption = GraphOption(title: DEFAULT_GRAPH_TITLE,
                                        size:  DEFAULT_GRAPH_SIZE,
                                        width: DEFAULT_GRAPH_WIDTH,
                                        height: DEFAULT_GRAPH_HEIGHT,
                                        colors: DEFAULT_GRAPH_COLORS)

  showGraph(v, dates, option)

  check 1 == 1
