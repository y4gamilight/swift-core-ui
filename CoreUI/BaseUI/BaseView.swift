//
//  BaseView.swift
//  rabbank
//
//  Created by admin on 5/21/19.
//  Copyright © 2019 faba. All rights reserved.
//

import UIKit

class BaseView: UIView {

    @IBOutlet weak var view: UIView!
    var parentClass:String? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    init?(coder aDecoder: NSCoder, parentClass:String?) {
        super.init(coder: aDecoder)
        self.parentClass = parentClass
        nibSetup()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {
        backgroundColor = .clear

        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }

   func loadViewFromNib() -> UIView {
        if let parentClass = self.parentClass {
            let nib = UINib(nibName: parentClass, bundle: nil)
            let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
            return nibView
        } else {
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
            let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
            return nibView
        }

    }
}
