//
//  ContactUsViewModel.swift
//  FaleConosco
//
//  Created by Michael Bressiani on 26/02/24.
//

import Foundation
import UIKit

protocol ContactUsViewModelProtocol: AnyObject {
    func successContact()
    func errorContact()
}

class ContactUsViewModel {
    
    weak var delegate: ContactUsViewModelProtocol?
    
    public func fullNumberPhone(prefix: String, ddd: String, numberPhone: String) -> String {
        return prefix + ddd + numberPhone
    }
    
    public func contactUs(fullNumberPhone: String) {
        
        guard let urlTelefone = URL(string: "tel://\(fullNumberPhone)") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(urlTelefone) {
            UIApplication.shared.open(urlTelefone, options: [:], completionHandler: nil)
            self.delegate?.successContact()
        } else {
            self.delegate?.errorContact()
            print("Dispositivo não tem capacidade de realizar chamadas telefônicas.")
        }
    }
}

