//
// VODHLSTranscoding1.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VODHLSTranscoding1: Codable {
    public var input: VODWebVideoTranscoding1Input?
    public var output: VODWebVideoTranscoding1Output?

    public init(input: VODWebVideoTranscoding1Input? = nil, output: VODWebVideoTranscoding1Output? = nil) {
        self.input = input
        self.output = output
    }
}
