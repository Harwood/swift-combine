//
// GetVideoCaptions200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct GetVideoCaptions200Response: Codable {
    public var total: Int?
    public var data: [VideoCaption]?

    public init(total: Int? = nil, data: [VideoCaption]? = nil) {
        self.total = total
        self.data = data
    }
}
