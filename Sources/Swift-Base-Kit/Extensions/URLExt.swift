//
//  URLExt.swift
//  AppleCore
//
//  Created by Richard Torcato on 2022-11-19.
//

import Foundation

extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }
        self = url
    }
}
