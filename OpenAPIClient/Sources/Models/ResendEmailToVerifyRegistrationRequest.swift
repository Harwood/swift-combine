//
// ResendEmailToVerifyRegistrationRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ResendEmailToVerifyRegistrationRequest: Codable {
    /// Registration email
    public var email: String

    public init(email: String) {
        self.email = email
    }
}
