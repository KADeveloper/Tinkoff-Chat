//
//  ConversationTableViewCell.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 29.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell, ConfigurableView {
    //IBOutlet
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    
    //MARK: - Public function
    func configure(with model: MessageCellModel) {
        messageView.layer.cornerRadius = 8
        
        if model.senderName == "Me" {
            messageLabel.labelSettings(textAlignment: .right, font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), numberOfLines: 0, text: model.text, cornerRadius: 0)
            messageView.layer.backgroundColor = UIColor(red: 220/255, green: 247/255, blue: 197/255, alpha: 1).cgColor
            messageView.translatesAutoresizingMaskIntoConstraints = false
            messageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
            messageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            messageView.widthAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.widthAnchor, multiplier: 3/4).isActive = true
            
        } else {
            messageLabel.labelSettings(textAlignment: .left, font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), numberOfLines: 0, text: model.text, cornerRadius: 0)
            messageView.layer.backgroundColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1).cgColor
            messageView.translatesAutoresizingMaskIntoConstraints = false
            messageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
            messageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
            messageView.widthAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.widthAnchor, multiplier: 3/4).isActive = true
        }
        

    }
}
