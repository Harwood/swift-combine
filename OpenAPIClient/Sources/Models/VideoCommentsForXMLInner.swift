//
// VideoCommentsForXMLInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoCommentsForXMLInner: Codable {
    public var link: String?
    public var guid: String?
    public var pubDate: Date?
    public var contentencoded: String?
    public var dccreator: String?

    public init(link: String? = nil, guid: String? = nil, pubDate: Date? = nil, contentencoded: String? = nil, dccreator: String? = nil) {
        self.link = link
        self.guid = guid
        self.pubDate = pubDate
        self.contentencoded = contentencoded
        self.dccreator = dccreator
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case link
        case guid
        case pubDate
        case contentencoded = "content:encoded"
        case dccreator = "dc:creator"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        link = try container.decodeIfPresent(String.self, forKey: .link)
        guid = try container.decodeIfPresent(String.self, forKey: .guid)
        pubDate = try container.decodeIfPresent(Date.self, forKey: .pubDate)
        contentencoded = try container.decodeIfPresent(String.self, forKey: .contentencoded)
        dccreator = try container.decodeIfPresent(String.self, forKey: .dccreator)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(guid, forKey: .guid)
        try container.encodeIfPresent(pubDate, forKey: .pubDate)
        try container.encodeIfPresent(contentencoded, forKey: .contentencoded)
        try container.encodeIfPresent(dccreator, forKey: .dccreator)
    }
}
