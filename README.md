![CI](https://github.com/hirotoyoshidome/meff/actions/workflows/ci.yml/badge.svg)    
**meff** is a CLI tool measuring the Effect of Web Services Data.

### DOCUMENTATION
* [Correlation](./docs/correlation.md)
* [Graph](./docs/graph.md)

### Dependencies
* [nim-plotly](https://github.com/SciNim/nim-plotly) : meff is using this for rendering graph.

### Initialization
* If you want to use `graph` task, Please ready a setting file. (Optional)

```
cp settings.json.template settings.json
nimble install
```

### Build
* Compiling sources and out a binary(as `meff`) to `bin/` directory.

```
nimble build
```


### Installation
* A Shell file is providing. Installing a binary to `~/.local/bin` directory.

```
sh install.sh
```
