import Result
import BrightFutures
import Foundation

protocol GetRepository {
    func get() -> Future<Animal, NSError>
}

class DefaultGetRepository: GetRepository {
    public var networkSession: URLSession = URLSession.shared

    func get() -> Future<Animal, NSError> {
        let promise = Promise<Animal, NSError>()
        var request = URLRequest.init(url: URL(string: "http://www.yahoo.co.jp/")!)
        request.httpMethod = "GET"
        
        let task = networkSession.dataTask(with: request) { (data, response, error) in
            guard let _ = data else {
                return promise.failure(NSError(domain: "err", code: 404, userInfo: nil))
            }
            return promise.success(Cat())
        }

        task.resume()

        return promise.future
    }
}
