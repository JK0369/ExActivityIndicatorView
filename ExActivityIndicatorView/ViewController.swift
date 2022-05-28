//
//  ViewController.swift
//  ExActivityIndicatorView
//
//  Created by 김종권 on 2022/05/28.
//

import UIKit

class ViewController: UIViewController {
  private let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("next", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.nextButton)
    NSLayoutConstraint.activate([
      self.nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc private func didTapButton() {
    let vc2 = VC2()
    self.navigationController?.pushViewController(vc2, animated: true)
  }
}
