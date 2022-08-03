const SETTING_FILEPATH*: string = "./settings.json"
type
  EXEC_TYPE* {.pure.} = enum
    HELP          = "help"
    CORRELATION   = "correlation"
    GRAPH         = "graph"

const GRAPH_OPTION_SETTING_FILE*: string = "--setting-file"

const DATE_COL_NAME*: string = "date"

