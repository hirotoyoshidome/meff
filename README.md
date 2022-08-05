![CI](https://github.com/hirotoyoshidome/meff/actions/workflows/ci.yml/badge.svg)    
**meff** is a CLI tool measuring the Effect of Web Services.

**// WARNING //**    
This Repository is not production level.

### DOCUMENTATION
* [Correlation](./docs/correlation.md)
* [Graph](./docs/graph.md)

### Dependencies
* [nim-plotly](https://github.com/SciNim/nim-plotly) : meff is using this for rendering graph.

### Initialization
* If you want use `graph` command, please set under a setting file. (Optional)

```
cp settings.json.template settings.json
nimble install
```

### Build

```
nimble build
```

Above command execute, build output at `bin` directory as `meff`.


### Installation
* Shell file is providing. `install.sh` is install to `~/.local/bin` directory.

```
sh install.sh
```
