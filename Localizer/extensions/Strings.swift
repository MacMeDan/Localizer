//
//  Strings.swift
//  Localizer
//
//  Created by Dan Leonard on 3/6/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

import Foundation

extension String {

    var camelCased: String { // Make a sentence camel -> makeASentenceCamel
        var componets = self.components(separatedBy: " ")
        //Filter invalid charicters before adding capitalization
        componets = componets.flatMap{ $0.validChars == "" ? nil : $0.validChars }
        guard let first = componets.first?.lowercased() else { return "" }
        if componets.count == 1 { return "\(first)"}
        let rest = componets.count > 10 ? componets[1...10].flatMap{ $0.capitalized }.joined() : componets.dropFirst().flatMap{ $0.capitalized }.joined()
        return "\(first)\(rest)"
    }

    var validChars: String {
        return String(describing: filter {
            String($0).rangeOfCharacter(from: .alphanumerics) != nil
        })
    }

    var exscapeNewLine: String {
        return self.replacingOccurrences(of: "\n", with: "\\n")
    }

}
