import std/os


proc isExistFile*(filepath: string): bool =
  if existsFile(filepath):
    return true
  else:
    return false

