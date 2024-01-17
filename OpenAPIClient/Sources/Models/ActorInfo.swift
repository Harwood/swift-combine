//
// ActorInfo.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ActorInfo: Codable {
    public var id: Int?
    public var name: String?
    public var displayName: String?
    public var host: String?
    public var avatars: [ActorImage]?

    public init(id: Int? = nil, name: String? = nil, displayName: String? = nil, host: String? = nil, avatars: [ActorImage]? = nil) {
        self.id = id
        self.name = name
        self.displayName = displayName
        self.host = host
        self.avatars = avatars
    }
}