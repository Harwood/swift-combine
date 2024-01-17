//
// ImportVideosInChannelCreate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ImportVideosInChannelCreate: Codable {
    public var externalChannelUrl: String
    /// If part of a channel sync process, specify its id to assign video imports to this channel synchronization
    public var videoChannelSyncId: Int?

    public init(externalChannelUrl: String, videoChannelSyncId: Int? = nil) {
        self.externalChannelUrl = externalChannelUrl
        self.videoChannelSyncId = videoChannelSyncId
    }
}
