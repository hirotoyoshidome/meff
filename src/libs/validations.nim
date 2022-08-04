import std/os


proc isExistFile*(filepath: string): bool =
  if fileExists(filepath):
    return true
  else:
    return false
