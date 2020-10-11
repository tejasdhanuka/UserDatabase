//
//  UserDatabaseAPILayer.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/11.
//

import Foundation

class UserDatabaseAPIClient: NSObject {
    
    private let sourcesURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    func fetchUserDatabaseList(completion : @escaping (Result<UserDatabaseList, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            // Handle connectivity issues
            if let error = error {
                let networkError: NetworkError
                if (error as NSError).code == NSURLErrorCancelled {
                    networkError = .cancelled
                } else {
                    networkError = .unknownError(error)
                }
                completion(.failure(networkError))
                return
            }
            
            // Handle data
            guard let data = data, data.count > 0 else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode([UserDatabase].self, from: data)
                completion(.success(UserDatabaseList(userList: response)))
            } catch let error {
                completion(.failure(NetworkError.decodeError(error)))
            }
        }.resume()
    }
}
