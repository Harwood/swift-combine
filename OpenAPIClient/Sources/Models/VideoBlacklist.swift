//
// VideoBlacklist.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoBlacklist: Codable {
    public var id: Int?
    public var videoId: Int?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var name: String?
    public var uuid: UUID?
    public var description: String?
    public var duration: Int?
    public var views: Int?
    public var likes: Int?
    public var dislikes: Int?
    public var nsfw: Bool?

    public init(id: Int? = nil, videoId: Int? = nil, createdAt: Date? = nil, updatedAt: Date? = nil, name: String? = nil, uuid: UUID? = nil, description: String? = nil, duration: Int? = nil, views: Int? = nil, likes: Int? = nil, dislikes: Int? = nil, nsfw: Bool? = nil) {
        self.id = id
        self.videoId = videoId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.uuid = uuid
        self.description = description
        self.duration = duration
        self.views = views
        self.likes = likes
        self.dislikes = dislikes
        self.nsfw = nsfw
    }
}