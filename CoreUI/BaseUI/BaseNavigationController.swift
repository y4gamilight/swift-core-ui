//
// Created by Thanh Le on 2019-04-12.
// Copyright (c) 2019 faba. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController {

    var onLogout:(()->Void)?
    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func setNavigationBarHidden(_ isHidden: Bool) {
        DispatchQueue.main.async {[weak self] in
            self?.isNavigationBarHidden = true
        }
    }

   public func customPush(_ controller: UIViewController, animated: Bool) {
        DispatchQueue.main.async {[weak self] in
            self?.pushViewController(controller, animated: animated)
        }
    }
    
   public func customPresent(_ controller: UIViewController, animated: Bool, completion:(()-> Void)? = nil) {
        DispatchQueue.main.async {[weak self] in
            controller.modalPresentationStyle = .overFullScreen
            self?.present(controller, animated: animated, completion: completion) 
        }
    }

    deinit {

    }
}
