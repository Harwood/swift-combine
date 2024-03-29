//
// ApiV1VideosIdRatePutRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1VideosIdRatePutRequest: Codable {
    public enum Rating: String, Codable, CaseIterable {
        case like = "like"
        case dislike = "dislike"
    }
    public var rating: Rating

    public init(rating: Rating) {
        self.rating = rating
    }
}
