//
//  SignupViewController.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 16.01.25.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webService = SignupWebService(urlString: SignupConstants.signupURL)
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webService: webService, delegate: self)
        }
    }
    @IBAction func signupButtonAction(_ sender: UIButton) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")
        signupPresenter?.proccessUserSignup(formModel: signupFormModel)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignup() {
        let alert = UIAlertController(title: "Success", message: "The data is correct", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request couldn't be processed at this time", preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true)
        }
    }
    
    
}
