//
// ServerConfigTrending.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerConfigTrending: Codable {
    public var videos: ServerConfigTrendingVideos?

    public init(videos: ServerConfigTrendingVideos? = nil) {
        self.videos = videos
    }
}
