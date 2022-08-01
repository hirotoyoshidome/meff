import vector
import std/math


proc avg(v: seq[Vec2], vLen: float): seq[float] =
  # calc average from vector data.
  var xSum: float = 0
  var ySum: float = 0
  for row in v:
    xSum = xSum + row[0]
    ySum = ySum + row[1]
  return @[xSum / vLen, ySum / vLen]

proc standard_deviation(v: seq[Vec2], avg: seq[float], vLen: float): seq[float] =
  var xSum: float = 0
  var ySum: float = 0
  for row in v:
    xSum = xSum + pow(row[0] - avg[0], 2)
    ySum = ySum + pow(row[1] - avg[1], 2)
  let sdx = sqrt(xSum/vLen)
  let sdy = sqrt(ySum/vLen)
  return @[sdx, sdy]

proc covariance(v: seq[Vec2], avg: seq[float], vLen: float): float =
  var xySum: float = 0
  for row in v:
    xySum = xySum + ((row[0] - avg[0]) * (row[1] - avg[1]))
  return xySum / vLen

proc correlation*(v: seq[Vec2]): float =
  # calc correlation from vector data.
  let vLen: float = float(v.len)
  let avgSeq: seq[float] = avg(v, vLen)
  let sdSeq: seq[float] = standard_deviation(v, avgSeq, vLen)
  let co: float = covariance(v, avgSeq, vLen)

  let correl: float = co / (avgSeq[0] * avgSeq[1])
  return correl

