//
// PutVideoPlaylistVideoRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct PutVideoPlaylistVideoRequest: Codable {
    /// Start the video at this specific timestamp
    public var startTimestamp: Int?
    /// Stop the video at this specific timestamp
    public var stopTimestamp: Int?

    public init(startTimestamp: Int? = nil, stopTimestamp: Int? = nil) {
        self.startTimestamp = startTimestamp
        self.stopTimestamp = stopTimestamp
    }
}