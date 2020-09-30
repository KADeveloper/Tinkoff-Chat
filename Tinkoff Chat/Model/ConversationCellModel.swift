//
//  ConfigurationModel.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 27.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import Foundation

struct ConversationCellModel {
    let name: String
    let message: String
    let date: Date
    let isOnline: Bool
    let hasUnreadMessages: Bool
}
