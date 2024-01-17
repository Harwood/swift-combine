//
// VideoImportsList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoImportsList: Codable {
    public var total: Int?
    public var data: [VideoImport]?

    public init(total: Int? = nil, data: [VideoImport]? = nil) {
        self.total = total
        self.data = data
    }
}
