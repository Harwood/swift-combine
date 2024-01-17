//
// RunnerJobRunner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// If job is associated to a runner 
public struct RunnerJobRunner: Codable {
    public var id: Double?
    public var name: String?
    public var description: String?

    public init(id: Double? = nil, name: String? = nil, description: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
    }
}