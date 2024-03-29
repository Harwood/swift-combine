//
// UninstallPluginRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct UninstallPluginRequest: Codable {
    /// name of the plugin/theme in its package.json
    public var npmName: String

    public init(npmName: String) {
        self.npmName = npmName
    }
}
