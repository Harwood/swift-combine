//
// MyHistoryAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class MyHistoryAPI {
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


    /// List watched videos history
    /// - GET /api/v1/users/me/history/videos
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter search: (query) Plain text search, applied to various parts of the model depending on endpoint (optional)
    /// - returns: AnyPublisher<VideoListResponse, Error> 
    open func apiV1UsersMeHistoryVideosGet(start: Int? = nil, count: Int? = nil, search: String? = nil) -> AnyPublisher<VideoListResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/history/videos"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let search = search { queryItems.append(URLQueryItem(name: "search", value: search)) } 
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


    /// Clear video history
    /// - POST /api/v1/users/me/history/videos/remove
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter beforeDate: (form) history before this date will be deleted (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1UsersMeHistoryVideosRemovePost(beforeDate: Date? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/me/history/videos/remove"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                let multipartBoundary = String(format: "Boundary+%08X%08X", arc4random(), arc4random())
                var multipartData = Data()
				if let beforeDate = beforeDate {
					let beforeDateHeader = "--\(multipartBoundary)\r\n"
					    .appending("Content-Disposition:form-data; name=\"beforeDate\"\r\n")
					    .appending("\r\n")
					multipartData.append(beforeDateHeader.data(using: .utf8) ?? Data())
					multipartData.append()
				}

                multipartData.append("\r\n--\(multipartBoundary)--\r\n".data(using: .utf8) ?? Data())
                request.httpBody = multipartData
                request.setValue("\(multipartData.count)", forHTTPHeaderField: "Content-Length")
                request.setValue("multipart/form-data; boundary=\(multipartBoundary)", forHTTPHeaderField: "Content-Type")
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


    /// Delete history element
    /// - DELETE /api/v1/users/me/history/videos/{videoId}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter videoId: (path)  
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1UsersMeHistoryVideosVideoIdDelete(videoId: Int) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/me/history/videos/{videoId}"
                path = path.replacingOccurrences(of: "{videoId}", with: "\(videoId)")
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
}