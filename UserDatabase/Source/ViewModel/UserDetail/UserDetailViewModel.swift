//
//  UserDetailViewModel.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/18.
//

import Foundation

final class UserDetailViewModel {
    
    let id: Int
    let name: String
    let userName: String
    let address: Address
    let companyDetail: Company
    let phone: String
    let website: String
    var isSelected: Bool
    
    init(from user: UserDatabase) {
        self.id = user.id
        self.name = user.name
        self.userName = user.username
        self.address = user.address
        self.companyDetail = user.company
        self.phone = user.phone
        self.website = user.website
        self.isSelected = user.isSelected
    }
}
