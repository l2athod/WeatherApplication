import Foundation

protocol APIRouter{
    var host:        String { get }
    var schema:      String{ get}
    var path:        String {get}
    var method:     String {get}
    var queryItems:  [URLQueryItem]{get}
    var headers:     [(String,String)]{get}
    var statusCode:  Int{get}
    var body:        Codable? {get}
}

enum DataError: Error {
    case invalidURL
    case invalidResponse
    case encodeError(Error?)
    case decodeError(Error?)
}

final class APIManager {
    private init() {}
    static let shared = APIManager()
    
    func fetchData<T: Decodable>(type: T.Type, router: APIRouter, completion: @escaping (Result<T, DataError>) -> Void) {
        var components = URLComponents()
        components.host = router.host
        components.scheme = router.schema
        components.path = router.path
        components.queryItems = router.queryItems
    
        guard let url = components.url else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        router.headers.forEach { (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let requestBody = router.body {
            do{
                let data = try JSONEncoder().encode(requestBody)
                urlRequest.httpBody = data
            }
            catch{
                completion(.failure(.encodeError(error)))
            }
            
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let response = response as! HTTPURLResponse
            guard let data = data, error == nil, data.count != 0  else { return completion(.failure(.invalidURL)) }
            guard (200...299).contains(response.statusCode) else { return completion(.failure(.invalidResponse)) }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch (let error) {
                print(error.localizedDescription)
                completion(.failure(.decodeError(error)))
            }
        }.resume()
    }
}
