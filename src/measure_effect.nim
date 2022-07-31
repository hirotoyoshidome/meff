import libs/fileHandleUtils
import libs/constants
import libs/validations
import libs/errors
import std/os


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

  if execType == "correlation":
    # read setting file.
    if isExistFile(SETTING_FILEPATH):
      readSettingJson(SETTING_FILEPATH)
    else:
      echo "Setting file" & FILE_NOT_EXISTS
      quit(1)

    # read data file.
    let dataFilePath = "./examples/sample.csv"
    if isExistFile(dataFilePath):
      readCsv(dataFilePath)
    else:
      echo "Data file" & FILE_NOT_EXISTS
      quit(1)


when isMainModule:
  main()

