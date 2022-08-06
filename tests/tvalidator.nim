import unittest
import libs/validator


test "isExistFile-1":
    let filepath = "./tests/testdata/isExistFile-1.txt"
    let actual: bool = isExistFile(filepath)
    let expected: bool = true
    check actual == expected

test "isExistFile-2":
    let filepath = "./dummy"
    let actual: bool = isExistFile(filepath)
    let expected: bool = false
    check actual == expected
