//
//  ViewController.swift
//  Tinkoff Chat
//
//  Created by Динара Аминова on 14.09.2020.
//  Copyright © 2020 AlekseyKudryashov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private func printInConsole(function: String) {
        #if DEBUG
        print("\(function)")
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printInConsole(function: "\(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printInConsole(function: "\(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printInConsole(function: "\(#function)")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        printInConsole(function: "\(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        printInConsole(function: "\(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printInConsole(function: "\(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printInConsole(function: "\(#function)")
    }
}

