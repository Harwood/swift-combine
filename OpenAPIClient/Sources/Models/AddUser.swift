//
// AddUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct AddUser: Codable {
    /// immutable name of the user, used to find or mention its actor
    public var username: String
    public var password: String
    /// The user email
    public var email: String
    /// The user video quota in bytes
    public var videoQuota: Int?
    /// The user daily video quota in bytes
    public var videoQuotaDaily: Int?
    /// immutable name of the channel, used to interact with its actor
    public var channelName: String?
    public var role: UserRole
    public var adminFlags: UserAdminFlags?

    public init(username: String, password: String, email: String, videoQuota: Int? = nil, videoQuotaDaily: Int? = nil, channelName: String? = nil, role: UserRole, adminFlags: UserAdminFlags? = nil) {
        self.username = username
        self.password = password
        self.email = email
        self.videoQuota = videoQuota
        self.videoQuotaDaily = videoQuotaDaily
        self.channelName = channelName
        self.role = role
        self.adminFlags = adminFlags
    }
}