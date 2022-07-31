import vector

proc avg(v: seq[Vec2]): seq[float] =
  # calc average from vector data.
  var xSum: float = 0
  var ySum: float = 0
  let vLen: float = float(v.len)
  for row in v:
    xSum = xSum + row[0]
    ySum = ySum + row[1]
  return @[xSum / vLen, ySum / vLen]

proc correlation*(v: seq[Vec2]) =
  # calc correlation from vector data.
  let avgSeq: seq[float] = avg(v)
  echo avgSeq

  # TODO calc

