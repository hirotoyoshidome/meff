## Graph
`graph` task render graph as html.

You ready a CSV file.
* 1st column: Column name is `date`, Value is formatted `yyyy-MM-dd`
* 2nd column -: Column name is anything, Value is numeric data.


### Command

```
meff graph {csv file path}
```


### Option
* You can change some graph style.

```
meff graph {csv file path} --setting-file {setting file path}
```

Or Alias version.

```
meff graph {csv file path} -s {setting file path}
```

### About Graph setting file
A Graph setting file is JSON format.

There is a template file (`settings.json.template`) at root directory of this repository.

You can specify some value is below.

* `title` - Graph Title.
* `size` - Graph Marker Size.
* `width` - Width of Graph Area.
* `height` - Height of Graph Area.
* `colors` - Line Color. You can choose below colors.
  * red
  * blue
  * green
  * orange
