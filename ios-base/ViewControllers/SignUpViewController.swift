//
//  SignUpViewController.swift
//  ios-base
//
//  Created by Rootstrap on 5/22/17.
//  Copyright © 2017 Rootstrap. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  @IBAction func tapOnSignUpButton(_ sender: Any) {
    UIApplication.showNetworkActivity()
    UserAPI.signup("\(randomName())@gmail.com", password: "123456789", avatar64: randomImage(), success: { (_) in
      UIApplication.hideNetworkActivity()
      UIApplication.shared.keyWindow?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
    }, failure: { error in
      UIApplication.hideNetworkActivity()
      self.showMessageError(title: "Error", errorMessage: error.localizedDescription)
      print(error)
    })
  }
  
  //Helper methods for test purposes
  func randomImage() -> UIImage {
    let square = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let rr = CGFloat(arc4random_uniform(255))
    let rg = CGFloat(arc4random_uniform(255))
    let rb = CGFloat(arc4random_uniform(255))
    square.backgroundColor = UIColor(red: rr/255, green: rg/255, blue: rb/255, alpha: 1.0)
    UIGraphicsBeginImageContext(square.frame.size)
    square.drawHierarchy(in: square.frame, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
  
  func randomName() -> String {
    return "user\(arc4random_uniform(10000))"
  }
}