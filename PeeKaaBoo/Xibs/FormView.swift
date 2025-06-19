import UIKit

class FormView: UIView {

    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var btnClicked: UIButton!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var status: UISwitch!
    @IBOutlet weak var descriptionView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set the delegate for both titleTextField and descriptionTextField
        titleTextField.delegate = self
        descriptionTextField.delegate = self
    }
}

extension FormView: UITextFieldDelegate, UITextViewDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}
