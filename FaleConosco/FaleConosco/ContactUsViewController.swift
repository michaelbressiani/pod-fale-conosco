//
//  ContactUsViewController.swift
//  FaleConosco
//
//  Created by Michael Bressiani on 26/02/24.
//

import UIKit

class ContactUsViewController: UIViewController {
    @IBOutlet weak var contactUsChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func contactUsButton(_ sender: UIButton) {
        guard let url = URL(string: "tel://+5511934326088") else {
            print("Não é possível fazer chamadas telefônicas neste dispositivo.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
