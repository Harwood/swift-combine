//
// AddUserResponseUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct AddUserResponseUser: Codable {
    public var id: Int?
    public var account: ApiV1AbusesPost200ResponseAbuse?

    public init(id: Int? = nil, account: ApiV1AbusesPost200ResponseAbuse? = nil) {
        self.id = id
        self.account = account
    }
}