//
// MyUserAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class MyUserAPI {
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


    /// Delete my avatar
    /// - DELETE /api/v1/users/me/avatar
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1UsersMeAvatarDelete() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/avatar"
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

    public enum ApiV1UsersMeAvatarPickPostError: Error, CustomStringConvertible {
        // image file too large
        case code413Error

        public var description: String {
            switch self {
            case .code413Error:
                return "ApiV1UsersMeAvatarPickPostError: image file too large"
            }
        }
    }

    /// Update my user avatar
    /// - POST /api/v1/users/me/avatar/pick
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter avatarfile: (form) The file to upload (optional)
    /// - returns: AnyPublisher<ApiV1UsersMeAvatarPickPost200Response, Error> 
    open func apiV1UsersMeAvatarPickPost(avatarfile: Data? = nil) -> AnyPublisher<ApiV1UsersMeAvatarPickPost200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/avatar/pick"
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
                        return ApiV1UsersMeAvatarPickPostError.code413Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(ApiV1UsersMeAvatarPickPost200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get my user used quota
    /// - GET /api/v1/users/me/video-quota-used
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<ApiV1UsersMeVideoQuotaUsedGet200Response, Error> 
    open func apiV1UsersMeVideoQuotaUsedGet() -> AnyPublisher<ApiV1UsersMeVideoQuotaUsedGet200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/video-quota-used"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ApiV1UsersMeVideoQuotaUsedGet200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ApiV1UsersMeVideoQuotaUsedGet200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get videos of my user
    /// - GET /api/v1/users/me/videos
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<VideoListResponse, Error> 
    open func apiV1UsersMeVideosGet(start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<VideoListResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/videos"
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
        }.flatMap { request -> AnyPublisher<VideoListResponse, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoListResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get video imports of my user
    /// - GET /api/v1/users/me/videos/imports
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - parameter targetUrl: (query) Filter on import target URL (optional)
    /// - parameter videoChannelSyncId: (query) Filter on imports created by a specific channel synchronization (optional)
    /// - parameter search: (query) Search in video names (optional)
    /// - returns: AnyPublisher<VideoImportsList, Error> 
    open func apiV1UsersMeVideosImportsGet(start: Int? = nil, count: Int? = nil, sort: String? = nil, targetUrl: String? = nil, videoChannelSyncId: Double? = nil, search: String? = nil) -> AnyPublisher<VideoImportsList, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/videos/imports"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort)) } 
                if let targetUrl = targetUrl { queryItems.append(URLQueryItem(name: "targetUrl", value: targetUrl)) } 
                if let videoChannelSyncId = videoChannelSyncId { queryItems.append(URLQueryItem(name: "videoChannelSyncId", value: "\(videoChannelSyncId)")) } 
                if let search = search { queryItems.append(URLQueryItem(name: "search", value: search)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<VideoImportsList, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(VideoImportsList.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get rate of my user for a video
    /// - GET /api/v1/users/me/videos/{videoId}/rating
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter videoId: (path) The video id 
    /// - returns: AnyPublisher<GetMeVideoRating, Error> 
    open func apiV1UsersMeVideosVideoIdRatingGet(videoId: Int) -> AnyPublisher<GetMeVideoRating, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/me/videos/{videoId}/rating"
                path = path.replacingOccurrences(of: "{videoId}", with: "\(videoId)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<GetMeVideoRating, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(GetMeVideoRating.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter sort
    ///
    public enum GetMyAbusesSort: String, Codable, CaseIterable {
        case id = "-id"
        case createdat = "-createdAt"
        case state = "-state"
    }

    /// List my abuses
    /// - GET /api/v1/users/me/abuses
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (query) only list the report with this id (optional)
    /// - parameter state: (query)  (optional)
    /// - parameter sort: (query) Sort abuses by criteria (optional)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - returns: AnyPublisher<GetMyAbuses200Response, Error> 
    open func getMyAbuses(id: Int? = nil, state: AbuseStateSet? = nil, sort: GetMyAbusesSort? = nil, start: Int? = nil, count: Int? = nil) -> AnyPublisher<GetMyAbuses200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/abuses"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let id = id { queryItems.append(URLQueryItem(name: "id", value: "\(id)")) } 
                if let state = state { queryItems.append(URLQueryItem(name: "state", value: state.rawValue)) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue)) } 
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<GetMyAbuses200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(GetMyAbuses200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get my user information
    /// - GET /api/v1/users/me
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<[User], Error> 
    open func getUserInfo() -> AnyPublisher<[User], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[User], Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode([User].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Update my user information
    /// - PUT /api/v1/users/me
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter updateMe: (body)  
    /// - returns: AnyPublisher<Void, Error> 
    open func putUserInfo(updateMe: UpdateMe) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(updateMe)
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
