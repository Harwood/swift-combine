//
// RunnerJobAdmin.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RunnerJobAdmin: Codable {
    public var uuid: UUID?
    public var type: RunnerJobType?
    public var state: RunnerJobStateConstant?
    public var payload: RunnerJobPayload?
    /// Number of times a remote runner failed to process this job. After too many failures, the job in \"error\" state
    public var failures: Int?
    /// Error message if the job is errored
    public var error: String?
    /// Percentage progress
    public var progress: Int?
    /// Job priority (less has more priority)
    public var priority: Int?
    public var updatedAt: Date?
    public var createdAt: Date?
    public var startedAt: Date?
    public var finishedAt: Date?
    public var parent: RunnerJobParent?
    public var runner: RunnerJobRunner?
    public var privatePayload: [String: Any]?

    public init(uuid: UUID? = nil, type: RunnerJobType? = nil, state: RunnerJobStateConstant? = nil, payload: RunnerJobPayload? = nil, failures: Int? = nil, error: String? = nil, progress: Int? = nil, priority: Int? = nil, updatedAt: Date? = nil, createdAt: Date? = nil, startedAt: Date? = nil, finishedAt: Date? = nil, parent: RunnerJobParent? = nil, runner: RunnerJobRunner? = nil, privatePayload: [String: Any]? = nil) {
        self.uuid = uuid
        self.type = type
        self.state = state
        self.payload = payload
        self.failures = failures
        self.error = error
        self.progress = progress
        self.priority = priority
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.parent = parent
        self.runner = runner
        self.privatePayload = privatePayload
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case uuid
        case type
        case state
        case payload
        case failures
        case error
        case progress
        case priority
        case updatedAt
        case createdAt
        case startedAt
        case finishedAt
        case parent
        case runner
        case privatePayload
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try container.decodeIfPresent(UUID.self, forKey: .uuid)
        type = try container.decodeIfPresent(RunnerJobType.self, forKey: .type)
        state = try container.decodeIfPresent(RunnerJobStateConstant.self, forKey: .state)
        payload = try container.decodeIfPresent(RunnerJobPayload.self, forKey: .payload)
        failures = try container.decodeIfPresent(Int.self, forKey: .failures)
        error = try container.decodeIfPresent(String.self, forKey: .error)
        progress = try container.decodeIfPresent(Int.self, forKey: .progress)
        priority = try container.decodeIfPresent(Int.self, forKey: .priority)
        updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
        createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        startedAt = try container.decodeIfPresent(Date.self, forKey: .startedAt)
        finishedAt = try container.decodeIfPresent(Date.self, forKey: .finishedAt)
        parent = try container.decodeIfPresent(RunnerJobParent.self, forKey: .parent)
        runner = try container.decodeIfPresent(RunnerJobRunner.self, forKey: .runner)
        privatePayload = try container.decodeIfPresent([String: Any].self, forKey: .privatePayload)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(uuid, forKey: .uuid)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(state, forKey: .state)
        try container.encodeIfPresent(payload, forKey: .payload)
        try container.encodeIfPresent(failures, forKey: .failures)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(progress, forKey: .progress)
        try container.encodeIfPresent(priority, forKey: .priority)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(startedAt, forKey: .startedAt)
        try container.encodeIfPresent(finishedAt, forKey: .finishedAt)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(runner, forKey: .runner)
        if let privatePayload = privatePayload {
            try container.encodeIfPresent(try JSONSerialization.data(withJSONObject: privatePayload), forKey: .privatePayload)
        }
    }
}