//
//  main.swift
//  Locoliziation
//
//  Created by Dan Leonard on 3/5/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

import Foundation

func error() -> String {
    print("""
        No `:` found please try again
        """, terminator: "")
    return readLine()!
}

func containsColin(_ string: String) -> Bool {
    return string.contains(":")
}

// MARK: Setup
print("""
    Enter base path to project.

    """, terminator: "")
pathToProject = readLine()!

print("""
    Enter relative path to Localizable.strings file.

    """, terminator: "")
sourceFilePath = readLine()!

print("""
    Enter relative path to Resource.swift file.

    """, terminator: "")
resourceFilePath = readLine()!

// MARK: Options
print("""
    Please select an option:
    1) Add new entry with auto gernerated key
    2) Add new entry with specified key
    3) Generate Resources
    4) Generate Strings
    5) Generate Strings Sorted by Value not Key
    6) Find Strings in file

    """, terminator: "")
let answer = readLine()!

if answer == "1" {
    print("""
    Please enter the string you would like to locolize:

    """, terminator: "")
    let newString = readLine()!
    print("using Key: \(newString.camelCased)")
    locolizeNewString(newString)
}

if answer == "2" {
    print("""
    Please enter the Key : Value you would like to add:

    """, terminator: "")
    let newString = readLine()!

    if containsColin(newString){
        let componets = newString.components(separatedBy: ":")
        guard componets.count == 2 else {
            fatalError("Should only be 1 colin in input.")
        }
        let newKey = componets.first
        let newValue = componets.last!
        locolizeNewString(newValue, newKey: newKey)
    }
}

if answer == "3" {
    generateResourceEnum()
}

if answer == "4" {
    generateNewStringsFile()
}

if answer == "5" {
    generateNewStringsSortedByKey()
}

if answer == "6" {
    print("""
    What is the full path to the file you would like to convert

    """, terminator: "")
    let filePath = readLine()!
    findUnlocalisedStrings(fromFilePath: filePath)
}
