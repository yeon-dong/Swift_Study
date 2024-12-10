//
//  ViewController.swift
//  test1
//
//  Created by DongYeon on 12/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var hello: UILabel!
    
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendButton(_ sender: UIButton) {
        hello.text = "Hello, " + textField.text!
    }
    
}

