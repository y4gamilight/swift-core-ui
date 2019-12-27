//
// Created by Thanh Le on 2019-04-12.
// Copyright (c) 2019 faba. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    var onLogout:(()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavigationBarHidden(_ isHidden: Bool) {
        DispatchQueue.main.async {[weak self] in
            self?.isNavigationBarHidden = true
        }
    }

    func customPush(_ controller: UIViewController, animated: Bool) {
        DispatchQueue.main.async {[weak self] in
            self?.pushViewController(controller, animated: animated)
        }
    }
    
    func customPresent(_ controller: UIViewController, animated: Bool, completion:(()-> Void)? = nil) {
        DispatchQueue.main.async {[weak self] in
            controller.modalPresentationStyle = .overFullScreen
            self?.present(controller, animated: animated, completion: completion) 
        }
    }

    deinit {

    }
}
