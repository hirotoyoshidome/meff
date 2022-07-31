import std/parsecsv
import std/streams
import std/strutils
import std/json
import std/tables


proc readCsv*(filepath: string) =
  # read data as CSV file.
  var st = newFileStream(filepath, FileMode.fmRead)
  if st == nil:
    quit("File is not Exists, or File can't open with Current Permission.")

  var p: CsvParser
  open(p, st, filePath)

  var columns: seq[string]
  if readRow(p):
    columns = p.row
  echo  columns
  echo  columns.len
  while readRow(p):
    echo p.row
  close(p)


proc readSettingJson*(filepath: string) =
  # read setting file as JSON.
  var jsonStr: string = parseFile(filepath).pretty
  var obj = parseJson(jsonStr)
  echo obj
  echo obj["title"].getStr()

