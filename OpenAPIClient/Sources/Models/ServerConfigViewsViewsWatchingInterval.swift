//
// ServerConfigViewsViewsWatchingInterval.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerConfigViewsViewsWatchingInterval: Codable {
    /// Milliseconds
    public var anonymous: Double?
    /// Milliseconds
    public var users: Double?

    public init(anonymous: Double? = nil, users: Double? = nil) {
        self.anonymous = anonymous
        self.users = users
    }
}