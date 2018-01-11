//
//  ViewController.swift
//  project three
//
//  Created by admin on 1/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myButton = UIButton()
    var myLabel = UILabel()
    var tempMessage = "Blah, Blah, Blah"
    var tempMessage2: String = "" {
        willSet(newScore) {
            myLabel.text = newScore
            print("myLabel.text = \(String(describing: myLabel.text)) and newScore = \(newScore)")
        }
    }
    
    var finalButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(myButton)
        myButton.setTitle("Hello World", for: .normal)
        myButton.backgroundColor = UIColor.black
        myButton.addTarget(self, action: #selector(buttonPressed(sender:))  , for: .touchDown)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor, constant: 30).isActive = true
        
        
        
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myLabel)
        myLabel.text = tempMessage
        myLabel.textColor = .white
        myLabel.backgroundColor = .blue
        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        finalButton.setTitle("FINAL BUTTON", for: .normal)
        finalButton.setTitleColor(.white, for: .normal)
        finalButton.backgroundColor = UIColor.blue
        view.addSubview(finalButton)
        finalButton.translatesAutoresizingMaskIntoConstraints = false
        finalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finalButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor, constant: 50).isActive = true
    }
    
    
    
    @objc func buttonPressed(sender: UIButton){
        print("Button Press Happened")
        var field: UITextField?
        let myAlert = UIAlertController(title: "Insert Title", message: "Insert Message", preferredStyle: .alert)
        myAlert.addTextField(configurationHandler: nil)
        myAlert.addTextField(){(input: UITextField) in
            input.placeholder = "There's no value"
            input.clearButtonMode = UITextFieldViewMode.whileEditing  //very cool feature
            field = input
            print("FIELD ===> \(field!.text!)") // <--- never fires
            self.tempMessage2 = field!.text!    // <--- never fires
        }
        
        func yesHandler(actionTarget: UIAlertAction){
            print("YES -> !!");print(field!.text!);
            print("FIELD INSIDE ===> \(field!.text!)")  //<--- this works
            self.tempMessage2 = field!.text!            //<--- this works
        }
        myAlert.addAction(UIAlertAction(title: "SHOW ", style: .default, handler: yesHandler))
        myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        myAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        myAlert.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: nil))
        show(myAlert, sender: self)
    }
}






























