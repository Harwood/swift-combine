//
// PlaylistElement.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct PlaylistElement: Codable {
    public var position: Int?
    public var startTimestamp: Int?
    public var stopTimestamp: Int?
    public var video: Video?

    public init(position: Int? = nil, startTimestamp: Int? = nil, stopTimestamp: Int? = nil, video: Video? = nil) {
        self.position = position
        self.startTimestamp = startTimestamp
        self.stopTimestamp = stopTimestamp
        self.video = video
    }
}
