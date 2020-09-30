//
//  ConversationsListTableViewCell.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 28.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

class ConversationsListTableViewCell: UITableViewCell, ConfigurableView {
    //IBOutlet
    @IBOutlet weak var lastMessageDateLabel: UILabel!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    //MARK: - Public function
    func configure(with model: ConversationCellModel) {
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        let date = model.date
        
        let messageDay = calendar.component(.day, from: date)
        let messageMonth = calendar.component(.month, from: date)
        let messageYear = calendar.component(.year, from: date)
        
        let actualDay = calendar.component(.day, from: Date())
        let actualMonth = calendar.component(.month, from: Date())
        let actualYear = calendar.component(.year, from: Date())
        
        let isOnline = model.isOnline
        let hasUnreadMessages = model.hasUnreadMessages
        
        //change cell background color if friend online
        if isOnline {
            self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 0.3)
        } else {
            self.backgroundColor = .white
        }
        
        //make unread message bold/heavy
        if hasUnreadMessages && !model.message.isEmpty {
            lastMessageLabel.labelSettings(textAlignment: .left, font: UIFont.systemFont(ofSize: 13, weight: .heavy), textColor: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6), numberOfLines: 2, text: model.message, cornerRadius: 0)
        } else {
            lastMessageLabel.labelSettings(textAlignment: .left, font: UIFont.systemFont(ofSize: 13, weight: .regular), textColor: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6), numberOfLines: 2, text: model.message, cornerRadius: 0)
        }
        
        //show date or time when last message was sended
        if messageDay == actualDay && messageMonth == actualMonth && messageYear == actualYear{
            dateFormatter.dateFormat = "HH:mm"
            lastMessageDateLabel.labelSettings(textAlignment: .right, font: UIFont.systemFont(ofSize: 15, weight: .regular), textColor: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6), numberOfLines: 1, text: dateFormatter.string(from: date), cornerRadius: 0)
        } else {
            dateFormatter.dateFormat = "dd MMM"
            lastMessageDateLabel.labelSettings(textAlignment: .right, font: UIFont.systemFont(ofSize: 15, weight: .regular), textColor: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6), numberOfLines: 1, text: dateFormatter.string(from: date), cornerRadius: 0)
        }
        
        //show "No messages yes"
        if model.message.isEmpty && isOnline {
            lastMessageDateLabel.text = ""
            lastMessageLabel.text = "No messages yet"
            lastMessageLabel.font = UIFont(name: "Georgia", size: 13)
        }
        
        friendNameLabel.labelSettings(textAlignment: .right, font: UIFont.systemFont(ofSize: 15, weight: .regular), textColor: .black, numberOfLines: 1, text: model.name, cornerRadius: 0)
    }
}
