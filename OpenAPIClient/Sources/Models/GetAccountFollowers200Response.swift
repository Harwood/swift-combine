//
// GetAccountFollowers200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct GetAccountFollowers200Response: Codable {
    public var total: Int?
    public var data: [Follow]?

    public init(total: Int? = nil, data: [Follow]? = nil) {
        self.total = total
        self.data = data
    }
}
