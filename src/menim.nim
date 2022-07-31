import libs/fileHandleUtils
import libs/constants
import libs/validations
import libs/errors
import std/os
import std/strutils


proc showHelp() =
  echo """
  first argument :
    correlation - cacl corrrelation.
    help        - show help.
  """

proc main() =
  let pCount: int = paramCount()
  var execType: string
  if pCount == 0:
    showHelp()
    quit(0)
  elif pCount == 1:
    execType = paramStr(1)

  if parseEnum[EXEC_TYPE](execType) == HELP:
    showHelp()
    quit(0)
  elif parseEnum[EXEC_TYPE](execType) == CORRELATION:
    # read setting file.
    if isExistFile(SETTING_FILEPATH):
      readSettingJson(SETTING_FILEPATH)
    else:
      echo "Setting file" & FILE_NOT_EXISTS
      quit(1)

    # read data file.
    let dataFilePath = "./examples/sample.csv"
    if isExistFile(dataFilePath):
      readCsv(dataFilePath, execType)
    else:
      echo "Data file" & FILE_NOT_EXISTS
      quit(1)
    quit(0)


when isMainModule:
  main()

