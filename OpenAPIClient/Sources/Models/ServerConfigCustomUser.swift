//
// ServerConfigCustomUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// Settings that apply to new users, if registration is enabled 
public struct ServerConfigCustomUser: Codable {
    public var videoQuota: Int?
    public var videoQuotaDaily: Int?

    public init(videoQuota: Int? = nil, videoQuotaDaily: Int? = nil) {
        self.videoQuota = videoQuota
        self.videoQuotaDaily = videoQuotaDaily
    }
}
