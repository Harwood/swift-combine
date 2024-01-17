//
// PluginsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class PluginsAPI {
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

    public enum AddPluginError: Error, CustomStringConvertible {
        // should have either `npmName` or `path` set
        case code400Error

        public var description: String {
            switch self {
            case .code400Error:
                return "AddPluginError: should have either `npmName` or `path` set"
            }
        }
    }

    /// Install a plugin
    /// - POST /api/v1/plugins/install
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter addPluginRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func addPlugin(addPluginRequest: AddPluginRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/plugins/install"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(addPluginRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return AddPluginError.code400Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1PluginsNpmNamePublicSettingsGetError: Error, CustomStringConvertible {
        // plugin not found
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "ApiV1PluginsNpmNamePublicSettingsGetError: plugin not found"
            }
        }
    }

    /// Get a plugin's public settings
    /// - GET /api/v1/plugins/{npmName}/public-settings
    /// - parameter npmName: (path) name of the plugin/theme on npmjs.com or in its package.json 
    /// - returns: AnyPublisher<[String: Any], Error> 
    open func apiV1PluginsNpmNamePublicSettingsGet(npmName: String) -> AnyPublisher<[String: Any], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/plugins/{npmName}/public-settings"
                path = path.replacingOccurrences(of: "{npmName}", with: npmName)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[String: Any], Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return ApiV1PluginsNpmNamePublicSettingsGetError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    if let object = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                        return object
                    } else {
                        throw OpenAPITransportError.invalidResponseMappingError(data: response.data)
                    }
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1PluginsNpmNameRegisteredSettingsGetError: Error, CustomStringConvertible {
        // plugin not found
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "ApiV1PluginsNpmNameRegisteredSettingsGetError: plugin not found"
            }
        }
    }

    /// Get a plugin's registered settings
    /// - GET /api/v1/plugins/{npmName}/registered-settings
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter npmName: (path) name of the plugin/theme on npmjs.com or in its package.json 
    /// - returns: AnyPublisher<[String: Any], Error> 
    open func apiV1PluginsNpmNameRegisteredSettingsGet(npmName: String) -> AnyPublisher<[String: Any], Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/plugins/{npmName}/registered-settings"
                path = path.replacingOccurrences(of: "{npmName}", with: npmName)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<[String: Any], Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return ApiV1PluginsNpmNameRegisteredSettingsGetError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    if let object = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] {
                        return object
                    } else {
                        throw OpenAPITransportError.invalidResponseMappingError(data: response.data)
                    }
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum ApiV1PluginsNpmNameSettingsPutError: Error, CustomStringConvertible {
        // plugin not found
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "ApiV1PluginsNpmNameSettingsPutError: plugin not found"
            }
        }
    }

    /// Set a plugin's settings
    /// - PUT /api/v1/plugins/{npmName}/settings
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter npmName: (path) name of the plugin/theme on npmjs.com or in its package.json 
    /// - parameter apiV1PluginsNpmNameSettingsPutRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1PluginsNpmNameSettingsPut(npmName: String, apiV1PluginsNpmNameSettingsPutRequest: ApiV1PluginsNpmNameSettingsPutRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/plugins/{npmName}/settings"
                path = path.replacingOccurrences(of: "{npmName}", with: npmName)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "PUT"
                request.httpBody = try self.encoder.encode(apiV1PluginsNpmNameSettingsPutRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return ApiV1PluginsNpmNameSettingsPutError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum GetAvailablePluginsError: Error, CustomStringConvertible {
        // plugin index unavailable
        case code503Error

        public var description: String {
            switch self {
            case .code503Error:
                return "GetAvailablePluginsError: plugin index unavailable"
            }
        }
    }

    /// List available plugins
    /// - GET /api/v1/plugins/available
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter search: (query)  (optional)
    /// - parameter pluginType: (query)  (optional)
    /// - parameter currentPeerTubeEngine: (query)  (optional)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<PluginResponse, Error> 
    open func getAvailablePlugins(search: String? = nil, pluginType: Int? = nil, currentPeerTubeEngine: String? = nil, start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<PluginResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/plugins/available"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let search = search { queryItems.append(URLQueryItem(name: "search", value: search)) } 
                if let pluginType = pluginType { queryItems.append(URLQueryItem(name: "pluginType", value: "\(pluginType)")) } 
                if let currentPeerTubeEngine = currentPeerTubeEngine { queryItems.append(URLQueryItem(name: "currentPeerTubeEngine", value: currentPeerTubeEngine)) } 
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
        }.flatMap { request -> AnyPublisher<PluginResponse, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 503 {
                        return GetAvailablePluginsError.code503Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(PluginResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum GetPluginError: Error, CustomStringConvertible {
        // plugin not found
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "GetPluginError: plugin not found"
            }
        }
    }

    /// Get a plugin
    /// - GET /api/v1/plugins/{npmName}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter npmName: (path) name of the plugin/theme on npmjs.com or in its package.json 
    /// - returns: AnyPublisher<Plugin, Error> 
    open func getPlugin(npmName: String) -> AnyPublisher<Plugin, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/plugins/{npmName}"
                path = path.replacingOccurrences(of: "{npmName}", with: npmName)
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "GET"
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Plugin, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return GetPluginError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    try self.decoder.decode(Plugin.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }


    /// List plugins
    /// - GET /api/v1/plugins
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter pluginType: (query)  (optional)
    /// - parameter uninstalled: (query)  (optional)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<PluginResponse, Error> 
    open func getPlugins(pluginType: Int? = nil, uninstalled: Bool? = nil, start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<PluginResponse, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/plugins"
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let pluginType = pluginType { queryItems.append(URLQueryItem(name: "pluginType", value: "\(pluginType)")) } 
                if let uninstalled = uninstalled { queryItems.append(URLQueryItem(name: "uninstalled", value: uninstalled ? "true" : "false")) } 
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
        }.flatMap { request -> AnyPublisher<PluginResponse, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(PluginResponse.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum UninstallPluginError: Error, CustomStringConvertible {
        // existing plugin not found
        case code404Error

        public var description: String {
            switch self {
            case .code404Error:
                return "UninstallPluginError: existing plugin not found"
            }
        }
    }

    /// Uninstall a plugin
    /// - POST /api/v1/plugins/uninstall
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter uninstallPluginRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func uninstallPlugin(uninstallPluginRequest: UninstallPluginRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/plugins/uninstall"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(uninstallPluginRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 404 {
                        return UninstallPluginError.code404Error
                    }
                    return transportError
                }
                .tryMap { response in
                    return ()
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }

    public enum UpdatePluginError: Error, CustomStringConvertible {
        // should have either `npmName` or `path` set
        case code400Error
        // existing plugin not found
        case code404Error

        public var description: String {
            switch self {
            case .code400Error:
                return "UpdatePluginError: should have either `npmName` or `path` set"
            case .code404Error:
                return "UpdatePluginError: existing plugin not found"
            }
        }
    }

    /// Update a plugin
    /// - POST /api/v1/plugins/update
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter addPluginRequest: (body)  (optional)
    /// - returns: AnyPublisher<Void, Error> 
    open func updatePlugin(addPluginRequest: AddPluginRequest? = nil) -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/plugins/update"
                let url = baseURL.appendingPathComponent(path)
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                guard let requestURL = components?.url else {
                    throw OpenAPITransportError.badURLError()
                }
                var request = URLRequest(url: requestURL)
                request.httpMethod = "POST"
                request.httpBody = try self.encoder.encode(addPluginRequest)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                return request
            }.publisher
        }.flatMap { request -> AnyPublisher<Void, Error> in 
            return self.transport.send(request: request)
                .mapError { transportError -> Error in 
                    if transportError.statusCode == 400 {
                        return UpdatePluginError.code400Error
                    }
                    if transportError.statusCode == 404 {
                        return UpdatePluginError.code404Error
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
