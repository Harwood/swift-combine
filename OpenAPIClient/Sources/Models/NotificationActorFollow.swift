//
// NotificationActorFollow.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct NotificationActorFollow: Codable {
    public enum State: String, Codable, CaseIterable {
        case pending = "pending"
        case accepted = "accepted"
    }
    public var id: Int?
    public var follower: ActorInfo?
    public var state: State?
    public var following: NotificationActorFollowFollowing?

    public init(id: Int? = nil, follower: ActorInfo? = nil, state: State? = nil, following: NotificationActorFollowFollowing? = nil) {
        self.id = id
        self.follower = follower
        self.state = state
        self.following = following
    }
}
