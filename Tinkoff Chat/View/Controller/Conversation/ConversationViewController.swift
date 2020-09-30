//
//  ConversationViewController.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 29.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
    //Private
    private let cellIdentifier = String(describing: ConversationTableViewCell.self)
    private var storage = ConversationDialogStorage.dialog
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UINib(nibName: String(describing: ConversationTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage.reverse()
        turnOverTableView()
        view.addSubview(tableView)
    }
    
    //MARK: - Private function
    private func turnOverTableView() {
        tableView.transform = CGAffineTransform(rotationAngle: (-.pi))
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.size.width - 10)
    }
}

//MARK: - UITableViewDataSource
extension ConversationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversationTableViewCell else { return UITableViewCell() }
        cell.configure(with: .init(senderName: storage[indexPath.row].senderName, text: storage[indexPath.row].text))
        cell.transform = CGAffineTransform(rotationAngle: (-.pi))
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ConversationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
