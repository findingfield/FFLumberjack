//
//  ViewController.swift
//  Example
//
//  Created by field on 2024/6/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        Log.verbose("verbose")
        Log.debug("debug")
        Log.info("info")
        Log.warn("warn")
        Log.error("error")
    }


}

