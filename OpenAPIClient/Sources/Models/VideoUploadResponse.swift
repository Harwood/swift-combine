//
// VideoUploadResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoUploadResponse: Codable {
    public var video: VideoUploadResponseVideo?

    public init(video: VideoUploadResponseVideo? = nil) {
        self.video = video
    }
}
