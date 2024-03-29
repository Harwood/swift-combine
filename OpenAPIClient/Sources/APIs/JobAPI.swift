//
// JobAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech

import Foundation
import Combine
import OpenAPITransport


open class JobAPI {
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


    /// Pause job queue
    /// - POST /api/v1/jobs/pause
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1JobsPausePost() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/jobs/pause"
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


    /// Resume job queue
    /// - POST /api/v1/jobs/resume
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - returns: AnyPublisher<Void, Error> 
    open func apiV1JobsResumePost() -> AnyPublisher<Void, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                let path = "/api/v1/jobs/resume"
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
    /// Enum for parameter state
    ///
    public enum GetJobsState: String, Codable, CaseIterable {
        case empty = ""
        case active = "active"
        case completed = "completed"
        case failed = "failed"
        case waiting = "waiting"
        case delayed = "delayed"
    }
    ///
    /// Enum for parameter jobType
    ///
    public enum GetJobsJobType: String, Codable, CaseIterable {
        case activitypubFollow = "activitypub-follow"
        case activitypubHttpBroadcast = "activitypub-http-broadcast"
        case activitypubHttpFetcher = "activitypub-http-fetcher"
        case activitypubHttpUnicast = "activitypub-http-unicast"
        case email = "email"
        case videoTranscoding = "video-transcoding"
        case videoFileImport = "video-file-import"
        case videoImport = "video-import"
        case videosViewsStats = "videos-views-stats"
        case activitypubRefresher = "activitypub-refresher"
        case videoRedundancy = "video-redundancy"
        case videoLiveEnding = "video-live-ending"
        case videoChannelImport = "video-channel-import"
    }

    /// List instance jobs
    /// - GET /api/v1/jobs/{state}
    /// - OAuth:
    /// - type: oauth2
    /// - name: OAuth2
    /// - parameter state: (path) The state of the job (&#39;&#39; for for no filter) 
    /// - parameter jobType: (query) job type (optional)
    /// - parameter start: (query) Offset used to paginate results (optional)
    /// - parameter count: (query) Number of items to return (optional, default to 15)
    /// - parameter sort: (query) Sort column (optional)
    /// - returns: AnyPublisher<GetJobs200Response, Error> 
    open func getJobs(state: GetJobsState, jobType: GetJobsJobType? = nil, start: Int? = nil, count: Int? = nil, sort: String? = nil) -> AnyPublisher<GetJobs200Response, Error> {
        Deferred {
            Result<URLRequest, Error> {
                guard let baseURL = self.transport.baseURL ?? self.baseURL else {
                    throw OpenAPITransportError.badURLError()
                }
                var path = "/api/v1/jobs/{state}"
                path = path.replacingOccurrences(of: "{state}", with: )
                let url = baseURL.appendingPathComponent(path)
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var queryItems: [URLQueryItem] = []
                if let jobType = jobType { queryItems.append(URLQueryItem(name: "jobType", value: jobType.rawValue)) } 
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
        }.flatMap { request -> AnyPublisher<GetJobs200Response, Error> in 
            return self.transport.send(request: request)
                .tryMap { response in
                    try self.decoder.decode(GetJobs200Response.self, from: response.data)
                }
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
