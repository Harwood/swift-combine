//
// ApiV1AbusesPost200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1AbusesPost200Response: Codable {
    public var abuse: ApiV1AbusesPost200ResponseAbuse?

    public init(abuse: ApiV1AbusesPost200ResponseAbuse? = nil) {
        self.abuse = abuse
    }
}