//
//  DetailViewController.swift
//  MVVM2
//
//  Created by Mac on 03.08.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelType? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel.text = viewModel.personDescription
        }
    }
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textColor = .white
        label.font = UIFont(name: "Copperplate", size: 30)
        return label
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(textLabel)
        view.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.age.bind { [unowned self] in
            guard let string = $0 else { return }
            self.textLabel.text = string
        }
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "Let's return to persons"
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstraints()
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
    
    private func setConstraints() {
        
        let constraints = [
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
