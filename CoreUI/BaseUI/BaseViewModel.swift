//
//  BaseViewModel.swift
//  rabbank
//
//  Created by admin on 5/16/19.
//  Copyright © 2019 faba. All rights reserved.
//

import Foundation

public typealias DialogConfirmHandler = (message: String, title: String, strYes: String, strNo: String)

public class Y4gViewModel {
    public var onError: ((String)->Void)?
    public var onShowErrorMesage: ((String)->Void)?
    public var onBeginIndicator:(()->Void)?
    public var onEndIndicator:(()->Void)?
    public var onOpenCamera:(()->Void)?
    public var onOpenPhoto:(()->Void)?

    public func parseError(_ error: Error?) {
        if let error = error {
            onError?(error.localizedDescription)
        }
    }

    public func finalError(_ error: Error?) {
        parseError(error)
        onEndIndicator?()
    }
    

}
