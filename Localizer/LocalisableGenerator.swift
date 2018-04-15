//
//  LocalisableGenerator.swift
//  Localizer
//
//  Created by Dan Leonard on 4/6/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

import Foundation

class LocalisableGenerator {

    /// Generates Localisable.strings file and then generates the Resourece Enum
    func regenerateLocalizableStringFile() {
        var newData: String
        let bundle = Bundle(for: type(of: self))
        guard let urlToLocalizable = bundle.url(forResource: "Localisable", withExtension: "strings") else {
            assertionFailure("Could not find localisable.strings file")
            return
        }

        let allValues = Array(Set(NSDictionary(contentsOf:urlToLocalizable)!.allValues as! [String]))
        newData = allValues.flatMap{ getCommentAndEntry(value: $0) }.joined()

        writeData(newData, path: urlToLocalizable) { _ in
            ResourceGenerator().generate()
        }
    }


    /// Helper function for cleaning up strings file. Sorts results by Key
    func regenerateLocalizableStringFileSortedByKey() {
        var newData: String
        guard let dict = NSDictionary(contentsOf: urlToLocalizable) else {
            assertionFailure("could not parse Localisable.file")
            return
        }
        let allValues = Array(dict
            .flatMap{ $0 })
            .sorted{ ($0.1 as! String) < ($1.1 as! String )}

        newData = allValues.flatMap{getCommentAndEntry(key: ($0.0 as! String), value: ($0.1 as! String))}.joined()

        writeData(newData, path: urlToLocalizable) { _ in
            ResourceGenerator().generate()
        }
    }

    func getCommentAndEntry(key: String? = nil, value rawValue: String) -> String? {
        return "\n/** \(rawValue.camelCased.exscapeNewLine) **/\n\"\(key ?? rawValue.camelCased)\" = \"\(rawValue.exscapeNewLine)\";\n"
    }
}
