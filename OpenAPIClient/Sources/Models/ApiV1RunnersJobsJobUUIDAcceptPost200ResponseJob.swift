//
// ApiV1RunnersJobsJobUUIDAcceptPost200ResponseJob.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiV1RunnersJobsJobUUIDAcceptPost200ResponseJob: Codable {
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
    public var jobToken: String?

    public init(uuid: UUID? = nil, type: RunnerJobType? = nil, state: RunnerJobStateConstant? = nil, payload: RunnerJobPayload? = nil, failures: Int? = nil, error: String? = nil, progress: Int? = nil, priority: Int? = nil, updatedAt: Date? = nil, createdAt: Date? = nil, startedAt: Date? = nil, finishedAt: Date? = nil, parent: RunnerJobParent? = nil, runner: RunnerJobRunner? = nil, jobToken: String? = nil) {
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
        self.jobToken = jobToken
    }
}
