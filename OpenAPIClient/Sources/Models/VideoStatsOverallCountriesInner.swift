//
// VideoStatsOverallCountriesInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoStatsOverallCountriesInner: Codable {
    public var isoCode: String?
    public var viewers: Double?

    public init(isoCode: String? = nil, viewers: Double? = nil) {
        self.isoCode = isoCode
        self.viewers = viewers
    }
}
