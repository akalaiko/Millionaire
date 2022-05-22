//
//  HTMLDecodedString.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 22.05.2022.
//

import Foundation

extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil).string

        return decoded ?? self
    }
}
