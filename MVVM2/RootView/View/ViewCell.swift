//
//  ViewCell.swift
//  MVVM2
//
//  Created by Mac on 03.08.2021.
//

import UIKit

class ViewCell: UITableViewCell {
    
    weak var viewModel: TableViewCellModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            ageLabel.text = viewModel.age
        }
    }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "Copperplate", size: 20)
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "Copperplate-Light", size: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(ageLabel)
        
        let constraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: ageLabel.leadingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ]
        NSLayoutConstraint.activate(constraints)
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
