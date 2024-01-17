//
// Runner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct Runner: Codable {
    public var id: Int?
    public var name: String?
    public var description: String?
    public var ip: String?
    public var updatedAt: Date?
    public var createdAt: Date?
    public var lastContact: Date?

    public init(id: Int? = nil, name: String? = nil, description: String? = nil, ip: String? = nil, updatedAt: Date? = nil, createdAt: Date? = nil, lastContact: Date? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.ip = ip
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.lastContact = lastContact
    }
}