//
// ApiV1VideosLiveIdSessionsGet200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1VideosLiveIdSessionsGet200Response: Codable {
    public var total: Int?
    public var data: [LiveVideoSessionResponse]?

    public init(total: Int? = nil, data: [LiveVideoSessionResponse]? = nil) {
        self.total = total
        self.data = data
    }
}