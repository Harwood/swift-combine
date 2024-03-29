//
// ApiV1RunnersJobsJobUUIDUpdatePostRequestPayload.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// Provide live transcoding chunks update 
public struct ApiV1RunnersJobsJobUUIDUpdatePostRequestPayload: Codable {
    public enum ModelType: String, Codable, CaseIterable {
        case addChunk = "add-chunk"
        case removeChunk = "remove-chunk"
    }
    public var type: ModelType?
    public var masterPlaylistFile: Data?
    public var resolutionPlaylistFile: Data?
    public var resolutionPlaylistFilename: String?
    public var videoChunkFile: Data?
    public var videoChunkFilename: String?

    public init(type: ModelType? = nil, masterPlaylistFile: Data? = nil, resolutionPlaylistFile: Data? = nil, resolutionPlaylistFilename: String? = nil, videoChunkFile: Data? = nil, videoChunkFilename: String? = nil) {
        self.type = type
        self.masterPlaylistFile = masterPlaylistFile
        self.resolutionPlaylistFile = resolutionPlaylistFile
        self.resolutionPlaylistFilename = resolutionPlaylistFilename
        self.videoChunkFile = videoChunkFile
        self.videoChunkFilename = videoChunkFilename
    }
}
