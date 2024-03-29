//
// GetOAuthToken200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct GetOAuthToken200Response: Codable {
    public var tokenType: String?
    /// valid for 1 day
    public var accessToken: String?
    /// valid for 2 weeks
    public var refreshToken: String?
    public var expiresIn: Int?
    public var refreshTokenExpiresIn: Int?

    public init(tokenType: String? = nil, accessToken: String? = nil, refreshToken: String? = nil, expiresIn: Int? = nil, refreshTokenExpiresIn: Int? = nil) {
        self.tokenType = tokenType
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
        self.refreshTokenExpiresIn = refreshTokenExpiresIn
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case tokenType = "token_type"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case refreshTokenExpiresIn = "refresh_token_expires_in"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tokenType = try container.decodeIfPresent(String.self, forKey: .tokenType)
        accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        expiresIn = try container.decodeIfPresent(Int.self, forKey: .expiresIn)
        refreshTokenExpiresIn = try container.decodeIfPresent(Int.self, forKey: .refreshTokenExpiresIn)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(tokenType, forKey: .tokenType)
        try container.encodeIfPresent(accessToken, forKey: .accessToken)
        try container.encodeIfPresent(refreshToken, forKey: .refreshToken)
        try container.encodeIfPresent(expiresIn, forKey: .expiresIn)
        try container.encodeIfPresent(refreshTokenExpiresIn, forKey: .refreshTokenExpiresIn)
    }
}
