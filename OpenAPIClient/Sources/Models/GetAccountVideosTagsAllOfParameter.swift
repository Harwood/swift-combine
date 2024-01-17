//
// GetAccountVideosTagsAllOfParameter.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public enum GetAccountVideosTagsAllOfParameter: Codable {
    case typeString(String)
    case type[String]([String])

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeString(let value):
            try container.encode(value)
        case .type[String](let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .typeString(value)
        } else if let value = try? container.decode([String].self) {
            self = .type[String](value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of GetAccountVideosTagsAllOfParameter"))
        }
    }
}
