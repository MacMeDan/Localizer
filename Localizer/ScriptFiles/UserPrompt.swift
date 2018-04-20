//
//  UserPrompt.swift
//  Localizer
//
//  Created by Dan Leonard on 4/6/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

/**
    This file provides the basic commandline user prompts and excicutes the code for the option selected
**/

class UserPrompt {

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
    func askTheHardQuestions() {

        print("""
    Enter path to base folder you would like to localize. Localizer will search this for.

    """, terminator: "")
        pathToProject = readLine()!

        print("""
    Enter relative path to Localizable.strings file.

    """, terminator: "")
        stringFilePath = readLine()!

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
            FileLocalizer().localize(newString: newString)
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
                FileLocalizer().localize(newString: newValue, newKey: newKey)
            }
        }

        if answer == "3" {
            ResourceGenerator().generate()
        }

        if answer == "4" {
            LocalisableGenerator().regenerateLocalizableStringFile()
        }

        if answer == "5" {
            LocalisableGenerator().regenerateLocalizableStringFileSortedByKey()
        }

        if answer == "6" {
            print("""
    What is the full path to the Folder you would like to convert

    """, terminator: "")
            let filePath = readLine()!
            FileLocalizer().findUnlocalisedStringsIn(file: filePath)
        }
    }
}
