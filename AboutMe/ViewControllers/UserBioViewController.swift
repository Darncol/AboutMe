

import UIKit

final class UserBioViewController: UIViewController {

    @IBOutlet weak var bioLabel: UITextView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientLayer()
        updateBioInfo()
    }
    
    private func updateBioInfo() {
        guard let user = user else { return }
        
        title = "\(user.person.name) \(user.person.surname) Биография"
        bioLabel.text = user.person.bio
    }
}
