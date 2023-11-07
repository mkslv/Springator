//
//  ViewController.swift
//  SpringAnimation
//
//  Created by Max Kiselyov on 11/6/23.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {
    // MARK: - Properties
    let colorView: SpringView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 4/5, height: UIScreen.main.bounds.height / 6)
           return SpringView(frame: frame)
    }()
    let infoLabel = SpringLabel()
    let aminationButton = SpringButton()
    let verticalContainer = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


}

// MARK: - Setup View
private extension AnimationViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubviews()
        setupContainer()
        setupColorView()
        setupLabel()
        setupButton()
        
        setupLayout()
    }
}

// MARK: - Settings
private extension AnimationViewController {
    func addSubviews() {
        [verticalContainer].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func setupColorView() {
        colorView.backgroundColor = UIColor.systemGray // сделать градиент
        colorView.layer.cornerRadius = 5
        
    }
    
    func setupLabel() {
        infoLabel.text = """
        Some twxt
        in few lanes
        of label
"""
        infoLabel.numberOfLines = 0
    }
    
    func setupButton() {
        
    }
    
    func setupContainer() {
        verticalContainer.axis = .vertical
        verticalContainer.distribution = .equalSpacing
        
        [colorView, infoLabel, aminationButton].forEach { subView in
            verticalContainer.addArrangedSubview(subView)
        }
    }
}


// MARK: - Layout
private extension AnimationViewController {
    func setupLayout() {
        [verticalContainer].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            verticalContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/4),
            verticalContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
