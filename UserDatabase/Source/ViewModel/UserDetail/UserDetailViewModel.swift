//
//  UserDetailViewModel.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/18.
//

import Foundation

final class UserDetailViewModel {
    
    let name: String
    let userName: String
    let address: Address
    let companyDetail: Company
    let phone: String
    let website: String
    
    init(from user: UserDatabase) {
        self.name = user.name
        self.userName = user.username
        self.address = user.address
        self.companyDetail = user.company
        self.phone = user.phone
        self.website = user.website
    }
}
