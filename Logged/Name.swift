import UIKit

class Name: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad()
    {
        name.delegate = self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}