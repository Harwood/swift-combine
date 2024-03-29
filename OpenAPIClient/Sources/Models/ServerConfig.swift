//
// ServerConfig.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ServerConfig: Codable {
    public var instance: ServerConfigInstance?
    public var search: ServerConfigSearch?
    public var plugin: ServerConfigPlugin?
    public var theme: ServerConfigPlugin?
    public var email: ServerConfigEmail?
    public var contactForm: ServerConfigEmail?
    public var serverVersion: String?
    public var serverCommit: String?
    public var signup: ServerConfigSignup?
    public var transcoding: ServerConfigTranscoding?
    public var _import: ServerConfigImport?
    public var autoBlacklist: ServerConfigAutoBlacklist?
    public var avatar: ServerConfigAvatar?
    public var video: ServerConfigVideo?
    public var videoCaption: ServerConfigVideoCaption?
    public var user: ServerConfigUser?
    public var trending: ServerConfigTrending?
    public var tracker: ServerConfigEmail?
    public var followings: ServerConfigFollowings?
    public var homepage: ServerConfigEmail?
    public var openTelemetry: ServerConfigOpenTelemetry?
    public var views: ServerConfigViews?

    public init(instance: ServerConfigInstance? = nil, search: ServerConfigSearch? = nil, plugin: ServerConfigPlugin? = nil, theme: ServerConfigPlugin? = nil, email: ServerConfigEmail? = nil, contactForm: ServerConfigEmail? = nil, serverVersion: String? = nil, serverCommit: String? = nil, signup: ServerConfigSignup? = nil, transcoding: ServerConfigTranscoding? = nil, _import: ServerConfigImport? = nil, autoBlacklist: ServerConfigAutoBlacklist? = nil, avatar: ServerConfigAvatar? = nil, video: ServerConfigVideo? = nil, videoCaption: ServerConfigVideoCaption? = nil, user: ServerConfigUser? = nil, trending: ServerConfigTrending? = nil, tracker: ServerConfigEmail? = nil, followings: ServerConfigFollowings? = nil, homepage: ServerConfigEmail? = nil, openTelemetry: ServerConfigOpenTelemetry? = nil, views: ServerConfigViews? = nil) {
        self.instance = instance
        self.search = search
        self.plugin = plugin
        self.theme = theme
        self.email = email
        self.contactForm = contactForm
        self.serverVersion = serverVersion
        self.serverCommit = serverCommit
        self.signup = signup
        self.transcoding = transcoding
        self._import = _import
        self.autoBlacklist = autoBlacklist
        self.avatar = avatar
        self.video = video
        self.videoCaption = videoCaption
        self.user = user
        self.trending = trending
        self.tracker = tracker
        self.followings = followings
        self.homepage = homepage
        self.openTelemetry = openTelemetry
        self.views = views
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case instance
        case search
        case plugin
        case theme
        case email
        case contactForm
        case serverVersion
        case serverCommit
        case signup
        case transcoding
        case _import = "import"
        case autoBlacklist
        case avatar
        case video
        case videoCaption
        case user
        case trending
        case tracker
        case followings
        case homepage
        case openTelemetry
        case views
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        instance = try container.decodeIfPresent(ServerConfigInstance.self, forKey: .instance)
        search = try container.decodeIfPresent(ServerConfigSearch.self, forKey: .search)
        plugin = try container.decodeIfPresent(ServerConfigPlugin.self, forKey: .plugin)
        theme = try container.decodeIfPresent(ServerConfigPlugin.self, forKey: .theme)
        email = try container.decodeIfPresent(ServerConfigEmail.self, forKey: .email)
        contactForm = try container.decodeIfPresent(ServerConfigEmail.self, forKey: .contactForm)
        serverVersion = try container.decodeIfPresent(String.self, forKey: .serverVersion)
        serverCommit = try container.decodeIfPresent(String.self, forKey: .serverCommit)
        signup = try container.decodeIfPresent(ServerConfigSignup.self, forKey: .signup)
        transcoding = try container.decodeIfPresent(ServerConfigTranscoding.self, forKey: .transcoding)
        _import = try container.decodeIfPresent(ServerConfigImport.self, forKey: ._import)
        autoBlacklist = try container.decodeIfPresent(ServerConfigAutoBlacklist.self, forKey: .autoBlacklist)
        avatar = try container.decodeIfPresent(ServerConfigAvatar.self, forKey: .avatar)
        video = try container.decodeIfPresent(ServerConfigVideo.self, forKey: .video)
        videoCaption = try container.decodeIfPresent(ServerConfigVideoCaption.self, forKey: .videoCaption)
        user = try container.decodeIfPresent(ServerConfigUser.self, forKey: .user)
        trending = try container.decodeIfPresent(ServerConfigTrending.self, forKey: .trending)
        tracker = try container.decodeIfPresent(ServerConfigEmail.self, forKey: .tracker)
        followings = try container.decodeIfPresent(ServerConfigFollowings.self, forKey: .followings)
        homepage = try container.decodeIfPresent(ServerConfigEmail.self, forKey: .homepage)
        openTelemetry = try container.decodeIfPresent(ServerConfigOpenTelemetry.self, forKey: .openTelemetry)
        views = try container.decodeIfPresent(ServerConfigViews.self, forKey: .views)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(instance, forKey: .instance)
        try container.encodeIfPresent(search, forKey: .search)
        try container.encodeIfPresent(plugin, forKey: .plugin)
        try container.encodeIfPresent(theme, forKey: .theme)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(contactForm, forKey: .contactForm)
        try container.encodeIfPresent(serverVersion, forKey: .serverVersion)
        try container.encodeIfPresent(serverCommit, forKey: .serverCommit)
        try container.encodeIfPresent(signup, forKey: .signup)
        try container.encodeIfPresent(transcoding, forKey: .transcoding)
        try container.encodeIfPresent(_import, forKey: ._import)
        try container.encodeIfPresent(autoBlacklist, forKey: .autoBlacklist)
        try container.encodeIfPresent(avatar, forKey: .avatar)
        try container.encodeIfPresent(video, forKey: .video)
        try container.encodeIfPresent(videoCaption, forKey: .videoCaption)
        try container.encodeIfPresent(user, forKey: .user)
        try container.encodeIfPresent(trending, forKey: .trending)
        try container.encodeIfPresent(tracker, forKey: .tracker)
        try container.encodeIfPresent(followings, forKey: .followings)
        try container.encodeIfPresent(homepage, forKey: .homepage)
        try container.encodeIfPresent(openTelemetry, forKey: .openTelemetry)
        try container.encodeIfPresent(views, forKey: .views)
    }
}
