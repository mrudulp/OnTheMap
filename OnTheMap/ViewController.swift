//
//  ViewController.swift
//  OnTheMap
//
//  Created by Mrudul Pendharkar on 21/12/15.
//  Copyright © 2015 ShreeVed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var backgroundGradient:CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginPressed(sender: AnyObject) {
        // Create and add the view to the screen.
        let progressHUD = ProgressHUD(text: "Loading Student Data")
        self.view.addSubview(progressHUD)
        // All done!
        
        self.view.backgroundColor = UIColor.blackColor()
        
        OTMHTTPClient.sharedInstance().getStudentLocations { (result, errorString) -> Void in
            switch result {
                case .PASS:
                    print("Student data fetch successful")
                    self.showPinView()
                case .FAIL:
                    print("Failed to Fetch Student Data with Error \(errorString)")
            }
        }
    }
    
    func showPinView(){
        
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("TabViewController")
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
    func configureUI(){
        /* Configure background gradient */
        self.view.backgroundColor = UIColor.clearColor()
/*        let colorTop = UIColor(red: 0.748, green: 0.254, blue: 0.0, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 0.954, green: 0.054, blue: 0.08, alpha: 1.0).CGColor
*/
        let colorTop = UIColor(red: 0.211, green: 0.254, blue: 0.254, alpha: 1.0).CGColor
        let colorBottom = UIColor(red: 0.748, green: 0.254, blue: 0.0, alpha: 1.0).CGColor
        //        let colorBottom = UIColor(red: 0.211, green: 0.084, blue: 0.0, alpha: 1.0).CGColor
        self.backgroundGradient = CAGradientLayer()
        self.backgroundGradient!.colors = [colorTop, colorBottom]
        self.backgroundGradient!.locations = [0.0, 1.0]
        self.backgroundGradient!.frame = view.frame
        self.view.layer.insertSublayer(self.backgroundGradient!, atIndex: 0)
        
        /* Configure header text label */
//        headerTextLabel.font = UIFont(name: "AvenirNext-Medium", size: 24.0)
//        headerTextLabel.textColor = UIColor.whiteColor()
//        
        /* Configure email textfield */
        let emailTextFieldPaddingViewFrame = CGRectMake(0.0, 0.0, 13.0, 0.0);
        let emailTextFieldPaddingView = UIView(frame: emailTextFieldPaddingViewFrame)
        usernameTextField.leftView = emailTextFieldPaddingView
        usernameTextField.leftViewMode = .Always
        usernameTextField.font = UIFont(name: "AvenirNext-Medium", size: 17.0)
        usernameTextField.backgroundColor = UIColor(red: 0.702, green: 0.863, blue: 0.929, alpha:1.0)
        usernameTextField.textColor = UIColor(red: 0.0, green:0.502, blue:0.839, alpha: 1.0)
        usernameTextField.attributedPlaceholder = NSAttributedString(string: usernameTextField.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        usernameTextField.tintColor = UIColor(red: 0.0, green:0.502, blue:0.839, alpha: 1.0)
        
        /* Configure password textfield */
        let passwordTextFieldPaddingViewFrame = CGRectMake(0.0, 0.0, 13.0, 0.0);
        let passwordTextFieldPaddingView = UIView(frame: passwordTextFieldPaddingViewFrame)
        passwordTextField.leftView = passwordTextFieldPaddingView
        passwordTextField.leftViewMode = .Always
        passwordTextField.font = UIFont(name: "AvenirNext-Medium", size: 17.0)
        passwordTextField.backgroundColor = UIColor(red: 0.702, green: 0.863, blue: 0.929, alpha:1.0)
        passwordTextField.textColor = UIColor(red: 0.0, green:0.502, blue:0.839, alpha: 1.0)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        passwordTextField.tintColor = UIColor(red: 0.0, green:0.502, blue:0.839, alpha: 1.0)
        
        loginButton.tintColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        loginButton.backgroundColor = UIColor(red: 0.7, green: 0.9, blue: 0.4, alpha: 0.9)
        
        /* Configure debug text label */
//        headerTextLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
//        headerTextLabel.textColor = UIColor.whiteColor()

    }
}

