import libs/fileHandleUtils
import libs/constants

proc main() =
  echo "start..."
  echo "read setting file."
  readSettingJson(SETTING_FILEPATH)

  let dataFilePath = "./examples/sample.csv"
  readCsv(dataFilePath)
  echo "done."



when isMainModule:
  main()

