//
// VODAudioMergeTranscoding1.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VODAudioMergeTranscoding1: Codable {
    public var input: VODAudioMergeTranscoding1Input?
    public var output: VODWebVideoTranscoding1Output?

    public init(input: VODAudioMergeTranscoding1Input? = nil, output: VODWebVideoTranscoding1Output? = nil) {
        self.input = input
        self.output = output
    }
}