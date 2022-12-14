import libs/filehandle
import libs/constants
import libs/validator
import libs/errors
import std/os
import std/strutils
import core/vector
import core/calc
import core/graph


proc showHelp() =
  echo """First argument :
  correlation - calc corrrelation.
  graph       - show graph as html.
  help        - show help.
Graph option :
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

  if not checkExecType(execType):
    echo ERROR & execType & NO_EXEC_TYPE
    quit(1)

  if parseEnum[EXEC_TYPE](execType) == EXEC_TYPE.HELP:
    showHelp()
    quit(0)
  elif parseEnum[EXEC_TYPE](execType) == EXEC_TYPE.CORRELATION:
    if pCount >= 2:
      # read data file.
      let dataFilePath = paramStr(2)
      if isExistFile(dataFilePath):
        let (data, dateSeq) = readCsv(dataFilePath, execType)
        discard dateSeq

        let correl: float = correlation(data)
        echo correl
      else:
        echo ERROR & "Data file" & FILE_NOT_EXISTS
        quit(1)
    else:
      echo ERROR & NO_DATA_FILE_PATH
      quit(1)
  elif parseEnum[EXEC_TYPE](execType) == EXEC_TYPE.GRAPH:
    if 2 <= pCount and pCount <= 4:
      # read data file.
      let dataFilePath = paramStr(2)
      var data: seq[Vec2]
      var dateSeq: seq[string]
      if isExistFile(dataFilePath):
        (data, dateSeq) = readCsv(dataFilePath, execType)
      else:
        echo ERROR & "Data file" & FILE_NOT_EXISTS
        quit(1)

      var option: GraphOption
      if pCount == 2:
        option = GraphOption(
          title: DEFAULT_GRAPH_TITLE,
          size:  DEFAULT_GRAPH_SIZE,
          width: DEFAULT_GRAPH_WIDTH,
          height: DEFAULT_GRAPH_HEIGHT,
          colors: DEFAULT_GRAPH_COLORS
        )
      if pCount == 3:
        let settingPath: string = paramStr(3)
        if GRAPH_OPTION_SETTING_FILE in settingPath or GRAPH_OPTION_SETTING_FILE_ALIAS in settingPath:
          var settingPathVal: string = settingPath.replace(GRAPH_OPTION_SETTING_FILE, "").replace(GRAPH_OPTION_SETTING_FILE_ALIAS, "")
          if settingPathVal.len > 0:
            if isExistFile(settingPathVal):
              option = readSettingJson(settingPathVal)
            else:
              echo ERROR & "Setting File" & FILE_NOT_EXISTS
              quit(1)
          else:
            echo ERROR & SETTING_FILE_VALUE_ERROR
            quit(1)
        else:
          echo ERROR & SETTING_FILE_VALUE_ERROR
          quit(1)
      if pCount == 4:
        let settingPath: string = paramStr(3)
        if GRAPH_OPTION_SETTING_FILE == settingPath or GRAPH_OPTION_SETTING_FILE_ALIAS == settingPath:
          var settingPathVal: string = paramStr(4)
          if isExistFile(settingPathVal):
            option = readSettingJson(settingPathVal)
          else:
            echo ERROR & "Setting File" & FILE_NOT_EXISTS
            quit(1)
        else:
          echo ERROR & SETTING_FILE_VALUE_ERROR
          quit(1)
      # show.
      showGraph(data, dateSeq, option)
    else:
      echo ERROR & NO_DATA_FILE_PATH
      quit(1)

    quit(0)


when isMainModule:
  main()
