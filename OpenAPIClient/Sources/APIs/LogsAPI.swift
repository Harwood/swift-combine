//
// LogsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class LogsAPI {
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


    /// Get instance audit logs
    /// - GET /api/v1/server/audit-logs
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<[String], Error> 
    open func getInstanceAuditLogs() -> AnyPublisher<[String], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/server/audit-logs"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[String], Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode([String].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get instance logs
    /// - GET /api/v1/server/logs
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<[String], Error> 
    open func getInstanceLogs() -> AnyPublisher<[String], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/server/logs"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[String], Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode([String].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Send client log
    /// - POST /api/v1/server/logs/client
    /// - parameter sendClientLog: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func sendClientLog(sendClientLog: SendClientLog? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/server/logs/client"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(sendClientLog)
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
