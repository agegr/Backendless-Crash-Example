//
//  ViewController.swift
//  BackendlessLab
//
//  Created by Yang jiahang on 16/4/24.
//  Copyright © 2016年 lrstudio. All rights reserved.
//

import UIKit
let backendless = Backendless.sharedInstance()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changePressed(sender: AnyObject) {
        Types.tryblock({
            
                let user = backendless.userService.login("ageg.cn@gmail.com", password: "qqqqqq")
                print("login success")
                user.setProperty("firstName", object: self.randomAlphaNumericString(4))
                let updatedUser = backendless.userService.update(user)
                print("User Updated. firstName: \(updatedUser.getProperty("firstName") as! String)")

            }, catchblock: {
                (exception) -> Void in
                print("Server error: \(exception)")
        })

    }
    func randomAlphaNumericString(length: Int) -> String {
        
        let allowedChars = "0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<length) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }

}

