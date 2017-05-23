//
//  ViewController.swift
//  HRM
//
//  Created by akash savediya on 16/05/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var userID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        let user : String = self.userID.text!
        let password : String = self.passField.text!
        
        
        if user != "" && password != "" {
        
//        let isUserValid = validateEmail(userString: user)
//        if isUserValid {
            
            let postString = ["username":user, "upss": password]
            
            var request = URLRequest(url:URL(string:"http://45.64.11.210/airtel_hrm/webapi/api/login")!)
            
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application-idValue", forHTTPHeaderField: "secret-key")
            request.httpBody = try! JSONSerialization.data(withJSONObject: postString, options:.prettyPrinted)
            let session = URLSession.shared
            
            //Post
            session.dataTask(with: request){data, response, err in
                
                //Guard: ws there error ?
                guard(err == nil) else {
                    print("\(err)")
                    return
                }
                //Guard: check was any data returned?
                guard let data = data else{
                    print("no data return")
                    return
                }
                //Convert Json to Object
                let parseResult: [String:AnyObject]!
                do{
                    parseResult = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as! [String:AnyObject]
                    print("\(parseResult)")
                } catch {
                    print("Could not parse data as Json \(data)")
                    return
                }
                //Check jsonDictionary
                guard let jsonArray = parseResult["success"] as? [String:AnyObject] else{
                    print("jsonDictionary error")
                    return
                }
                
                //check jsonArray and switch to LoginViewController
                if(jsonArray.count == 0 ){
                    print("jsonArray not found")
                    return
                } else{
                    DispatchQueue.main.async{
                        //                    let loginvc = LoginViewController()
                        //                    self.present(loginvc, animated: true, completion: nil)
                        print(jsonArray)
                        
                    }
                }
                
                }.resume()
            
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            print("user logged in")
            
            } else {
            print("Invalid User")
            alertTheUser(title: "Email And Password Are Required", message: "Please Enter Email and Password")
        
        }
        
        
    }
    
    // show password func
    @IBAction func showPassword(_ sender: Any) {
        
        if passField.isSecureTextEntry{
            passField.isSecureTextEntry = false
            
        }else{
            passField.isSecureTextEntry = true;
        } 
        
    }
    
     // Email validation
    func validateEmail(userString:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: userString)
        
    }
        // alert pop-up
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }

}

