//
// ApiV1RunnersRegisterPost200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1RunnersRegisterPost200Response: Codable {
    /// Runner id
    public var id: Int?
    public var runnerToken: String?

    public init(id: Int? = nil, runnerToken: String? = nil) {
        self.id = id
        self.runnerToken = runnerToken
    }
}
