//
//  UserDatabaseViewModel.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/10.
//

import Foundation

final class UserDatabaseViewModel {
    
    // MARK: - Properties
    
    private let apiClient: UserDatabaseAPIClient
    private var userDatabaseList: [UserDatabase]?
    
    // MARK: - Init
    
    init(apiClient: UserDatabaseAPIClient = UserDatabaseAPIClient()) {
        self.apiClient = apiClient
    }
    
    // MARK: - custom methods
    func reloadData(completion: @escaping (Result<Bool, Error>) -> Void) {
        apiClient.fetchUserDatabaseList {(userList) in
            print(userList)
        }
    }
    
    func numberOfSections() -> Int {
        guard
            let userDatabaseList = userDatabaseList,
            !userDatabaseList.isEmpty else {
            return 0
        }
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        userDatabaseList?.count ?? 0
    }
    
//    func cellViewModel(for indexPath: IndexPath) -> FashionMatomeArticleViewModel {
//        guard let userDatabaseList = userDatabaseList else {
//            fatalError("Fetched an article for an invalid indexPath: \(indexPath)")
//        }
//        let user = userDatabaseList[indexPath.row]
//        return FashionMatomeArticleViewModel(from: user)
//    }
}
