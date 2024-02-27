//
//  ContactUsViewModel.swift
//  FaleConosco
//
//  Created by Michael Bressiani on 26/02/24.
//

import Foundation
import UIKit

class ContactUsViewModel {
    
    public func fullNumberPhone(prefix: String, ddd: String, numberPhone: String) -> String {
        return prefix + ddd + numberPhone
    }
    
    public func contactUs(fullNumberPhone: String) {
        if let url = URL(string: "tel://\(fullNumberPhone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
