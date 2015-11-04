//
//  ViewController.swift
//  Prototype-Skeleton
//
//  Created by Johnny Jiang on 2/11/2015.
//  Copyright © 2015 Azolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Optional: Place the button in the center of your view.
        let loginButton = FBSDKLoginButton();
        loginButton.loginBehavior = FBSDKLoginBehavior.Native;
        loginButton.center = self.view.center;
        loginButton.readPermissions = ["public_profile", "email", "user_friends"];
        loginButton.delegate = self;
        self.view.addSubview(loginButton);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // >>> Facebook Delegate Methods
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result:FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    // <<< Facebook Delegate Methods
}

