## Graph
meff's graph task is rendering graph as html.

You ready csv file that first column is `date` as `yyyy-MM-dd`, Numeric data from the 2nd column onwards.


* Graph setting is default version.

```
meff graph {csv file path}
```


### Option
* Graph setting is custom version.

```
meff graph {csv file path} --setting-file {setting file path}
```

### About Graph setting file
Graph setting file is JSON file.

A Template file is this repository's top directory `settings.json.template`.

You can specify some graph's stuff.

* `title` - Graph title.
* `size` - Graph marker size.
* `width` - Width of graph area.
* `height` - height of graph area.
* `colors` - Line color.
