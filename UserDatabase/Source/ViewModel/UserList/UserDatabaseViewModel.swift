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
    func reloadData(completion: @escaping (Bool) -> Void) {
        apiClient.fetchUserDatabaseList { result in
            switch result {
            case let .success(response):
                self.userDatabaseList = nil
                self.userDatabaseList = response.userList
                completion(true)
            case let .failure(error):
                self.userDatabaseList = nil
                completion(false)
            }
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
    
    func cellViewModel(for indexPath: IndexPath) -> UserListCellViewModel {
        guard let userDatabaseList = userDatabaseList else {
            fatalError("Fetched an article for an invalid indexPath: \(indexPath)")
        }
        let user = userDatabaseList[indexPath.row]
        return UserListCellViewModel(from: user)
    }
    
    func detailViewModel(for indexPath: IndexPath) -> UserDetailViewModel {
        guard let userDatabaseList = userDatabaseList else {
            fatalError("User Database List not available")
        }
        let user = userDatabaseList[indexPath.row]
        return UserDetailViewModel(from: user)
    }
    
    func didSelectFavorite(for id: Int?, value: Bool) {
        if userDatabaseList != nil,
           id != nil,
           let indexOfId = userDatabaseList!.firstIndex(where: { $0.id == id }) {
            userDatabaseList![indexOfId].isSelected = value
        }
    }
}
