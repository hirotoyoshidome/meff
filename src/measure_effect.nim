import libs/fileHandleUtils
import libs/constants
import libs/validations
import libs/errors

proc main() =
  echo "start..."
  echo "read setting file."

  if isExistFile(SETTING_FILEPATH):
    readSettingJson(SETTING_FILEPATH)
  else:
    quit("Setting file" & FILE_NOT_EXISTS)

  let dataFilePath = "./examples/sample.csv"
  if isExistFile(dataFilePath):
    readCsv(dataFilePath)
  else:
    quit("Data file" & FILE_NOT_EXISTS)

  echo "done."



when isMainModule:
  main()

