//
// ApiV1RunnersRegistrationTokensGet200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1RunnersRegistrationTokensGet200Response: Codable {
    public var total: Int?
    public var data: [RunnerRegistrationToken]?

    public init(total: Int? = nil, data: [RunnerRegistrationToken]? = nil) {
        self.total = total
        self.data = data
    }
}
