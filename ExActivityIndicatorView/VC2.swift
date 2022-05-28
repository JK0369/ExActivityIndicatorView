//
//  VC2.swift
//  ExActivityIndicatorView
//
//  Created by 김종권 on 2022/05/28.
//

import UIKit

final class VC2: UIViewController {
  private let loadingView: LoadingView = {
    let view = LoadingView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let tableView: UITableView = {
    let view = UITableView()
    view.allowsSelection = false
    view.backgroundColor = .clear
    view.separatorStyle = .none
    view.bounces = true
    view.showsVerticalScrollIndicator = true
    view.contentInset = .zero
    view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var items = (1...20).map(String.init)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.tableView)
    self.view.addSubview(self.loadingView)

    NSLayoutConstraint.activate([
      self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
    ])
    NSLayoutConstraint.activate([
      self.loadingView.leftAnchor.constraint(equalTo: self.tableView.leftAnchor),
      self.loadingView.rightAnchor.constraint(equalTo: self.tableView.rightAnchor),
      self.loadingView.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor),
      self.loadingView.topAnchor.constraint(equalTo: self.tableView.topAnchor),
    ])
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    self.loadingView.isLoading = true
    self.getSomeData { [weak self] in
      self?.loadingView.isLoading = false
    }
  }
  
  private func getSomeData(completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
      completion()
    }
  }
}

extension VC2: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.items.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = self.items[indexPath.row]
    cell.backgroundColor = .gray
    return cell
  }
}

extension VC2: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    120
  }
}
