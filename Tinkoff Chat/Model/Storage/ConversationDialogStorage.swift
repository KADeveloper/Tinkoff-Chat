//
//  ConversationDiaologStorage.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 29.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import Foundation

struct ConversationDialogStorage {
    static let dialog = [MessageCellModel(senderName: "Not me",
                                          text: "Hello"),
                         MessageCellModel(senderName: "Not me",
                                          text: "How are you?"),
                         MessageCellModel(senderName: "Me",
                                          text: "Hello, my friend. I'm ok!"),
                         MessageCellModel(senderName: "Not me",
                                          text: "Did you see this game last night? It's was amaizing! I was really happy afte the game!"),
                         MessageCellModel(senderName: "Me",
                                          text: "Sorry, I was very beasy"),
                         MessageCellModel(senderName: "Not me",
                                          text: "Omg"),
                         MessageCellModel(senderName: "Me",
                                          text: "Sorry")]
}
