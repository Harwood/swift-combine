//
// HomepageAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class HomepageAPI {
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

    public enum ApiV1CustomPagesHomepageInstanceGetError: Error, CustomStringConvertible {
        // No homepage set
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "ApiV1CustomPagesHomepageInstanceGetError: No homepage set"
            }
        }
    }

    /// Get instance custom homepage
    /// - GET /api/v1/custom-pages/homepage/instance
    /// - returns: AnyPublisher<CustomHomepage, Error> 
    open func apiV1CustomPagesHomepageInstanceGet() -> AnyPublisher<CustomHomepage, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/custom-pages/homepage/instance"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<CustomHomepage, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return ApiV1CustomPagesHomepageInstanceGetError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(CustomHomepage.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Set instance custom homepage
    /// - PUT /api/v1/custom-pages/homepage/instance
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter apiV1CustomPagesHomepageInstancePutRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1CustomPagesHomepageInstancePut(apiV1CustomPagesHomepageInstancePutRequest: ApiV1CustomPagesHomepageInstancePutRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/custom-pages/homepage/instance"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(apiV1CustomPagesHomepageInstancePutRequest)
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
