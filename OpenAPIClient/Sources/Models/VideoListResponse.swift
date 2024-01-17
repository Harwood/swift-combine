//
// VideoListResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoListResponse: Codable {
    public var total: Int?
    public var data: [Video]?

    public init(total: Int? = nil, data: [Video]? = nil) {
        self.total = total
        self.data = data
    }
}