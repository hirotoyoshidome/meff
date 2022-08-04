const SETTING_FILEPATH*: string = "./settings.json"
type
  EXEC_TYPE* {.pure.} = enum
    HELP          = "help"
    CORRELATION   = "correlation"
    GRAPH         = "graph"

  # FIXME: private.
  GraphOption* = ref object of RootObj
    title*: string
    size*: int
    width*: int
    height*: int
    colors*: seq[string]


const GRAPH_OPTION_SETTING_FILE*: string = "--setting-file"

const DATE_COL_NAME*: string = "date"

# graph option default.
const DEFAULT_GRAPH_TITLE*: string = "default"
const DEFAULT_GRAPH_SIZE*: int = 8
const DEFAULT_GRAPH_WIDTH*: int = 1200
const DEFAULT_GRAPH_HEIGHT*: int = 400
const DEFAULT_GRAPH_COLORS*: seq[string] = @["orange", "green"]
