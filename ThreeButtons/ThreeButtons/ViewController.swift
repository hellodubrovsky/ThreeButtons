//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Илья Дубровский on 04.09.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(firstButton)
        setConstraints()
        setButton()
    }

    func setButton() {
        self.firstButton.setTitle("Hello", for: .normal)
        self.firstButton.setImage(.init(systemName: "arrow.right.circle.fill"), for: .normal)
    }

    func setConstraints() {
        self.firstButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.firstButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
