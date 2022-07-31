import std/parsecsv
import std/streams
import std/strutils


proc readCsv*(filepath: string) =
  var st = newFileStream(filepath, FileMode.fmRead)
  if st == nil:
    quit("File is not Exists, or File can't open with Current Permission.")

  var p: CsvParser
  open(p, st, filePath)

  while readRow(p):
    echo p.row
  close(p)

