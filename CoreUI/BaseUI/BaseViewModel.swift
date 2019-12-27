//
//  BaseViewModel.swift
//  rabbank
//
//  Created by admin on 5/16/19.
//  Copyright © 2019 faba. All rights reserved.
//

import Foundation

typealias DialogConfirmHandler = (message: String, title: String, strYes: String, strNo: String)

class Y4gViewModel {
    var onError: ((String)->Void)?
    var onShowErrorMesage: ((String)->Void)?
    var onBeginIndicator:(()->Void)?
    var onEndIndicator:(()->Void)?
    var onOpenCamera:(()->Void)?
    var onOpenPhoto:(()->Void)?

    func parseError(_ error: Error?) {
        if let error = error {
            onError?(error.localizedDescription)
        }
    }

    func finalError(_ error: Error?) {
        parseError(error)
        onEndIndicator?()
    }
    

}
