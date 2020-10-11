//
//  UserDatabaseAPILayer.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/11.
//

import Foundation

class UserDatabaseAPIClient: NSObject {
    
    private let sourcesURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    func fetchUserDatabaseList(completion : @escaping (UserDatabaseList) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let userDatabaseList = try! jsonDecoder.decode([UserDatabase].self, from: data)
                completion(UserDatabaseList(userList: userDatabaseList))
            }
        }.resume()
    }
}
