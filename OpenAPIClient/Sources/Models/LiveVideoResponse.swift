//
// LiveVideoResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct LiveVideoResponse: Codable {
    /// Included in the response if an appropriate token is provided
    public var rtmpUrl: String?
    /// Included in the response if an appropriate token is provided
    public var rtmpsUrl: String?
    /// RTMP stream key to use to stream into this live video. Included in the response if an appropriate token is provided
    public var streamKey: String?
    public var saveReplay: Bool?
    public var replaySettings: LiveVideoReplaySettings?
    /// User can stream multiple times in a permanent live
    public var permanentLive: Bool?
    public var latencyMode: LiveVideoLatencyMode?

    public init(rtmpUrl: String? = nil, rtmpsUrl: String? = nil, streamKey: String? = nil, saveReplay: Bool? = nil, replaySettings: LiveVideoReplaySettings? = nil, permanentLive: Bool? = nil, latencyMode: LiveVideoLatencyMode? = nil) {
        self.rtmpUrl = rtmpUrl
        self.rtmpsUrl = rtmpsUrl
        self.streamKey = streamKey
        self.saveReplay = saveReplay
        self.replaySettings = replaySettings
        self.permanentLive = permanentLive
        self.latencyMode = latencyMode
    }
}
