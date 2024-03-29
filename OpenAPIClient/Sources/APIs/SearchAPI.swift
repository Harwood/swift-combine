//
// SearchAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class SearchAPI {
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

    ///
    /// Enum for parameter searchTarget
    ///
    public enum SearchChannelsSearchTarget: String, Codable, CaseIterable {
        case local = "local"
        case searchIndex = "search-index"
    }
    public enum SearchChannelsError: Error, CustomStringConvertible {
        // search index unavailable
        case code500Error

        public var description: String {
            switch self {
            case .code500Error:
                return "SearchChannelsError: search index unavailable"
            }
        }
    }

    /// Search channels
    /// - GET /api/v1/search/video-channels
    /// - parameter search: (query) String to search. If the user can make a remote URI search, and the string is an URI then the PeerTube instance will fetch the remote object and add it to its database. Then, you can use the REST API to fetch the complete channel information and interact with it.  
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter searchTarget: (query) If the administrator enabled search index support, you can override the default search target.  **Warning**: If you choose to make an index search, PeerTube will get results from a third party service. It means the instance may not yet know the objects you fetched. If you want to load video/channel information:   * If the current user has the ability to make a remote URI search (this information is available in the config endpoint),   then reuse the search API to make a search using the object URI so PeerTube instance fetches the remote object and fill its database.   After that, you can use the classic REST API endpoints to fetch the complete object or interact with it   * If the current user doesn&#39;t have the ability to make a remote URI search, then redirect the user on the origin instance or fetch   the data from the origin instance API  (optional)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<VideoChannelList, Error> 
    open func searchChannels(search: String, start: Int? = nil, count: Int? = nil, searchTarget: SearchChannelsSearchTarget? = nil, sort: String? = nil) -> AnyPublisher<VideoChannelList, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/search/video-channels"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                queryItems.append(URLQueryItem(name: "search", value: search))
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let searchTarget = searchTarget { queryItems.append(URLQueryItem(name: "searchTarget", value: searchTarget.rawValue)) } 
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
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 500 {
                        return SearchChannelsError.code500Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(VideoChannelList.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter searchTarget
    ///
    public enum SearchPlaylistsSearchTarget: String, Codable, CaseIterable {
        case local = "local"
        case searchIndex = "search-index"
    }
    public enum SearchPlaylistsError: Error, CustomStringConvertible {
        // search index unavailable
        case code500Error

        public var description: String {
            switch self {
            case .code500Error:
                return "SearchPlaylistsError: search index unavailable"
            }
        }
    }

    /// Search playlists
    /// - GET /api/v1/search/video-playlists
    /// - parameter search: (query) String to search. If the user can make a remote URI search, and the string is an URI then the PeerTube instance will fetch the remote object and add it to its database. Then, you can use the REST API to fetch the complete playlist information and interact with it.  
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter searchTarget: (query) If the administrator enabled search index support, you can override the default search target.  **Warning**: If you choose to make an index search, PeerTube will get results from a third party service. It means the instance may not yet know the objects you fetched. If you want to load video/channel information:   * If the current user has the ability to make a remote URI search (this information is available in the config endpoint),   then reuse the search API to make a search using the object URI so PeerTube instance fetches the remote object and fill its database.   After that, you can use the classic REST API endpoints to fetch the complete object or interact with it   * If the current user doesn&#39;t have the ability to make a remote URI search, then redirect the user on the origin instance or fetch   the data from the origin instance API  (optional)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response, Error> 
    open func searchPlaylists(search: String, start: Int? = nil, count: Int? = nil, searchTarget: SearchPlaylistsSearchTarget? = nil, sort: String? = nil) -> AnyPublisher<ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/search/video-playlists"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                queryItems.append(URLQueryItem(name: "search", value: search))
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let searchTarget = searchTarget { queryItems.append(URLQueryItem(name: "searchTarget", value: searchTarget.rawValue)) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort)) } 
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
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 500 {
                        return SearchPlaylistsError.code500Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(ApiV1VideoChannelsChannelHandleVideoPlaylistsGet200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter nsfw
    ///
    public enum SearchVideosNsfw: String, Codable, CaseIterable {
        case _true = "true"
        case _false = "false"
    }
    ///
    /// Enum for parameter include
    ///
    public enum SearchVideosInclude: Int, Codable, CaseIterable {
        case _0 = 0
        case _1 = 1
        case _2 = 2
        case _4 = 4
        case _8 = 8
    }
    ///
    /// Enum for parameter skipCount
    ///
    public enum SearchVideosSkipCount: String, Codable, CaseIterable {
        case _true = "true"
        case _false = "false"
    }
    ///
    /// Enum for parameter searchTarget
    ///
    public enum SearchVideosSearchTarget: String, Codable, CaseIterable {
        case local = "local"
        case searchIndex = "search-index"
    }
    ///
    /// Enum for parameter sort
    ///
    public enum SearchVideosSort: String, Codable, CaseIterable {
        case name = "name"
        case duration = "-duration"
        case createdat = "-createdAt"
        case publishedat = "-publishedAt"
        case views = "-views"
        case likes = "-likes"
        case match = "-match"
    }
    public enum SearchVideosError: Error, CustomStringConvertible {
        // search index unavailable
        case code500Error

        public var description: String {
            switch self {
            case .code500Error:
                return "SearchVideosError: search index unavailable"
            }
        }
    }

    /// Search videos
    /// - GET /api/v1/search/videos
    /// - parameter search: (query) String to search. If the user can make a remote URI search, and the string is an URI then the PeerTube instance will fetch the remote object and add it to its database. Then, you can use the REST API to fetch the complete video information and interact with it.  
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
    /// - parameter uuids: (query) Find videos with specific UUIDs (optional)
    /// - parameter hasHLSFiles: (query) **PeerTube &gt;&#x3D; 4.0** Display only videos that have HLS files (optional)
    /// - parameter hasWebVideoFiles: (query) **PeerTube &gt;&#x3D; 6.0** Display only videos that have Web Video files (optional)
    /// - parameter skipCount: (query) if you don&#39;t need the &#x60;total&#x60; in the response (optional, default to ._false)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter searchTarget: (query) If the administrator enabled search index support, you can override the default search target.  **Warning**: If you choose to make an index search, PeerTube will get results from a third party service. It means the instance may not yet know the objects you fetched. If you want to load video/channel information:   * If the current user has the ability to make a remote URI search (this information is available in the config endpoint),   then reuse the search API to make a search using the object URI so PeerTube instance fetches the remote object and fill its database.   After that, you can use the classic REST API endpoints to fetch the complete object or interact with it   * If the current user doesn&#39;t have the ability to make a remote URI search, then redirect the user on the origin instance or fetch   the data from the origin instance API  (optional)
    /// - parameter sort: (query) Sort videos by criteria (prefixing with &#x60;-&#x60; means &#x60;DESC&#x60; order):  (optional)
    /// - parameter excludeAlreadyWatched: (query) Whether or not to exclude videos that are in the user&#39;s video history (optional)
    /// - parameter startDate: (query) Get videos that are published after this date (optional)
    /// - parameter endDate: (query) Get videos that are published before this date (optional)
    /// - parameter originallyPublishedStartDate: (query) Get videos that are originally published after this date (optional)
    /// - parameter originallyPublishedEndDate: (query) Get videos that are originally published before this date (optional)
    /// - parameter durationMin: (query) Get videos that have this minimum duration (optional)
    /// - parameter durationMax: (query) Get videos that have this maximum duration (optional)
    /// - returns: AnyPublisher<VideoListResponse, Error> 
    open func searchVideos(search: String, categoryOneOf: GetAccountVideosCategoryOneOfParameter? = nil, isLive: Bool? = nil, tagsOneOf: GetAccountVideosTagsOneOfParameter? = nil, tagsAllOf: GetAccountVideosTagsAllOfParameter? = nil, licenceOneOf: GetAccountVideosLicenceOneOfParameter? = nil, languageOneOf: GetAccountVideosLanguageOneOfParameter? = nil, nsfw: SearchVideosNsfw? = nil, isLocal: Bool? = nil, include: SearchVideosInclude? = nil, privacyOneOf: VideoPrivacySet? = nil, uuids: [String]? = nil, hasHLSFiles: Bool? = nil, hasWebVideoFiles: Bool? = nil, skipCount: SearchVideosSkipCount? = nil, start: Int? = nil, count: Int? = nil, searchTarget: SearchVideosSearchTarget? = nil, sort: SearchVideosSort? = nil, excludeAlreadyWatched: Bool? = nil, startDate: Date? = nil, endDate: Date? = nil, originallyPublishedStartDate: Date? = nil, originallyPublishedEndDate: Date? = nil, durationMin: Int? = nil, durationMax: Int? = nil) -> AnyPublisher<VideoListResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/search/videos"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                queryItems.append(URLQueryItem(name: "search", value: search))
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
                if let uuids = uuids { queryItems.append(URLQueryItem(name: "uuids", value: uuids.joined(separator: ","))) } 
                if let hasHLSFiles = hasHLSFiles { queryItems.append(URLQueryItem(name: "hasHLSFiles", value: hasHLSFiles ? "true" : "false")) } 
                if let hasWebVideoFiles = hasWebVideoFiles { queryItems.append(URLQueryItem(name: "hasWebVideoFiles", value: hasWebVideoFiles ? "true" : "false")) } 
                if let skipCount = skipCount { queryItems.append(URLQueryItem(name: "skipCount", value: skipCount.rawValue)) } 
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let searchTarget = searchTarget { queryItems.append(URLQueryItem(name: "searchTarget", value: searchTarget.rawValue)) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue)) } 
                if let excludeAlreadyWatched = excludeAlreadyWatched { queryItems.append(URLQueryItem(name: "excludeAlreadyWatched", value: excludeAlreadyWatched ? "true" : "false")) } 
                if let startDate = startDate { queryItems.append(URLQueryItem(name: "startDate", value: OpenISO8601DateFormatter.shared.string(from: startDate))) } 
                if let endDate = endDate { queryItems.append(URLQueryItem(name: "endDate", value: OpenISO8601DateFormatter.shared.string(from: endDate))) } 
                if let originallyPublishedStartDate = originallyPublishedStartDate { queryItems.append(URLQueryItem(name: "originallyPublishedStartDate", value: OpenISO8601DateFormatter.shared.string(from: originallyPublishedStartDate))) } 
                if let originallyPublishedEndDate = originallyPublishedEndDate { queryItems.append(URLQueryItem(name: "originallyPublishedEndDate", value: OpenISO8601DateFormatter.shared.string(from: originallyPublishedEndDate))) } 
                if let durationMin = durationMin { queryItems.append(URLQueryItem(name: "durationMin", value: "\(durationMin)")) } 
                if let durationMax = durationMax { queryItems.append(URLQueryItem(name: "durationMax", value: "\(durationMax)")) } 
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
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 500 {
                        return SearchVideosError.code500Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(VideoListResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
