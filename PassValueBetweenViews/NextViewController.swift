//
//  NextViewController.swift
//  PassValueBetweenViews
//
//  Created by 楊雅涵 on 2019/8/20.
//  Copyright © 2019 AmyYang. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
      
        button.addTarget(nil, action: #selector(buttonClick(_:)), for: .touchUpInside)
    }
    
    var delegate: passDataBack?
    let textField = UITextField()
    var button = UIButton()
    var index = 0
    var strText = ""
    
    var passClosure: ((String) -> ())?
    
    @objc func buttonClick(_ sender: UIButton) {
        
        print("按下傳值")
        
//     1. Closure
        
        guard let text = textField.text else {
            return
        }
        passClosure?(text)
        
//     2. 判斷delegate需要執行的方法
//        if strText == ""{
//        delegate?.getText(textField.text!)
//        } else {
//            delegate?.upDateText(textField.text!, index: index)
//        }
        
       self.navigationController?.popViewController(animated: true)
    }

    
    func setUpView() {
        textField.text = strText
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
        view.addSubview(button)
        
        textField.borderStyle = .roundedRect
        button.backgroundColor = .black
        button.setTitle("按我傳值", for: .normal)
        
         NSLayoutConstraint.activate([
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        textField.heightAnchor.constraint(equalToConstant: 40.0),
        textField.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2),
            
            button.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40.0),
            button.topAnchor.constraint(equalTo: view.superview?.centerYAnchor ?? view.centerYAnchor, constant: 20)
        ])
    
}
    
}

protocol  passDataBack {
    func getText(_ text: String)
    
    func upDateText(_ text: String, index: Int)
}
