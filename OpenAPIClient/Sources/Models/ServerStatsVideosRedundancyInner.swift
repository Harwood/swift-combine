//
// ServerStatsVideosRedundancyInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerStatsVideosRedundancyInner: Codable {
    public var strategy: String?
    public var totalSize: Double?
    public var totalUsed: Double?
    public var totalVideoFiles: Double?
    public var totalVideos: Double?

    public init(strategy: String? = nil, totalSize: Double? = nil, totalUsed: Double? = nil, totalVideoFiles: Double? = nil, totalVideos: Double? = nil) {
        self.strategy = strategy
        self.totalSize = totalSize
        self.totalUsed = totalUsed
        self.totalVideoFiles = totalVideoFiles
        self.totalVideos = totalVideos
    }
}