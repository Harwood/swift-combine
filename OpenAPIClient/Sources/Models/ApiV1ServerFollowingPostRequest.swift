//
// ApiV1ServerFollowingPostRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1ServerFollowingPostRequest: Codable {
    public var hosts: [String]?
    public var handles: [String]?

    public init(hosts: [String]? = nil, handles: [String]? = nil) {
        self.hosts = hosts
        self.handles = handles
    }
}