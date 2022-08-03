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
  graph option :
    --setting-file setting.json
  """

proc main() =
  let pCount: int = paramCount()
  var execType: string
  if pCount == 0:
    showHelp()
    quit(0)
  elif pCount >= 1:
    execType = paramStr(1)

  if parseEnum[EXEC_TYPE](execType) == EXEC_TYPE.HELP:
    showHelp()
    quit(0)
  elif parseEnum[EXEC_TYPE](execType) == EXEC_TYPE.CORRELATION:
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
  elif parseEnum[EXEC_TYPE](execType) == EXEC_TYPE.GRAPH:
    if 2 <= pCount and pCount <= 4:
      # read daa file.
      let dataFilePath = paramStr(2)
      if isExistFile(dataFilePath):
        readCsv(dataFilePath, execType)
      else:
        echo "Data file" & FILE_NOT_EXISTS
        quit(1)
      if pCount == 3:
        let settingPath: string = paramStr(3)
        if GRAPH_OPTION_SETTING_FILE in settingPath:
          var settingPathVal: string = settingPath.replace(GRAPH_OPTION_SETTING_FILE, "")
          if settingPathVal.len > 0:
            if isExistFile(settingPathVal):
              readSettingJson(settingPathVal)
            else:
              echo "Setting FIle" & FILE_NOT_EXISTS
              quit(1)
          else:
            echo SETTING_FILE_VALUE_ERROR
            quit(1)
        else:
          echo SETTING_FILE_VALUE_ERROR
          quit(1)
      if pCount == 4:
        let settingPath: string = paramStr(3)
        if GRAPH_OPTION_SETTING_FILE == settingPath:
          var settingPathVal: string = paramStr(4)
          if isExistFile(settingPathVal):
            readSettingJson(settingPathVal)
          else:
            echo "Setting FIle" & FILE_NOT_EXISTS
            quit(1)
        else:
          echo SETTING_FILE_VALUE_ERROR
          quit(1)
    else:
      echo "Please Data file path as Second argument."
      quit(1)

    quit(0)


when isMainModule:
  main()

