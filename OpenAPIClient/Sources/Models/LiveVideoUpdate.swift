//
// LiveVideoUpdate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct LiveVideoUpdate: Codable {
    public var saveReplay: Bool?
    public var replaySettings: LiveVideoReplaySettings?
    /// User can stream multiple times in a permanent live
    public var permanentLive: Bool?
    public var latencyMode: LiveVideoLatencyMode?

    public init(saveReplay: Bool? = nil, replaySettings: LiveVideoReplaySettings? = nil, permanentLive: Bool? = nil, latencyMode: LiveVideoLatencyMode? = nil) {
        self.saveReplay = saveReplay
        self.replaySettings = replaySettings
        self.permanentLive = permanentLive
        self.latencyMode = latencyMode
    }
}
