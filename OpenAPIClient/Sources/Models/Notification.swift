//
// Notification.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct Notification: Codable {
    public var id: Int?
    /// Notification type, following the `UserNotificationType` enum: - `1` NEW_VIDEO_FROM_SUBSCRIPTION - `2` NEW_COMMENT_ON_MY_VIDEO - `3` NEW_ABUSE_FOR_MODERATORS - `4` BLACKLIST_ON_MY_VIDEO - `5` UNBLACKLIST_ON_MY_VIDEO - `6` MY_VIDEO_PUBLISHED - `7` MY_VIDEO_IMPORT_SUCCESS - `8` MY_VIDEO_IMPORT_ERROR - `9` NEW_USER_REGISTRATION - `10` NEW_FOLLOW - `11` COMMENT_MENTION - `12` VIDEO_AUTO_BLACKLIST_FOR_MODERATORS - `13` NEW_INSTANCE_FOLLOWER - `14` AUTO_INSTANCE_FOLLOWING - `15` ABUSE_STATE_CHANGE - `16` ABUSE_NEW_MESSAGE - `17` NEW_PLUGIN_VERSION - `18` NEW_PEERTUBE_VERSION 
    public var type: Int?
    public var read: Bool?
    public var video: NotificationVideo?
    public var videoImport: NotificationVideoImport?
    public var comment: NotificationComment?
    public var videoAbuse: NotificationVideoAbuse?
    public var videoBlacklist: NotificationVideoAbuse?
    public var account: ActorInfo?
    public var actorFollow: NotificationActorFollow?
    public var createdAt: Date?
    public var updatedAt: Date?

    public init(id: Int? = nil, type: Int? = nil, read: Bool? = nil, video: NotificationVideo? = nil, videoImport: NotificationVideoImport? = nil, comment: NotificationComment? = nil, videoAbuse: NotificationVideoAbuse? = nil, videoBlacklist: NotificationVideoAbuse? = nil, account: ActorInfo? = nil, actorFollow: NotificationActorFollow? = nil, createdAt: Date? = nil, updatedAt: Date? = nil) {
        self.id = id
        self.type = type
        self.read = read
        self.video = video
        self.videoImport = videoImport
        self.comment = comment
        self.videoAbuse = videoAbuse
        self.videoBlacklist = videoBlacklist
        self.account = account
        self.actorFollow = actorFollow
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
