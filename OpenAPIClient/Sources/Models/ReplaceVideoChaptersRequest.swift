//
// ReplaceVideoChaptersRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ReplaceVideoChaptersRequest: Codable {
    public var chapters: [ReplaceVideoChaptersRequestChaptersInner]?

    public init(chapters: [ReplaceVideoChaptersRequestChaptersInner]? = nil) {
        self.chapters = chapters
    }
}
