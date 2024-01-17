//
// AddVideoPlaylistVideoRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct AddVideoPlaylistVideoRequest: Codable {
    public var videoId: AddVideoPlaylistVideoRequestVideoId
    /// Start the video at this specific timestamp
    public var startTimestamp: Int?
    /// Stop the video at this specific timestamp
    public var stopTimestamp: Int?

    public init(videoId: AddVideoPlaylistVideoRequestVideoId, startTimestamp: Int? = nil, stopTimestamp: Int? = nil) {
        self.videoId = videoId
        self.startTimestamp = startTimestamp
        self.stopTimestamp = stopTimestamp
    }
}
