//
// UsersAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class UsersAPI {
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

    public enum AddUserError: Error, CustomStringConvertible {
        // insufficient authority to create an admin or moderator
        case code403Error

        public var description: String {
            switch self {
            case .code403Error:
                return "AddUserError: insufficient authority to create an admin or moderator"
            }
        }
    }

    /// Create a user
    /// - POST /api/v1/users
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter addUser: (body) If the smtp server is configured, you can leave the password empty and an email will be sent asking the user to set it first.  
    /// - returns: AnyPublisher<AddUserResponse, Error> 
    open func addUser(addUser: AddUser) -> AnyPublisher<AddUserResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(addUser)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<AddUserResponse, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 403 {
                        return AddUserError.code403Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(AddUserResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ConfirmTwoFactorRequestError: Error, CustomStringConvertible {
        // invalid request token or OTP token
        case code403Error
        // user not found
        case code404Error

        public var description: String {
            switch self {
            case .code403Error:
                return "ConfirmTwoFactorRequestError: invalid request token or OTP token"
            case .code404Error:
                return "ConfirmTwoFactorRequestError: user not found"
            }
        }
    }

    /// Confirm two factor auth
    /// - POST /api/v1/users/{id}/two-factor/confirm-request
    /// - Confirm a two factor authentication request
    /// - parameter id: (path) Entity id 
    /// - parameter confirmTwoFactorRequestRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func confirmTwoFactorRequest(id: Int, confirmTwoFactorRequestRequest: ConfirmTwoFactorRequestRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}/two-factor/confirm-request"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(confirmTwoFactorRequestRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 403 {
                        return ConfirmTwoFactorRequestError.code403Error
                    }
                    if transportError.statusCode == 404 {
                        return ConfirmTwoFactorRequestError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Delete a user
    /// - DELETE /api/v1/users/{id}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) Entity id 
    /// - returns: AnyPublisher<Void, Error> 
    open func delUser(id: Int) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
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

    public enum DisableTwoFactorError: Error, CustomStringConvertible {
        // invalid password
        case code403Error
        // user not found
        case code404Error

        public var description: String {
            switch self {
            case .code403Error:
                return "DisableTwoFactorError: invalid password"
            case .code404Error:
                return "DisableTwoFactorError: user not found"
            }
        }
    }

    /// Disable two factor auth
    /// - POST /api/v1/users/{id}/two-factor/disable
    /// - Disable two factor authentication of a user
    /// - parameter id: (path) Entity id 
    /// - parameter requestTwoFactorRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func disableTwoFactor(id: Int, requestTwoFactorRequest: RequestTwoFactorRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}/two-factor/disable"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(requestTwoFactorRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 403 {
                        return DisableTwoFactorError.code403Error
                    }
                    if transportError.statusCode == 404 {
                        return DisableTwoFactorError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Get a user
    /// - GET /api/v1/users/{id}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) Entity id 
    /// - parameter withStats: (query) include statistics about the user (only available as a moderator/admin) (optional)
    /// - returns: AnyPublisher<GetUser200Response, Error> 
    open func getUser(id: Int, withStats: Bool? = nil) -> AnyPublisher<GetUser200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let withStats = withStats { queryItems.append(URLQueryItem(name: "withStats", value: withStats ? "true" : "false")) } 
                components?.queryItems = queryItems
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<GetUser200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(GetUser200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    ///
    /// Enum for parameter sort
    ///
    public enum GetUsersSort: String, Codable, CaseIterable {
        case id = "-id"
        case username = "-username"
        case createdat = "-createdAt"
    }

    /// List users
    /// - GET /api/v1/users
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter search: (query) Plain text search that will match with user usernames or emails (optional)
    /// - parameter blocked: (query) Filter results down to (un)banned users (optional)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort users by criteria (optional)
    /// - returns: AnyPublisher<[User], Error> 
    open func getUsers(search: String? = nil, blocked: Bool? = nil, start: Int? = nil, count: Int? = nil, sort: GetUsersSort? = nil) -> AnyPublisher<[User], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let search = search { queryItems.append(URLQueryItem(name: "search", value: search)) } 
                if let blocked = blocked { queryItems.append(URLQueryItem(name: "blocked", value: blocked ? "true" : "false")) } 
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
        }.flatMap { request -> AnyPublisher<[User], Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode([User].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Update a user
    /// - PUT /api/v1/users/{id}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter id: (path) Entity id 
    /// - parameter updateUser: (body)  
    /// - returns: AnyPublisher<Void, Error> 
    open func putUser(id: Int, updateUser: UpdateUser) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(updateUser)
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

    public enum RequestTwoFactorError: Error, CustomStringConvertible {
        // invalid password
        case code403Error
        // user not found
        case code404Error

        public var description: String {
            switch self {
            case .code403Error:
                return "RequestTwoFactorError: invalid password"
            case .code404Error:
                return "RequestTwoFactorError: user not found"
            }
        }
    }

    /// Request two factor auth
    /// - POST /api/v1/users/{id}/two-factor/request
    /// - Request two factor authentication for a user
    /// - parameter id: (path) Entity id 
    /// - parameter requestTwoFactorRequest: (body)  (optional)
    /// - returns: AnyPublisher<[RequestTwoFactorResponse], Error> 
    open func requestTwoFactor(id: Int, requestTwoFactorRequest: RequestTwoFactorRequest? = nil) -> AnyPublisher<[RequestTwoFactorResponse], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}/two-factor/request"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(requestTwoFactorRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[RequestTwoFactorResponse], Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 403 {
                        return RequestTwoFactorError.code403Error
                    }
                    if transportError.statusCode == 404 {
                        return RequestTwoFactorError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode([RequestTwoFactorResponse].self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// Resend user verification link
    /// - POST /api/v1/users/ask-send-verify-email
    /// - parameter resendEmailToVerifyUserRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func resendEmailToVerifyUser(resendEmailToVerifyUserRequest: ResendEmailToVerifyUserRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/users/ask-send-verify-email"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(resendEmailToVerifyUserRequest)
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

    public enum VerifyUserError: Error, CustomStringConvertible {
        // invalid verification string
        case code403Error
        // user not found
        case code404Error

        public var description: String {
            switch self {
            case .code403Error:
                return "VerifyUserError: invalid verification string"
            case .code404Error:
                return "VerifyUserError: user not found"
            }
        }
    }

    /// Verify a user
    /// - POST /api/v1/users/{id}/verify-email
    /// - Following a user registration, the new user will receive an email asking to click a link containing a secret. This endpoint can also be used to verify a new email set in the user account. 
    /// - parameter id: (path) Entity id 
    /// - parameter verifyUserRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func verifyUser(id: Int, verifyUserRequest: VerifyUserRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/users/{id}/verify-email"
                path = path.replacingOccurrences(of: "{id}", with: "\(id)")
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(verifyUserRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 403 {
                        return VerifyUserError.code403Error
                    }
                    if transportError.statusCode == 404 {
                        return VerifyUserError.code404Error
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
