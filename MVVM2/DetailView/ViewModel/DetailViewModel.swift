//
//  DetailViewModel.swift
//  MVVM2
//
//  Created by Mac on 03.08.2021.
//

import Foundation

protocol DetailViewModelType {
    var personDescription: String { get }
    var age: Box<String?> { get }
}

class DetailViewModel: DetailViewModelType {
    var age: Box<String?> = Box(nil)
    
    private var profile: Profile
    
    var personDescription: String {
        return "\(profile.name) " + "is " + "\(profile.age) years old!"
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
