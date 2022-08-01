import std/parsecsv
import std/streams
import std/json
import ../core/calc
import ../core/vector
import constants
import strutils
import errors


proc readCsv*(filepath: string, execType: string) =
  # read data as CSV file.
  var st = newFileStream(filepath, FileMode.fmRead)
  if st == nil:
    quit("File is not Exists, or File can't open with Current Permission.")

  var p: CsvParser
  open(p, st, filePath)

  if parseEnum[EXEC_TYPE](execType) == CORRELATION:
    var columns: seq[string]
    if readRow(p):
      columns = p.row
    #echo columns
    let colNum: int = columns.len
    if colNum >= 3 and columns[0] == DATE_COL_NAME:
      # TODO current implementation is colNum 3 only.
      var data: seq[Vec2]
      while readRow(p):
        var date = p.row[0]
        var v: Vec2 = [parseFloat(p.row[1]), parseFloat(p.row[2])]
        data.add(v)
      let correl: float = correlation(data)
      echo correl
    else:
      echo DATA_CSV_FORMAT_ERROR

  close(p)


proc readSettingJson*(filepath: string) =
  # read setting file as JSON.
  var jsonStr: string = parseFile(filepath).pretty
  var obj = parseJson(jsonStr)
  echo obj
  echo obj["title"].getStr()

