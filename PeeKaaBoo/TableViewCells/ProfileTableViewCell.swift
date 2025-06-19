import UIKit

class ProfileTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var imageViewOutlet: UIView!
    @IBOutlet weak var searchDone: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewOutlet.layer.cornerRadius = imageViewOutlet.frame.size.width / 2
        imageViewOutlet.clipsToBounds = true
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 0.2
        searchView.layer.borderColor = UIColor.brown.cgColor
        searchDone.layer.cornerRadius = 10
        textField.delegate = self
        
        textField.attributedPlaceholder = NSAttributedString(
                  string: "Search Here",
                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.brown]
              )
        
        textField.textColor = .black
        
        btn.addTarget(self, action: #selector(present), for: .touchUpInside)
    }
     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func present() {
        let newViewController = parentViewController?.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        parentViewController?.present(newViewController, animated: true, completion: nil)
    }
    
    
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
