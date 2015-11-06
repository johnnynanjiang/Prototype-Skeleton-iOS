//
//  ViewController.swift
//  Prototype-Skeleton
//
//  Created by Johnny Jiang on 2/11/2015.
//  Copyright © 2015 Azolla. All rights reserved.
//

import UIKit
import Swinject

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Optional: Place the button in the center of your view.
        let loginButton = FBSDKLoginButton();
        loginButton.center = self.view.center;
        loginButton.loginBehavior = FBSDKLoginBehavior.Native;
        loginButton.readPermissions = ["public_profile", "email", "user_friends"];
        loginButton.delegate = self;
        self.view.addSubview(loginButton);
        
        let container = Container();
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
                print(FBSDKAccessToken.currentAccessToken().tokenString);
                
                let pictureRequest = FBSDKGraphRequest(graphPath: "me/picture?type=large&redirect=false", parameters: nil)
                pictureRequest.startWithCompletionHandler({
                    (connection, result, error: NSError!) -> Void in
                    if error == nil {
                        print("\(result)")
                    } else {
                        print("\(error)")
                    }
                })
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
        print(FBSDKAccessToken.currentAccessToken()?.tokenString);
    }
    // <<< Facebook Delegate Methods
}

