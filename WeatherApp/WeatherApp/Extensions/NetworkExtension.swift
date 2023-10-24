import Foundation

extension Encodable {
    func convertToURLQueryItems() -> [URLQueryItem]? {
        let data = try? JSONEncoder().encode(self)
        guard let data = data else { return nil }
        let queryItems = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap({ $0 as? [String: Any] })
        
        var result: [URLQueryItem] = []
        queryItems?.forEach({ key, value in
            guard let value = value as? String, !value.isEmpty else { return }
            result.append(URLQueryItem(name: key, value: value))
        })
        return result
    }
}

extension URLRequest {
    static func get(url: URL, queryParams: [String: String]? = nil, method: String, headers: [String: String]? = nil) -> Self {
        var requestURL = url
        if let queryParams = queryParams {
            var urlrequest = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlrequest?.queryItems = queryParams.convertToURLQueryItems()
            if let urlrequestURL = urlrequest?.url {
                requestURL = urlrequestURL
            }
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        headers?.forEach({ key, value in
            guard !key.isEmpty, !value.isEmpty else { return }
            request.setValue(value, forHTTPHeaderField: key)
        })
        return request
    }
    
    static func post<T: Encodable>(url: URL, queryParams: [String: String]? = nil, method: String, body: T? = nil, headers: [String: String]? = nil) -> Self {
        var requestURL = url
        if let queryParams = queryParams {
            var urlrequest = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlrequest?.queryItems = queryParams.convertToURLQueryItems()
            if let urlrequestURL = urlrequest?.url {
                requestURL = urlrequestURL
            }
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        if let body = body {
            let data = try? JSONEncoder().encode(body)
            request.httpBody = data
        }
        
        headers?.forEach({ key, value in
            guard !key.isEmpty, !value.isEmpty else { return }
            request.setValue(value, forHTTPHeaderField: key)
        })
        return request
    }
}
