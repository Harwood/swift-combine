//
// MRSSPeerLink.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct MRSSPeerLink: Codable {
    public enum ModelType: String, Codable, CaseIterable {
        case applicationXBittorrent = "application/x-bittorrent"
    }
    public var href: String?
    public var type: ModelType?

    public init(href: String? = nil, type: ModelType? = nil) {
        self.href = href
        self.type = type
    }
}
