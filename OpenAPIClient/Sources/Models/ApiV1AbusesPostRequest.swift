//
// ApiV1AbusesPostRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1AbusesPostRequest: Codable {
    public enum PredefinedReasons: String, Codable, CaseIterable {
        case violentorabusive = "violentOrAbusive"
        case hatefulorabusive = "hatefulOrAbusive"
        case spamormisleading = "spamOrMisleading"
        case privacy = "privacy"
        case rights = "rights"
        case serverrules = "serverRules"
        case thumbnails = "thumbnails"
        case captions = "captions"
    }
    /// Reason why the user reports this video
    public var reason: String
    /// Reason categories that help triage reports
    public var predefinedReasons: [PredefinedReasons]?
    public var video: ApiV1AbusesPostRequestVideo?
    public var comment: ApiV1AbusesPostRequestComment?
    public var account: ApiV1AbusesPostRequestAccount?

    public init(reason: String, predefinedReasons: [PredefinedReasons]? = nil, video: ApiV1AbusesPostRequestVideo? = nil, comment: ApiV1AbusesPostRequestComment? = nil, account: ApiV1AbusesPostRequestAccount? = nil) {
        self.reason = reason
        self.predefinedReasons = predefinedReasons
        self.video = video
        self.comment = comment
        self.account = account
    }
}