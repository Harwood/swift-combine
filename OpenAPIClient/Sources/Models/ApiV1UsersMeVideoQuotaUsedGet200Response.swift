//
// ApiV1UsersMeVideoQuotaUsedGet200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1UsersMeVideoQuotaUsedGet200Response: Codable {
    /// The user video quota used so far in bytes
    public var videoQuotaUsed: Double?
    /// The user video quota used today in bytes
    public var videoQuotaUsedDaily: Double?

    public init(videoQuotaUsed: Double? = nil, videoQuotaUsedDaily: Double? = nil) {
        self.videoQuotaUsed = videoQuotaUsed
        self.videoQuotaUsedDaily = videoQuotaUsedDaily
    }
}
