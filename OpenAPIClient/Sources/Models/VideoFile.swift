//
// VideoFile.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoFile: Codable {
    public var id: Int?
    /// magnet URI allowing to resolve the video via BitTorrent without a metainfo file
    public var magnetUri: String?
    public var resolution: VideoResolutionConstant?
    /// Video file size in bytes
    public var size: Int?
    /// Direct URL of the torrent file
    public var torrentUrl: String?
    /// URL endpoint that transfers the torrent file as an attachment (so that the browser opens a download dialog)
    public var torrentDownloadUrl: String?
    /// Direct URL of the video
    public var fileUrl: String?
    /// URL endpoint that transfers the video file as an attachment (so that the browser opens a download dialog)
    public var fileDownloadUrl: String?
    /// Frames per second of the video file
    public var fps: Double?
    /// URL dereferencing the output of ffprobe on the file
    public var metadataUrl: String?

    public init(id: Int? = nil, magnetUri: String? = nil, resolution: VideoResolutionConstant? = nil, size: Int? = nil, torrentUrl: String? = nil, torrentDownloadUrl: String? = nil, fileUrl: String? = nil, fileDownloadUrl: String? = nil, fps: Double? = nil, metadataUrl: String? = nil) {
        self.id = id
        self.magnetUri = magnetUri
        self.resolution = resolution
        self.size = size
        self.torrentUrl = torrentUrl
        self.torrentDownloadUrl = torrentDownloadUrl
        self.fileUrl = fileUrl
        self.fileDownloadUrl = fileDownloadUrl
        self.fps = fps
        self.metadataUrl = metadataUrl
    }
}
