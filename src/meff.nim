import libs/fileHandleUtils
import libs/constants
import libs/validations
import libs/errors
import std/os
import std/strutils

proc showHelp() =
  echo """
  first argument :
    correlation - calc corrrelation.
    graph       - show graph as html.
    help        - show help.
  """

proc main() =
  let pCount: int = paramCount()
  var execType: string
  if pCount == 0:
    showHelp()
    quit(0)
  elif pCount >= 1:
    execType = paramStr(1)


#   # read setting file.
#   if isExistFile(SETTING_FILEPATH):
#     readSettingJson(SETTING_FILEPATH)
#   else:
#     echo "Setting file" & FILE_NOT_EXISTS
#     quit(1)

  if parseEnum[EXEC_TYPE](execType) == HELP:
    showHelp()
    quit(0)
  elif parseEnum[EXEC_TYPE](execType) == CORRELATION:
    if pCount == 2:
      # read data file.
      let dataFilePath = paramStr(2)
      if isExistFile(dataFilePath):
        readCsv(dataFilePath, execType)
      else:
        echo "Data file" & FILE_NOT_EXISTS
        quit(1)
    else:
      echo "Please Data file path as Second argument."
      quit(1)
  elif parseEnum[EXEC_TYPE](execType) == GRAPH:
    if pCount == 2:
      # read daa file.
      let dataFilePath = paramStr(2)
      if isExistFile(dataFilePath):
        readCsv(dataFilePath, execType)
      else:
        echo "Data file" & FILE_NOT_EXISTS
        quit(1)
    else:
      echo "Please Data file path as Second argument."
      quit(1)

    quit(0)


when isMainModule:
  main()

