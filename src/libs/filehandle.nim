import std/parsecsv
import std/streams
import std/json
import ../core/vector
import constants
import strutils
import errors
import validator


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
      var i: int = 1
      while readRow(p):
        if isFloat(p.row[1]) and isFloat(p.row[2]):
          let date: string = p.row[0]
          let v: Vec2 = [parseFloat(p.row[1]), parseFloat(p.row[2])]
          data.add(v)
          dateSeq.add(date)
        else:
          echo WARNING & i.intToStr & "row: " & DATA_CSV_FORMAT_ERROR
        i = i + 1
    else:
      echo ERROR & DATA_CSV_FORMAT_ERROR
      quit(1)

  close(p)
  return (data, dateSeq)

proc readSettingJson*(filepath: string): GraphOption =
  # read setting file as JSON (for graph).
  var jsonStr: string = parseFile(filepath).pretty
  var obj = parseJson(jsonStr)

  if not obj.hasKey("graph"):
    echo ERROR & SETTING_FILE_FORMAT_ERROR
    quit(1)

  obj = obj["graph"]

  var errorMessages: seq[string]
  if not obj.hasKey("colors"):
    errorMessages.add("colors" & SETTING_FILE_COLUMN_ERROR)
  if not obj.hasKey("title"):
    errorMessages.add("title" & SETTING_FILE_COLUMN_ERROR)
  if not obj.hasKey("size"):
    errorMessages.add("size" & SETTING_FILE_COLUMN_ERROR)
  if not obj.hasKey("width"):
    errorMessages.add("width" & SETTING_FILE_COLUMN_ERROR)
  if not obj.hasKey("height"):
    errorMessages.add("height" & SETTING_FILE_COLUMN_ERROR)

  if errorMessages.len > 0:
    echo ERROR
    for e in errorMessages:
      echo e
    quit(1)

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
