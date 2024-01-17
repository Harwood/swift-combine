//
// VideoUploadResponseVideo.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoUploadResponseVideo: Codable {
    public var id: Int?
    public var uuid: Uuid?
    /// translation of a uuid v4 with a bigger alphabet to have a shorter uuid
    public var shortUUID: String?

    public init(id: Int? = nil, uuid: Uuid? = nil, shortUUID: String? = nil) {
        self.id = id
        self.uuid = uuid
        self.shortUUID = shortUUID
    }
}