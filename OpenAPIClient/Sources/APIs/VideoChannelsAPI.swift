//
// VideoChannelsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class VideoChannelsAPI {
    private let transport: OpenAPITransport
    public var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(OpenISO8601DateFormatter())
        return encoder
    }()
    public var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(OpenISO8601DateFormatter())
        return decoder
    }()
    public var baseURL = URL(string: "https://peertube2.cpy.re")

    public init(_ transport: OpenAPITransport) {
        self.transport = transport
    }


    /// Create a video channel
    /// - POST /api/v1/video-channels
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter videoChannelCreate: (body)  (optional)
    /// - returns: AnyPublisher<AddVideoChannel200Response, Error> 
    open func addVideoChannel(videoChannelCreate: VideoChannelCreate? = nil) -> AnyPublisher<AddVideoChannel200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/video-channels"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(videoChannelCreate)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<AddVideoChannel200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(AddVideoChannel200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// List the synchronizations of video channels of an account
    /// - GET /api/v1/accounts/{name}/video-channel-syncs
    /// - parameter name: (path) The username or handle of the account 
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<VideoChannelSyncList, Error> 
    open func apiV1AccountsNameVideoChannelSyncsGet(name: String, start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<VideoChannelSyncList, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/accounts/{name}/video-channel-syncs"
                path = path.replacingOccurrences(of: "{name}", with: name)
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<VideoChannelSyncList, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoChannelSyncList.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// List video channels of an account
    /// - GET /api/v1/accounts/{name}/video-channels
    /// - parameter name: (path) The username or handle of the account 
    /// - parameter withStats: (query) include daily view statistics for the last 30 days and total views (only if authentified as the account user) (optional)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<VideoChannelList, Error> 
    open func apiV1AccountsNameVideoChannelsGet(name: String, withStats: Bool? = nil, start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<VideoChannelList, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/accounts/{name}/video-channels"
                path = path.replacingOccurrences(of: "{name}", with: name)
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let withStats = withStats { queryItems.append(URLQueryItem(name: "withStats", value: withStats ? "true" : "false")) } 
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<VideoChannelList, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoChannelList.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Delete channel avatar
    /// - DELETE /api/v1/video-channels/{channelHandle}/avatar
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1VideoChannelsChannelHandleAvatarDelete(channelHandle: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/avatar"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "DELETE"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1VideoChannelsChannelHandleAvatarPickPostError: Error, CustomStringConvertible {
        // image file too large
        case code413Error

        public var description: String {
            switch self {
            case .code413Error:
                return "ApiV1VideoChannelsChannelHandleAvatarPickPostError: image file too large"
            }
        }
    }

    /// Update channel avatar
    /// - POST /api/v1/video-channels/{channelHandle}/avatar/pick
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter avatarfile: (form) The file to upload. (optional)
    /// - returns: AnyPublisher<ApiV1UsersMeAvatarPickPost200Response, Error> 
    open func apiV1VideoChannelsChannelHandleAvatarPickPost(channelHandle: String, avatarfile: Data? = nil) -> AnyPublisher<ApiV1UsersMeAvatarPickPost200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/avatar/pick"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                let multipartBoundary = String(format: "Boundary+%08X%08X", arc4random(), arc4random())
                var multipartData = Data()
				if let avatarfile = avatarfile {
					let avatarfileHeader = "--\(multipartBoundary)\r\n"
					    .appending("Content-Disposition:form-data; name=\"avatarfile\"; filename=\"avatarfile\"\r\n")
					    .appending("Content-Type: image/png, image/jpeg\r\n")
					    .appending("\r\n")
					multipartData.append(avatarfileHeader.data(using: .utf8) ?? Data())
					multipartData.append(avatarfile)
				}

                multipartData.append("\r\n--\(multipartBoundary)--\r\n".data(using: .utf8) ?? Data())
                request.httpBody = multipartData
                request.setValue("\(multipartData.count)", forHTTPHeaderField: "Content-Length")
                request.setValue("multipart/form-data; boundary=\(multipartBoundary)", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ApiV1UsersMeAvatarPickPost200Response, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 413 {
                        return ApiV1VideoChannelsChannelHandleAvatarPickPostError.code413Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(ApiV1UsersMeAvatarPickPost200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Delete channel banner
    /// - DELETE /api/v1/video-channels/{channelHandle}/banner
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1VideoChannelsChannelHandleBannerDelete(channelHandle: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/banner"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "DELETE"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1VideoChannelsChannelHandleBannerPickPostError: Error, CustomStringConvertible {
        // image file too large
        case code413Error

        public var description: String {
            switch self {
            case .code413Error:
                return "ApiV1VideoChannelsChannelHandleBannerPickPostError: image file too large"
            }
        }
    }

    /// Update channel banner
    /// - POST /api/v1/video-channels/{channelHandle}/banner/pick
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter bannerfile: (form) The file to upload. (optional)
    /// - returns: AnyPublisher<ApiV1VideoChannelsChannelHandleBannerPickPost200Response, Error> 
    open func apiV1VideoChannelsChannelHandleBannerPickPost(channelHandle: String, bannerfile: Data? = nil) -> AnyPublisher<ApiV1VideoChannelsChannelHandleBannerPickPost200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/banner/pick"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                let multipartBoundary = String(format: "Boundary+%08X%08X", arc4random(), arc4random())
                var multipartData = Data()
				if let bannerfile = bannerfile {
					let bannerfileHeader = "--\(multipartBoundary)\r\n"
					    .appending("Content-Disposition:form-data; name=\"bannerfile\"; filename=\"bannerfile\"\r\n")
					    .appending("Content-Type: image/png, image/jpeg\r\n")
					    .appending("\r\n")
					multipartData.append(bannerfileHeader.data(using: .utf8) ?? Data())
					multipartData.append(bannerfile)
				}

                multipartData.append("\r\n--\(multipartBoundary)--\r\n".data(using: .utf8) ?? Data())
                request.httpBody = multipartData
                request.setValue("\(multipartData.count)", forHTTPHeaderField: "Content-Length")
                request.setValue("multipart/form-data; boundary=\(multipartBoundary)", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ApiV1VideoChannelsChannelHandleBannerPickPost200Response, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 413 {
                        return ApiV1VideoChannelsChannelHandleBannerPickPostError.code413Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(ApiV1VideoChannelsChannelHandleBannerPickPost200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Import videos in channel
    /// - POST /api/v1/video-channels/{channelHandle}/import-videos
    /// - Import a remote channel/playlist videos into a channel
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter importVideosInChannelCreate: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1VideoChannelsChannelHandleImportVideosPost(channelHandle: String, importVideosInChannelCreate: ImportVideosInChannelCreate? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/import-videos"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(importVideosInChannelCreate)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// List playlists of a channel
    /// - GET /api/v1/video-channels/{channelHandle}/video-playlists
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - parameter playlistType: (query)  (optional)
    /// - returns: AnyPublisher<ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response, Error> 
    open func apiV1VideoChannelsChannelHandleVideoPlaylistsGet(channelHandle: String, start: Int? = nil, count: Int? = nil, sort: String? = nil, playlistType: VideoPlaylistTypeSet? = nil) -> AnyPublisher<ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/video-playlists"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort)) } 
                if let playlistType = playlistType { queryItems.append(URLQueryItem(name: "playlistType", value: playlistType.rawValue)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Delete a video channel
    /// - DELETE /api/v1/video-channels/{channelHandle}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - returns: AnyPublisher<Void, Error> 
    open func delVideoChannel(channelHandle: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "DELETE"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get a video channel
    /// - GET /api/v1/video-channels/{channelHandle}
    /// - parameter channelHandle: (path) The video channel handle 
    /// - returns: AnyPublisher<VideoChannel, Error> 
    open func getVideoChannel(channelHandle: String) -> AnyPublisher<VideoChannel, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<VideoChannel, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoChannel.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter sort
    ///
    public enum GetVideoChannelFollowersSort: String, Codable, CaseIterable {
        case createdat = "createdAt"
    }

    /// List followers of a video channel
    /// - GET /api/v1/video-channels/{channelHandle}/followers
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort followers by criteria (optional)
    /// - parameter search: (query) Plain text search, applied to various parts of the model depending on endpoint (optional)
    /// - returns: AnyPublisher<GetAccountFollowers200Response, Error> 
    open func getVideoChannelFollowers(channelHandle: String, start: Int? = nil, count: Int? = nil, sort: GetVideoChannelFollowersSort? = nil, search: String? = nil) -> AnyPublisher<GetAccountFollowers200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/followers"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue)) } 
                if let search = search { queryItems.append(URLQueryItem(name: "search", value: search)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<GetAccountFollowers200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(GetAccountFollowers200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter nsfw
    ///
    public enum GetVideoChannelVideosNsfw: String, Codable, CaseIterable {
        case _true = "true"
        case _false = "false"
    }
    ///
    /// Enum for parameter include
    ///
    public enum GetVideoChannelVideosInclude: Int, Codable, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
        case _4 = 4
        case _8 = 8
    }
    ///
    /// Enum for parameter skipCount
    ///
    public enum GetVideoChannelVideosSkipCount: String, Codable, CaseIterable {
        case _true = "true"
        case _false = "false"
    }
    ///
    /// Enum for parameter sort
    ///
    public enum GetVideoChannelVideosSort: String, Codable, CaseIterable {
        case name = "name"
        case duration = "-duration"
        case createdat = "-createdAt"
        case publishedat = "-publishedAt"
        case views = "-views"
        case likes = "-likes"
        case trending = "-trending"
        case hot = "-hot"
        case best = "-best"
    }

    /// List videos of a video channel
    /// - GET /api/v1/video-channels/{channelHandle}/videos
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter categoryOneOf: (query) category id of the video (see [/videos/categories](#operation/getCategories)) (optional)
    /// - parameter isLive: (query) whether or not the video is a live (optional)
    /// - parameter tagsOneOf: (query) tag(s) of the video (optional)
    /// - parameter tagsAllOf: (query) tag(s) of the video, where all should be present in the video (optional)
    /// - parameter licenceOneOf: (query) licence id of the video (see [/videos/licences](#operation/getLicences)) (optional)
    /// - parameter languageOneOf: (query) language id of the video (see [/videos/languages](#operation/getLanguages)). Use &#x60;_unknown&#x60; to filter on videos that don&#39;t have a video language (optional)
    /// - parameter nsfw: (query) whether to include nsfw videos, if any (optional)
    /// - parameter isLocal: (query) **PeerTube &gt;&#x3D; 4.0** Display only local or remote videos (optional)
    /// - parameter include: (query) **PeerTube &gt;&#x3D; 4.0** Include additional videos in results (can be combined using bitwise or operator) - &#x60;0&#x60; NONE - &#x60;1&#x60; NOT_PUBLISHED_STATE - &#x60;2&#x60; BLACKLISTED - &#x60;4&#x60; BLOCKED_OWNER - &#x60;8&#x60; FILES  (optional)
    /// - parameter privacyOneOf: (query) **PeerTube &gt;&#x3D; 4.0** Display only videos in this specific privacy/privacies (optional)
    /// - parameter hasHLSFiles: (query) **PeerTube &gt;&#x3D; 4.0** Display only videos that have HLS files (optional)
    /// - parameter hasWebVideoFiles: (query) **PeerTube &gt;&#x3D; 6.0** Display only videos that have Web Video files (optional)
    /// - parameter skipCount: (query) if you don&#39;t need the &#x60;total&#x60; in the response (optional, default to ._false)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query)  (optional)
    /// - parameter excludeAlreadyWatched: (query) Whether or not to exclude videos that are in the user&#39;s video history (optional)
    /// - returns: AnyPublisher<VideoListResponse, Error> 
    open func getVideoChannelVideos(channelHandle: String, categoryOneOf: GetAccountVideosCategoryOneOfParameter? = nil, isLive: Bool? = nil, tagsOneOf: GetAccountVideosTagsOneOfParameter? = nil, tagsAllOf: GetAccountVideosTagsAllOfParameter? = nil, licenceOneOf: GetAccountVideosLicenceOneOfParameter? = nil, languageOneOf: GetAccountVideosLanguageOneOfParameter? = nil, nsfw: GetVideoChannelVideosNsfw? = nil, isLocal: Bool? = nil, include: GetVideoChannelVideosInclude? = nil, privacyOneOf: VideoPrivacySet? = nil, hasHLSFiles: Bool? = nil, hasWebVideoFiles: Bool? = nil, skipCount: GetVideoChannelVideosSkipCount? = nil, start: Int? = nil, count: Int? = nil, sort: GetVideoChannelVideosSort? = nil, excludeAlreadyWatched: Bool? = nil) -> AnyPublisher<VideoListResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}/videos"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let categoryOneOf = categoryOneOf { queryItems.append(URLQueryItem(name: "categoryOneOf", value: String(data: try self.encoder.encode(categoryOneOf), encoding: .utf8) ?? "")) } 
                if let isLive = isLive { queryItems.append(URLQueryItem(name: "isLive", value: isLive ? "true" : "false")) } 
                if let tagsOneOf = tagsOneOf { queryItems.append(URLQueryItem(name: "tagsOneOf", value: String(data: try self.encoder.encode(tagsOneOf), encoding: .utf8) ?? "")) } 
                if let tagsAllOf = tagsAllOf { queryItems.append(URLQueryItem(name: "tagsAllOf", value: String(data: try self.encoder.encode(tagsAllOf), encoding: .utf8) ?? "")) } 
                if let licenceOneOf = licenceOneOf { queryItems.append(URLQueryItem(name: "licenceOneOf", value: String(data: try self.encoder.encode(licenceOneOf), encoding: .utf8) ?? "")) } 
                if let languageOneOf = languageOneOf { queryItems.append(URLQueryItem(name: "languageOneOf", value: String(data: try self.encoder.encode(languageOneOf), encoding: .utf8) ?? "")) } 
                if let nsfw = nsfw { queryItems.append(URLQueryItem(name: "nsfw", value: nsfw.rawValue)) } 
                if let isLocal = isLocal { queryItems.append(URLQueryItem(name: "isLocal", value: isLocal ? "true" : "false")) } 
                if let include = include { queryItems.append(URLQueryItem(name: "include", value: include.rawValue)) } 
                if let privacyOneOf = privacyOneOf { queryItems.append(URLQueryItem(name: "privacyOneOf", value: privacyOneOf.rawValue)) } 
                if let hasHLSFiles = hasHLSFiles { queryItems.append(URLQueryItem(name: "hasHLSFiles", value: hasHLSFiles ? "true" : "false")) } 
                if let hasWebVideoFiles = hasWebVideoFiles { queryItems.append(URLQueryItem(name: "hasWebVideoFiles", value: hasWebVideoFiles ? "true" : "false")) } 
                if let skipCount = skipCount { queryItems.append(URLQueryItem(name: "skipCount", value: skipCount.rawValue)) } 
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue)) } 
                if let excludeAlreadyWatched = excludeAlreadyWatched { queryItems.append(URLQueryItem(name: "excludeAlreadyWatched", value: excludeAlreadyWatched ? "true" : "false")) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<VideoListResponse, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoListResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// List video channels
    /// - GET /api/v1/video-channels
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<VideoChannelList, Error> 
    open func getVideoChannels(start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<VideoChannelList, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/video-channels"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<VideoChannelList, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoChannelList.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Update a video channel
    /// - PUT /api/v1/video-channels/{channelHandle}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter channelHandle: (path) The video channel handle 
    /// - parameter videoChannelUpdate: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func putVideoChannel(channelHandle: String, videoChannelUpdate: VideoChannelUpdate? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/video-channels/{channelHandle}"
                path = path.replacingOccurrences(of: "{channelHandle}", with: channelHandle)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(videoChannelUpdate)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}