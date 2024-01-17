//
// InstanceRedundancyAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class InstanceRedundancyAPI {
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

    public enum ApiV1ServerRedundancyHostPutError: Error, CustomStringConvertible {
        // server is not already known
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "ApiV1ServerRedundancyHostPutError: server is not already known"
            }
        }
    }

    /// Update a server redundancy policy
    /// - PUT /api/v1/server/redundancy/{host}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter host: (path) server domain to mirror 
    /// - parameter apiV1ServerRedundancyHostPutRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1ServerRedundancyHostPut(host: String, apiV1ServerRedundancyHostPutRequest: ApiV1ServerRedundancyHostPutRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/server/redundancy/{host}"
                path = path.replacingOccurrences(of: "{host}", with: host)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(apiV1ServerRedundancyHostPutRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return ApiV1ServerRedundancyHostPutError.code404Error
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
