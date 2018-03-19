//
//  url.swift
//  Localizer
//
//  Created by Dan Leonard on 3/6/18.
//  Copyright © 2018 MacMeDan. All rights reserved.
//

import Foundation

extension URL {
    public func appendingPathComponents(_ pathComponents: [String]) -> URL {
        return pathComponents.enumerated().reduce(self) { url, pair in
            return url.appendingPathComponent(pair.element, isDirectory: pair.offset + 1 < pathComponents.count)
        }
    }
}
