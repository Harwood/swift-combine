//
// RunnerJobPayload.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RunnerJobPayload: Codable {
    public var input: VODAudioMergeTranscoding1Input?
    public var output: VODWebVideoTranscoding1Output?

    public init(input: VODAudioMergeTranscoding1Input? = nil, output: VODWebVideoTranscoding1Output? = nil) {
        self.input = input
        self.output = output
    }
}
