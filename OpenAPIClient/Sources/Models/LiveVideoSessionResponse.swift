//
// LiveVideoSessionResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct LiveVideoSessionResponse: Codable {
    public enum ModelError: Int, Codable, CaseIterable {
        case _1 = 1
        case _2 = 2
        case _3 = 3
        case _4 = 4
        case _5 = 5
    }
    public var id: Int?
    /// Start date of the live session
    public var startDate: Date?
    /// End date of the live session
    public var endDate: Date?
    /// Error type if an error occurred during the live session:   - `1`: Bad socket health (transcoding is too slow)   - `2`: Max duration exceeded   - `3`: Quota exceeded   - `4`: Quota FFmpeg error   - `5`: Video has been blacklisted during the live 
    public var error: ModelError?
    public var replayVideo: LiveVideoSessionResponseReplayVideo?

    public init(id: Int? = nil, startDate: Date? = nil, endDate: Date? = nil, error: ModelError? = nil, replayVideo: LiveVideoSessionResponseReplayVideo? = nil) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.error = error
        self.replayVideo = replayVideo
    }
}
