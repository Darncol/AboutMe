

import UIKit

final class UserInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cartoonTitleLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientLayer()
        updateUserInfo()
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userBioVC = segue.destination as? UserBioViewController else {
            return
        }
        userBioVC.user = user
    }
    
    private func updateUserInfo() {
        guard let user = user else { return }
        title = "\(user.person.name) \(user.person.surname)"
        navigationItem.backButtonTitle = "\(user.person.name)"
        
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = user.person.age
        cartoonTitleLabel.text = user.person.cartoonTitle
        friendsLabel.text = user.person.friends
    }
}
