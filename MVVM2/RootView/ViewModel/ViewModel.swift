//
//  ViewModel.swift
//  MVVM2
//
//  Created by Mac on 03.08.2021.
//

import Foundation

protocol TableViewViewModelType {
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellModelType?
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    var profiles = [
        Profile(name: "John Smith", age: 33),
        Profile(name: "Max Colby", age: 21),
        Profile(name: "Mark Salmon", age: 40)
    ]
    
    func numberOfRows() -> Int {
        profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellModel(profile: profile)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
