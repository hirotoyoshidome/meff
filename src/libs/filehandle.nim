import std/parsecsv
import std/streams
import std/json
import ../core/vector
import constants
import strutils
import errors


proc readCsv*(filepath: string, execType: string): (seq[Vec2], seq[string]) =
  # read data as CSV file.
  var st = newFileStream(filepath, FileMode.fmRead)
  if st == nil:
    quit("File is not Exists, or File can't open with Current Permission.")

  var p: CsvParser
  open(p, st, filePath)

  # TODO now only Vec2. (current implementation is colNum 3 only.)
  var data: seq[Vec2]
  var dateSeq: seq[string]

  if parseEnum[EXEC_TYPE](execType) == CORRELATION or parseEnum[EXEC_TYPE](execType) == GRAPH:
    var columns: seq[string]
    if readRow(p):
      columns = p.row
    let colNum: int = columns.len
    if colNum >= 3 and columns[0] == DATE_COL_NAME:
      # TODO current implementation is colNum 3 only.
      while readRow(p):
        var date: string = p.row[0]
        var v: Vec2 = [parseFloat(p.row[1]), parseFloat(p.row[2])]
        data.add(v)
        dateSeq.add(date)
    else:
      echo DATA_CSV_FORMAT_ERROR
      quit(1)

  close(p)
  return (data, dateSeq)

proc readSettingJson*(filepath: string): GraphOption =
  # read setting file as JSON (for graph).
  var jsonStr: string = parseFile(filepath).pretty
  var obj = parseJson(jsonStr)
  obj = obj["graph"]

  # TODO: add validation.

  var colors: seq[string]
  for c in obj["colors"].getElems():
    colors.add(c.getStr())
  let option: GraphOption = GraphOption(
    title: obj["title"].getStr(),
    size:  obj["size"].getInt(),
    width: obj["width"].getInt(),
    height: obj["height"].getInt(),
    colors: colors
  )

  return option
