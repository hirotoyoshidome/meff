# Package

version       = "0.1.0"
author        = "hirotoyoshidome"
description   = "meff is a cli tool measuring the effect of web services."
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
binDir        = "bin"
bin           = @["meff"]

# Dependencies

requires "nim >= 1.4"
requires "plotly >= 0.3.2"
