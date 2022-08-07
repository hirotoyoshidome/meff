import std/os
import std/strutils
import constants


proc isExistFile*(filepath: string): bool =
  # check file exists.
  if fileExists(filepath):
    return true
  else:
    return false

proc isFloat*(val: string): bool =
  # check able to cast val as float.
  try:
    discard parseFloat(val)
    return true
  except Exception:
    return false

proc isInt*(val: string): bool =
  # check able to cast val as int.
  try:
    discard parseInt(val)
    return true
  except Exception:
    return false

proc checkExecType*(execType: string): bool =
  # check exec type.
  try:
    discard parseEnum[EXEC_TYPE](execType)
    return true
  except Exception:
    return false
