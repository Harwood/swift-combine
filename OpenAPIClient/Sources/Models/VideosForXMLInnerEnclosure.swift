//
// VideosForXMLInnerEnclosure.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// main streamable file for the video 
public struct VideosForXMLInnerEnclosure: Codable {
    public enum ModelType: String, Codable, CaseIterable {
        case applicationXBittorrent = "application/x-bittorrent"
    }
    public var url: String?
    public var type: ModelType?
    public var length: Int?

    public init(url: String? = nil, type: ModelType? = nil, length: Int? = nil) {
        self.url = url
        self.type = type
        self.length = length
    }
}
