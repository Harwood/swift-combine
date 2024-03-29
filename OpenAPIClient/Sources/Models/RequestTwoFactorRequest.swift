//
// RequestTwoFactorRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RequestTwoFactorRequest: Codable {
    /// Password of the currently authenticated user
    public var currentPassword: String?

    public init(currentPassword: String? = nil) {
        self.currentPassword = currentPassword
    }
}
