//
//  ConversationsListViewController.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 27.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController {
    //Private
    private let cellIdentifier = String(describing: ConversationsListTableViewCell.self)
    private var userStorage = ConversationsStorage.allStorage
    
    private lazy var profileButtonView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 228/255, green: 232/255, blue: 43/255, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.layer.cornerRadius = view.bounds.width / 2
        return view
    }()
    
    private lazy var profileInitialLabel: UILabel = {
       let label = UILabel()
        label.layer.cornerRadius = label.bounds.width / 2
        label.textAlignment = .center
        label.textColor = UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1)
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UINib(nibName: String(describing: ConversationsListTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tinkoff Chat"
        
        sort()
        view.addSubview(tableView)
        
        profileInitialLabel.text = "MD"
        profileButtonView.addSubview(profileInitialLabel)
        makeConstraints()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButtonView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(openProfileVC(_ :)))
        profileButtonView.addGestureRecognizer(tap)
    }
    
    //MARK: - Private function
    private func sort() {
        userStorage.offline.removeAll()
        for user in ConversationsStorage.allStorage.offline {
            if !user.message.isEmpty {
                userStorage.offline.append(user)
            }
        }
    }
    
    private func makeConstraints() {
        profileInitialLabel.translatesAutoresizingMaskIntoConstraints = false
        profileInitialLabel.topAnchor.constraint(equalTo: profileButtonView.topAnchor, constant: 7).isActive = true
        profileInitialLabel.leadingAnchor.constraint(equalTo: profileButtonView.leadingAnchor, constant: 5).isActive = true
        profileInitialLabel.trailingAnchor.constraint(equalTo: profileButtonView.trailingAnchor, constant: -5).isActive = true
        profileInitialLabel.bottomAnchor.constraint(equalTo: profileButtonView.bottomAnchor, constant: -7).isActive = true
    }
    
    @objc private func openProfileVC(_ sender: UITapGestureRecognizer? = nil) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProfileViewController", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "showProfileScreen") as? ProfileViewController else { return }
        controller.modalPresentationStyle = .popover
        present(controller, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDataSource
extension ConversationsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userStorage.online.count
        } else {
            return userStorage.offline.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Online"
        } else {
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversationsListTableViewCell else { return UITableViewCell() }
        if indexPath.section == 0 {
            cell.configure(with: .init(name: userStorage.online[indexPath.row].name, message: userStorage.online[indexPath.row].message, date: userStorage.online[indexPath.row].date, isOnline: userStorage.online[indexPath.row].isOnline, hasUnreadMessages: userStorage.online[indexPath.row].hasUnreadMessages))
        } else {
            cell.configure(with: .init(name: userStorage.offline[indexPath.row].name, message: userStorage.offline[indexPath.row].message, date: userStorage.offline[indexPath.row].date, isOnline: userStorage.offline[indexPath.row].isOnline, hasUnreadMessages: userStorage.offline[indexPath.row].hasUnreadMessages))
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ConversationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if !userStorage.online[indexPath.row].message.isEmpty {
                let controller = ConversationViewController()
                controller.title = userStorage.online[indexPath.row].name
                navigationController?.pushViewController(controller, animated: true)
                tableView.deselectRow(at: indexPath, animated: true)
            } else {
                tableView.deselectRow(at: indexPath, animated: true)
                return
            }
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
    }
}
