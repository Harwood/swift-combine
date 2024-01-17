//
// SessionAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class SessionAPI {
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


    /// Login prerequisite
    /// - GET /api/v1/oauth-clients/local
    /// - You need to retrieve a client id and secret before [logging in](#operation/getOAuthToken).
    /// - returns: AnyPublisher<OAuthClient, Error> 
    open func getOAuthClient() -> AnyPublisher<OAuthClient, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/oauth-clients/local"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<OAuthClient, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(OAuthClient.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter grantType
    ///
    public enum GetOAuthTokenGrantType: String, Codable, CaseIterable {
        case password = "password"
        case refreshToken = "refresh_token"
    }
    public enum GetOAuthTokenError: Error, CustomStringConvertible {
        // Disambiguate via `type`: - `invalid_client` for an unmatched `client_id` - `invalid_grant` for unmatched credentials 
        case code400Error
        // Disambiguate via `type`: - default value for a regular authentication failure - `invalid_token` for an expired token 
        case code401Error

        public var description: String {
            switch self {
            case .code400Error:
                return "GetOAuthTokenError: Disambiguate via `type`: - `invalid_client` for an unmatched `client_id` - `invalid_grant` for unmatched credentials "
            case .code401Error:
                return "GetOAuthTokenError: Disambiguate via `type`: - default value for a regular authentication failure - `invalid_token` for an expired token "
            }
        }
    }

    /// Login
    /// - POST /api/v1/users/token
    /// - With your [client id and secret](#operation/getOAuthClient), you can retrieve an access and refresh tokens.
    /// - parameter clientId: (form)  (optional)
    /// - parameter clientSecret: (form)  (optional)
    /// - parameter grantType: (form)  (optional, default to .password)
    /// - parameter username: (form) immutable name of the user, used to find or mention its actor (optional)
    /// - parameter password: (form)  (optional)
    /// - parameter refreshToken: (form)  (optional)
    /// - returns: AnyPublisher<GetOAuthToken200Response, Error> 
    open func getOAuthToken(clientId: String? = nil, clientSecret: String? = nil, grantType: GetOAuthTokenGrantType? = nil, username: String? = nil, password: String? = nil, refreshToken: String? = nil) -> AnyPublisher<GetOAuthToken200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/token"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                var formEncodedItems: [String] = []
                if let clientId = clientId { formEncodedItems.append("client_id=\(clientId)") } 
                if let clientSecret = clientSecret { formEncodedItems.append("client_secret=\(clientSecret)") } 
                if let grantType = grantType { formEncodedItems.append("grant_type=\(grantType.rawValue)") } 
                if let username = username { formEncodedItems.append("username=\(username)") } 
                if let password = password { formEncodedItems.append("password=\(password)") } 
                if let refreshToken = refreshToken { formEncodedItems.append("refresh_token=\(refreshToken)") } 
                request.httpBody = formEncodedItems.joined(separator: "&").data(using: .utf8)
                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<GetOAuthToken200Response, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return GetOAuthTokenError.code400Error
                    }
                    if transportError.statusCode == 401 {
                        return GetOAuthTokenError.code401Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(GetOAuthToken200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Logout
    /// - POST /api/v1/users/revoke-token
    /// - Revokes your access token and its associated refresh token, destroying your current session.
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func revokeOAuthToken() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/revoke-token"
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
}
