//
// RunnerRegistrationTokenAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class RunnerRegistrationTokenAPI {
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


    /// Generate registration token
    /// - POST /api/v1/runners/registration-tokens/generate
    /// - Generate a new runner registration token
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1RunnersRegistrationTokensGeneratePost() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/runners/registration-tokens/generate"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
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

    ///
    /// Enum for parameter sort
    ///
    public enum ApiV1RunnersRegistrationTokensGetSort: String, Codable, CaseIterable {
        case createdat = "createdAt"
    }

    /// List registration tokens
    /// - GET /api/v1/runners/registration-tokens
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort registration tokens by criteria (optional)
    /// - returns: AnyPublisher<ApiV1RunnersRegistrationTokensGet200Response, Error> 
    open func apiV1RunnersRegistrationTokensGet(start: Int? = nil, count: Int? = nil, sort: ApiV1RunnersRegistrationTokensGetSort? = nil) -> AnyPublisher<ApiV1RunnersRegistrationTokensGet200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/runners/registration-tokens"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let start = start { queryItems.append(URLQueryItem(name: "start", value: "\(start)")) } 
                if let count = count { queryItems.append(URLQueryItem(name: "count", value: "\(count)")) } 
                if let sort = sort { queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue)) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ApiV1RunnersRegistrationTokensGet200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ApiV1RunnersRegistrationTokensGet200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Remove registration token
    /// - DELETE /api/v1/runners/registration-tokens/{registrationTokenId}
    /// - Remove a registration token. Runners that used this token for their registration are automatically removed.
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter registrationTokenId: (path)  
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1RunnersRegistrationTokensRegistrationTokenIdDelete(registrationTokenId: Int) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/runners/registration-tokens/{registrationTokenId}"
                path = path.replacingOccurrences(of: "{registrationTokenId}", with: "\(registrationTokenId)")
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
