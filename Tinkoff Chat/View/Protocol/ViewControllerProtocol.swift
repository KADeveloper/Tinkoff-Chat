//
//  ViewControllerProtocol.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 28.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import Foundation

protocol ConfigurableView {
    associatedtype ConfigurationModel
    
    func configure(with model: ConfigurationModel)
}
