//
// Created by Thanh Le on 2019-04-12.
// Copyright (c) 2019 faba. All rights reserved.
//

import UIKit
import MBProgressHUD
import GSMessages
 
open class Y4gViewController: UIViewController {
    
    override open func viewDidLoad() {
        super.viewDidLoad() 

    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   public func showError(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let confirmButton = UIAlertAction(title: "OK", style: .default) { _ in
//            alertController.dismiss(animated: false)
        }
        alertController.addAction(confirmButton)
        DispatchQueue.main.async {[weak self] in
            self?.present(alertController, animated: true)
        }
    }

   public func showConfirmButton( properties: DialogConfirmHandler, handler:((Bool)->())?) {
        let alertController = UIAlertController(title: properties.title, message: properties.message, preferredStyle: .alert)

        let confirmButton = UIAlertAction(title: properties.strYes, style: .default) { _ in
//            alertController.dismiss(animated: false)
            handler?(true)
        }
        let cancelButton =  UIAlertAction(title: properties.strNo, style: .default) { _ in
//            alertController.dismiss(animated: false)
            handler?(false)
        }
        alertController.addAction(confirmButton)
        alertController.addAction(cancelButton)
        DispatchQueue.main.async {[weak self] in
            self?.present(alertController, animated: true)
        }
    }
 

   public func startIndicator() {

        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: false)
        }
    }

   public func stopIndicator() {

        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: false)
        }
    }

   public func showErrorMessage(message: String) {
        DispatchQueue.main.async {[weak self] in
            let autoHide = GSMessageOption.autoHide(true)
            let height = GSMessageOption.height(50)
            let textAlign = GSMessageOption.textAlignment(.bottomCenter)
            let color = GSMessageOption.textColor(.white)
            self?.showMessage(message, type: .error, options: [autoHide, color, height, textAlign])
        } 
    }


    deinit {
        DispatchQueue.global(qos: .background).async {
            print("\(self) deiniting.... ")
        }
    }
}
