//
//  UserListCellViewModel.swift
//  UserDatabase
//
//  Created by Dhanuka, Tejas | ECMPD on 2020/10/11.
//

import Foundation

struct UserListCellViewModel {
    let name: String
    let phone: String
    let website: String
    let companyName: String
    var isSelected: Bool
    
    init(from user: UserDatabase) {
        self.name = user.name
        self.phone = user.phone
        self.website = user.website
        self.companyName = user.company.name
        self.isSelected = user.isSelected
    }
}
