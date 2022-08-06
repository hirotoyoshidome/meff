import unittest
import core/calc
import core/vector
import libs/constants
import std/math


test "avg-1":
  let x: Vec2 = [170.0, 60.0]
  let y: Vec2 = [175.0, 70.0]
  let z: Vec2 = [180.0, 80.0]

  var v: seq[Vec2]
  v.add(x)
  v.add(y)
  v.add(z)
  var vLen: float = float(v.len)
  let actual: seq[float] = avg(v, vLen)
  let expected: seq[float] = @[175.0, 70.0]
  check actual == expected

test "standard_deviation-1":
  let x: Vec2 = [170.0, 60.0]
  let y: Vec2 = [175.0, 70.0]
  let z: Vec2 = [180.0, 80.0]

  var v: seq[Vec2]
  v.add(x)
  v.add(y)
  v.add(z)
  var vLen: float = float(v.len)
  let avg: seq[float] = avg(v, vLen)
  let res: seq[float] = standard_deviation(v, avg, vLen)
  var actual: seq[float]
  for r in res:
    actual.add(round(r, 4))
  let expected: seq[float] = @[4.0825, 8.1650]
  check actual == expected

test "covariance-1":
  let x: Vec2 = [170.0, 60.0]
  let y: Vec2 = [175.0, 70.0]
  let z: Vec2 = [180.0, 80.0]

  var v: seq[Vec2]
  v.add(x)
  v.add(y)
  v.add(z)
  var vLen: float = float(v.len)
  let avg: seq[float] = avg(v, vLen)
  let actual: float = round(covariance(v, avg, vLen), 4)
  let expected: float = 33.3333
  check actual == expected

test "correlation-1":
  let x: Vec2 = [170.0, 60.0]
  let y: Vec2 = [175.0, 70.0]
  let z: Vec2 = [180.0, 80.0]

  var v: seq[Vec2]
  v.add(x)
  v.add(y)
  v.add(z)

  let actual: float = correlation(v)
  let expected: float = 1.0
  check actual == expected
