//
// ReplaceVideoChaptersRequestChaptersInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ReplaceVideoChaptersRequestChaptersInner: Codable {
    public var title: String?
    public var timecode: Int?

    public init(title: String? = nil, timecode: Int? = nil) {
        self.title = title
        self.timecode = timecode
    }
}
