//
// VideoPasswordsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class VideoPasswordsAPI {
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

    public enum ApiV1VideosIdPasswordsGetError: Error, CustomStringConvertible {
        // video is not password protected
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "ApiV1VideosIdPasswordsGetError: video is not password protected"
            }
        }
    }

    /// List video passwords
    /// - GET /api/v1/videos/{id}/passwords
    /// - **PeerTube** >= 6.0
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) The object id, uuid or short uuid 
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<VideoPasswordList, Error> 
    open func apiV1VideosIdPasswordsGet(id: ApiV1VideosOwnershipIdAcceptPostIdParameter, start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<VideoPasswordList, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/videos/{id}/passwords"
                path = path.replacingOccurrences(of: "{id}", with: )
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
        }.flatMap { request -> AnyPublisher<VideoPasswordList, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return ApiV1VideosIdPasswordsGetError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(VideoPasswordList.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1VideosIdPasswordsPutError: Error, CustomStringConvertible {
        // video is not password protected
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "ApiV1VideosIdPasswordsPutError: video is not password protected"
            }
        }
    }

    /// Update video passwords
    /// - PUT /api/v1/videos/{id}/passwords
    /// - **PeerTube** >= 6.0
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) The object id, uuid or short uuid 
    /// - parameter apiV1VideosIdPasswordsPutRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1VideosIdPasswordsPut(id: ApiV1VideosOwnershipIdAcceptPostIdParameter, apiV1VideosIdPasswordsPutRequest: ApiV1VideosIdPasswordsPutRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/videos/{id}/passwords"
                path = path.replacingOccurrences(of: "{id}", with: )
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(apiV1VideosIdPasswordsPutRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return ApiV1VideosIdPasswordsPutError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1VideosIdPasswordsVideoPasswordIdDeleteError: Error, CustomStringConvertible {
        // cannot delete the last password of the protected video
        case code403Error
        // video is not password protected
        case code400Error

        public var description: String {
            switch self {
            case .code403Error:
                return "ApiV1VideosIdPasswordsVideoPasswordIdDeleteError: cannot delete the last password of the protected video"
            case .code400Error:
                return "ApiV1VideosIdPasswordsVideoPasswordIdDeleteError: video is not password protected"
            }
        }
    }

    /// Delete a video password
    /// - DELETE /api/v1/videos/{id}/passwords/{videoPasswordId}
    /// - **PeerTube** >= 6.0
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) The object id, uuid or short uuid 
    /// - parameter videoPasswordId: (path) The video password id 
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1VideosIdPasswordsVideoPasswordIdDelete(id: ApiV1VideosOwnershipIdAcceptPostIdParameter, videoPasswordId: Int) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/videos/{id}/passwords/{videoPasswordId}"
                path = path.replacingOccurrences(of: "{id}", with: )
                path = path.replacingOccurrences(of: "{videoPasswordId}", with: "\(videoPasswordId)")
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
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 403 {
                        return ApiV1VideosIdPasswordsVideoPasswordIdDeleteError.code403Error
                    }
                    if transportError.statusCode == 400 {
                        return ApiV1VideosIdPasswordsVideoPasswordIdDeleteError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
