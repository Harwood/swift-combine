//
// GetJobs200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct GetJobs200Response: Codable {
    public var total: Int?
    public var data: [Job]?

    public init(total: Int? = nil, data: [Job]? = nil) {
        self.total = total
        self.data = data
    }
}
