//
// ApiV1VideosIdPasswordsPutRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1VideosIdPasswordsPutRequest: Codable {
    public var passwords: [String]?

    public init(passwords: [String]? = nil) {
        self.passwords = passwords
    }
}