//
// ApiV1AbusesPostRequestVideo.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1AbusesPostRequestVideo: Codable {
    public var id: Int?
    /// Timestamp in the video that marks the beginning of the report
    public var startAt: Int?
    /// Timestamp in the video that marks the ending of the report
    public var endAt: Int?

    public init(id: Int? = nil, startAt: Int? = nil, endAt: Int? = nil) {
        self.id = id
        self.startAt = startAt
        self.endAt = endAt
    }
}