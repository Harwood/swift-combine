//
// ApiV1AbusesAbuseIdMessagesGet200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1AbusesAbuseIdMessagesGet200Response: Codable {
    public var total: Int?
    public var data: [AbuseMessage]?

    public init(total: Int? = nil, data: [AbuseMessage]? = nil) {
        self.total = total
        self.data = data
    }
}