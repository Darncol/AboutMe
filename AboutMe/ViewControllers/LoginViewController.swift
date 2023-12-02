

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPasswordTF: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = user.login
        userPasswordTF.text = user.password
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController,
              let welcomeVC = tabBarVC.viewControllers?[0] as? WelcomeViewController
        else { return }
        welcomeVC.user = user
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user.login, userPasswordTF.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            ) {
                self.userPasswordTF.text = ""
            }
            return false
        }
        return true
    }
    
    @IBAction func unwindSegueToVC(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        userPasswordTF.text = ""
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(
            title: "Oops!",
            message: "Your name is \(user.login) 😉"
        )
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(
            title: "Oops!",
            message: "Your password is \(user.password) 😉"
        )
    }
}

// MARK: - Alert
extension LoginViewController {
    private func showAlert(
        title: String,
        message: String,
        onOk: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title, 
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default) { _ in
                onOk?()
            }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


