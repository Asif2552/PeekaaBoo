import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonView.layer.cornerRadius = 15

    }

    @IBAction func signInBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        if let tabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController") as? UITabBarController {
               guard let window = UIApplication.shared.windows.first else { return }
               window.rootViewController = tabBarController
               window.makeKeyAndVisible()
           }
    }
    
}

