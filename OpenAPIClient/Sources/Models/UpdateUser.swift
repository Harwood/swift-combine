//
// UpdateUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct UpdateUser: Codable {
    public var email: Email?
    /// Set the email as verified
    public var emailVerified: Bool?
    /// The updated video quota of the user in bytes
    public var videoQuota: Int?
    /// The updated daily video quota of the user in bytes
    public var videoQuotaDaily: Int?
    /// The auth plugin to use to authenticate the user
    public var pluginAuth: String?
    public var role: UserRole?
    public var adminFlags: UserAdminFlags?
    public var password: String?

    public init(email: Email? = nil, emailVerified: Bool? = nil, videoQuota: Int? = nil, videoQuotaDaily: Int? = nil, pluginAuth: String? = nil, role: UserRole? = nil, adminFlags: UserAdminFlags? = nil, password: String? = nil) {
        self.email = email
        self.emailVerified = emailVerified
        self.videoQuota = videoQuota
        self.videoQuotaDaily = videoQuotaDaily
        self.pluginAuth = pluginAuth
        self.role = role
        self.adminFlags = adminFlags
        self.password = password
    }
}
