//
// ServerConfigAutoBlacklist.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerConfigAutoBlacklist: Codable {
    public var videos: ServerConfigAutoBlacklistVideos?

    public init(videos: ServerConfigAutoBlacklistVideos? = nil) {
        self.videos = videos
    }
}
