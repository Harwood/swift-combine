//
// ConfirmTwoFactorRequestRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ConfirmTwoFactorRequestRequest: Codable {
    /// Token to identify the two factor request
    public var requestToken: String
    /// OTP token generated by the app
    public var otpToken: String

    public init(requestToken: String, otpToken: String) {
        self.requestToken = requestToken
        self.otpToken = otpToken
    }
}