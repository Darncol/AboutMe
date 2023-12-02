

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeUserNameLabel: UILabel!
    @IBOutlet weak var personNameLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientLayer()
        updateLabelInfo()
        sendToInfoVC()
    }
    
    private func updateLabelInfo() {
        guard let user = user else { return }
        
        welcomeUserNameLabel.text = "Welcome, \(user.login)!"
        personNameLabel.text = "My name is \(user.person.name) \(user.person.surname)"
    }
    
    private func sendToInfoVC() {
        if let controllers = self.tabBarController?.viewControllers,
           let navigationVC = controllers[1] as? UINavigationController,
           let userInfoVC = navigationVC.viewControllers.first as? UserInfoViewController {
            userInfoVC.user = user
        }
    }
}
