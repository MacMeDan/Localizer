//
//  main.swift
//  Locoliziation
//
//  Created by Dan Leonard on 3/5/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

/*
 Need to find the localizable.strings file
 Need to fine the Resources.swift File
    If the Resources.swift file does not exsist need to create it.
 */


/*
# Update this path to point to the folder you would like to scan for raw strings.
export BASE_FOLDER="${SRCROOT}/${REVEAL_SERVER_FILENAME}"

export RESOURCE_SWIFT="../Resources.swift"
export LOCALISED_STRINGS="../Localisable.strings"

./youDaBest "/Users/macmedan/Swift/auto-source-inspection/InspectionTool/Views" "../Localisable.strings" "../Resources.swift"
*/

import Foundation
var pathToProject: String
var stringFilePath: String
var resourceFilePath: String

var rootDirectory: URL
var urlToLocalizable: URL
var resouceURL: URL
var baseFolderURL: URL

var numberOfUnlocalisedStrings: Int = 0


if CommandLine.arguments.count == 1 {

    UserPrompt().askTheHardQuestions()

} else {
    
    let fileManager = FileManager.default

    rootDirectory = URL(fileURLWithPath: fileManager.currentDirectoryPath)
    print("Current directory: \(rootDirectory.absoluteString)")
    urlToLocalizable = rootDirectory.appendingPathComponent("Localisable.strings")
    resouceURL = rootDirectory.appendingPathComponent("Resource.swift")

    CommandLine.arguments.forEach { print($0) }

    let folderPath = CommandLine.arguments[1]
    baseFolderURL = URL(fileURLWithPath: folderPath)
//    let baseFolder = fileManager.enumerator(atPath: "/Users/macmedan/Swift/auto-source-inspection/InspectionTool/Views")

    let baseFolder = fileManager.enumerator(atPath: folderPath)

    while let path = baseFolder?.nextObject() as? String {

        if path.hasSuffix("swift") { // check only swift files
            FileLocalizer().findUnlocalisedStringsIn(file: path)
        }
        
    }

}

