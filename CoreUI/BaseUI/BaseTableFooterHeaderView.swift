//
//  BaseTableFooterHeaderView.swift
//  rabbank
//
//  Created by admin on 9/20/19.
//  Copyright © 2019 faba. All rights reserved.
//

import UIKit

open class BaseTableFooterHeaderView:UITableViewHeaderFooterView {
    @IBOutlet weak var view: UIView!
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        nibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
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
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
        
        return nibView
    }
}
