//
// ServerConfigVideo.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerConfigVideo: Codable {
    public var image: ServerConfigVideoImage?
    public var file: ServerConfigVideoFile?

    public init(image: ServerConfigVideoImage? = nil, file: ServerConfigVideoFile? = nil) {
        self.image = image
        self.file = file
    }
}
