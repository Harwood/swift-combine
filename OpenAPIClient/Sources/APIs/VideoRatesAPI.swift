//
// VideoRatesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class VideoRatesAPI {
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

    public enum ApiV1VideosIdRatePutError: Error, CustomStringConvertible {
        // video does not exist
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "ApiV1VideosIdRatePutError: video does not exist"
            }
        }
    }

    /// Like/dislike a video
    /// - PUT /api/v1/videos/{id}/rate
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) The object id, uuid or short uuid 
    /// - parameter xPeertubeVideoPassword: (header) Required on password protected video (optional)
    /// - parameter apiV1VideosIdRatePutRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1VideosIdRatePut(id: ApiV1VideosOwnershipIdAcceptPostIdParameter, xPeertubeVideoPassword: String? = nil, apiV1VideosIdRatePutRequest: ApiV1VideosIdRatePutRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/videos/{id}/rate"
                path = path.replacingOccurrences(of: "{id}", with: )
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                var headers = [String: String]()
                if let xPeertubeVideoPassword = xPeertubeVideoPassword { headers["x-peertube-video-password"] = xPeertubeVideoPassword }
                request.allHTTPHeaderFields = headers
                request.httpBody = try self.encoder.encode(apiV1VideosIdRatePutRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return ApiV1VideosIdRatePutError.code404Error
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