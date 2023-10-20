import Foundation

extension Encodable {
    func convertToURLQueryItems() -> [URLQueryItem]? {
        do {
            let data = try? JSONEncoder().encode(self)
            let queryItems = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)).flatMap({ $0 as? [String: Any] })
            
            var result: [URLQueryItem] = []
            queryItems?.forEach({ (key, value) in
                guard let value = value as? String, value.count != 0 else { return }
                result.append(URLQueryItem(name: key, value: value))
            })
            return result
        }
    }
}

extension URLRequest {
    static func get(url: URL, queryParams: [String: String]? = nil, method: String, headers: [String: String]? = nil) -> Self {
        var requestURL = url
        if let queryParams = queryParams {
            var urlrequest = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlrequest?.queryItems = queryParams.convertToURLQueryItems()
            requestURL = (urlrequest?.url)!
            
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        headers?.forEach({ (key, value) in
            guard !key.isEmpty , !value.isEmpty else { return }
            request.setValue(value, forHTTPHeaderField: key)
        })
        return request
    }
    
    static func post<T: Encodable>(url: URL, queryParams: [String: String]? = nil, method: String, body: T? = nil, headers: [String: String]? = nil) -> Self {
        var requestURL = url
        if let queryParams = queryParams {
            var urlrequest = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlrequest?.queryItems = queryParams.convertToURLQueryItems()
            requestURL = (urlrequest?.url)!
            
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        if let body = body {
            let data = try? JSONEncoder().encode(body)
            request.httpBody = data
        }
        
        headers?.forEach({ (key, value) in
            guard !key.isEmpty , !value.isEmpty else { return }
            request.setValue(value, forHTTPHeaderField: key)
        })
        return request
    }
}
