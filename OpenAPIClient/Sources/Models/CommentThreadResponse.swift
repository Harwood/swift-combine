//
// CommentThreadResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct CommentThreadResponse: Codable {
    public var total: Int?
    public var data: [VideoComment]?

    public init(total: Int? = nil, data: [VideoComment]? = nil) {
        self.total = total
        self.data = data
    }
}
