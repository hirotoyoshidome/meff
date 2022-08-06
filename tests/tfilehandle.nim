import unittest
import libs/filehandle
import core/vector
import libs/constants


test "readCsv-1":
    let filepath: string = "./tests/testdata/readCsv-1.csv"
    let execType: string = "correlation"
    let (vActual, datesActual) = readCsv(filepath,execType)

    var vExpected: seq[Vec2]
    let x: seq[float] = @[1112.0, 1791.0, 1092.0, 1117.0, 1323.0, 1357.0, 1357.0]
    let y: seq[float] = @[36.0, 29.0, 27.0, 22.0, 17.0, 10.0, 15.0]
    for i in countup(0, x.len-1):
        let t: Vec2 = [x[i], y[i]]
        vExpected.add(t)

    let datesExpected: seq[string] = @[
        "2022-08-01",
        "2022-08-02",
        "2022-08-03",
        "2022-08-04",
        "2022-08-05",
        "2022-08-06",
        "2022-08-07",
    ]

    check vActual == vExpected
    check datesActual == datesExpected

test "readSettingJson-1":
    let filepath: string = "./tests/testdata/readSettingJson-1.json"
    let optionActual: GraphOption = readSettingJson(filepath)
    let optionExpected: GraphOption = GraphOption(
        title: "test",
        size:  8,
        width: 1200,
        height: 400,
        colors: @["orange", "green"]
    )

    check optionActual.title == optionExpected.title
    check optionActual.size == optionExpected.size
    check optionActual.width == optionExpected.width
    check optionActual.height == optionExpected.height
    check optionActual.colors == optionExpected.colors
