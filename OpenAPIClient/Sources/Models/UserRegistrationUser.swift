//
// UserRegistrationUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// If the registration has been accepted, this is a partial user object created by the registration 
public struct UserRegistrationUser: Codable {
    public var id: Int?

    public init(id: Int? = nil) {
        self.id = id
    }
}
