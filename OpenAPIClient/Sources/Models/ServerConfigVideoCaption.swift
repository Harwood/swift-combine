//
// ServerConfigVideoCaption.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerConfigVideoCaption: Codable {
    public var file: ServerConfigVideoCaptionFile?

    public init(file: ServerConfigVideoCaptionFile? = nil) {
        self.file = file
    }
}
