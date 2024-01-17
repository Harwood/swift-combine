//
// VideoRating.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoRating: Codable {
    public enum Rating: String, Codable, CaseIterable {
        case like = "like"
        case dislike = "dislike"
        case _none = "none"
    }
    public var video: Video
    /// Rating of the video
    public var rating: Rating

    public init(video: Video, rating: Rating) {
        self.video = video
        self.rating = rating
    }
}
