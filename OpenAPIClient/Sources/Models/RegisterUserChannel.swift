//
// RegisterUserChannel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// channel base information used to create the first channel of the user 
public struct RegisterUserChannel: Codable {
    /// immutable name of the channel, used to interact with its actor
    public var name: String?
    public var displayName: String?

    public init(name: String? = nil, displayName: String? = nil) {
        self.name = name
        self.displayName = displayName
    }
}