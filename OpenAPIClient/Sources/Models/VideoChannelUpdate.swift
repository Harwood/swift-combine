//
// VideoChannelUpdate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoChannelUpdate: Codable {
    /// Channel display name
    public var displayName: [String: Any]?
    /// Channel description
    public var description: [String: Any]?
    /// How to support/fund the channel
    public var support: [String: Any]?
    /// Update the support field for all videos of this channel
    public var bulkVideosSupportUpdate: Bool?

    public init(displayName: [String: Any]? = nil, description: [String: Any]? = nil, support: [String: Any]? = nil, bulkVideosSupportUpdate: Bool? = nil) {
        self.displayName = displayName
        self.description = description
        self.support = support
        self.bulkVideosSupportUpdate = bulkVideosSupportUpdate
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName
        case description
        case support
        case bulkVideosSupportUpdate
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent([String: Any].self, forKey: .displayName)
        description = try container.decodeIfPresent([String: Any].self, forKey: .description)
        support = try container.decodeIfPresent([String: Any].self, forKey: .support)
        bulkVideosSupportUpdate = try container.decodeIfPresent(Bool.self, forKey: .bulkVideosSupportUpdate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let displayName = displayName {
            try container.encodeIfPresent(try JSONSerialization.data(withJSONObject: displayName), forKey: .displayName)
        }
        if let description = description {
            try container.encodeIfPresent(try JSONSerialization.data(withJSONObject: description), forKey: .description)
        }
        if let support = support {
            try container.encodeIfPresent(try JSONSerialization.data(withJSONObject: support), forKey: .support)
        }
        try container.encodeIfPresent(bulkVideosSupportUpdate, forKey: .bulkVideosSupportUpdate)
    }
}
