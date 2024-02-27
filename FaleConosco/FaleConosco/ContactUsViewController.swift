//
//  ContactUsViewController.swift
//  FaleConosco
//
//  Created by Michael Bressiani on 26/02/24.
//

import UIKit

public class ContactUsViewController: UIViewController {
    @IBOutlet weak var contactUsChangeButton: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func contactUsButton(_ sender: UIButton)
    {
        
        let busPhone = "11934326088"
        if let url = URL(string: "tel://\(busPhone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
