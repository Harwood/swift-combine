//
// ConfigAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class ConfigAPI {
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


    /// Delete instance runtime configuration
    /// - DELETE /api/v1/config/custom
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func delCustomConfig() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/config/custom"
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


    /// Get instance \"About\" information
    /// - GET /api/v1/config/about
    /// - returns: AnyPublisher<ServerConfigAbout, Error> 
    open func getAbout() -> AnyPublisher<ServerConfigAbout, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/config/about"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ServerConfigAbout, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ServerConfigAbout.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get instance public configuration
    /// - GET /api/v1/config
    /// - returns: AnyPublisher<ServerConfig, Error> 
    open func getConfig() -> AnyPublisher<ServerConfig, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/config"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ServerConfig, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ServerConfig.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get instance runtime configuration
    /// - GET /api/v1/config/custom
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<ServerConfigCustom, Error> 
    open func getCustomConfig() -> AnyPublisher<ServerConfigCustom, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/config/custom"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<ServerConfigCustom, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(ServerConfigCustom.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum PutCustomConfigError: Error, CustomStringConvertible {
        // Arises when:   - the emailer is disabled and the instance is open to registrations   - web videos and hls are disabled with transcoding enabled - you need at least one enabled 
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "PutCustomConfigError: Arises when:   - the emailer is disabled and the instance is open to registrations   - web videos and hls are disabled with transcoding enabled - you need at least one enabled "
            }
        }
    }

    /// Set instance runtime configuration
    /// - PUT /api/v1/config/custom
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func putCustomConfig() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/config/custom"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return PutCustomConfigError.code400Error
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
