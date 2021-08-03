//
//  TableViewCellModel.swift
//  MVVM2
//
//  Created by Mac on 03.08.2021.
//

import Foundation

protocol TableViewCellModelType: AnyObject {
    var name: String { get }
    var age: String { get }
}

class TableViewCellModel: TableViewCellModelType {
    private var profile: Profile
    
    var name: String {
        return profile.name
    }
    
    var age: String {
        return "\(profile.age)"
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
