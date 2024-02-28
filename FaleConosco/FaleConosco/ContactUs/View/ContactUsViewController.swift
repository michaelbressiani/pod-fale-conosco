//
//  ContactUsViewController.swift
//  FaleConosco
//
//  Created by Michael Bressiani on 26/02/24.

import UIKit

public class ContactUsViewController: UIViewController {
    
    
    @IBOutlet weak var titleContactUsLabel: UILabel!
    @IBOutlet weak var descriptionContactUsLabel: UILabel!
    @IBOutlet weak var titlePhoneNumberLabel: UILabel!
    @IBOutlet weak var contactUsChangeButton: UIButton!
    
    let prefix = "55"
    let ddd = "11"
    let numberPhone = "923456789"
    
    var viewModel: ContactUsViewModel = ContactUsViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        
        let fullNumberPhone = viewModel.fullNumberPhone(prefix: prefix, ddd: ddd, numberPhone: numberPhone)
        viewModel.contactUs(fullNumberPhone: fullNumberPhone)
    }
    
    func elementsConfig() {
        titleContactUsLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleContactUsLabel.numberOfLines = 2
        titleContactUsLabel.text = "Fale com o Pan CredCard!"
        
        descriptionContactUsLabel.numberOfLines = 4
        descriptionContactUsLabel.textAlignment = .justified
        descriptionContactUsLabel.textColor = UIColor.gray
        descriptionContactUsLabel.text = "O número de telefone abaixo é da nossa central de atendimento, clicando nele você será direcionado para falar com um de nossos atendentes."
        
        titlePhoneNumberLabel.text = "Telefone:"
        titlePhoneNumberLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            
        
        contactUsChangeButton.setAttributedTitle(NSAttributedString(string: numberPhone, attributes: [.font: UIFont.systemFont(ofSize: 25.0, weight: .bold)]), for: .normal)
    }
}
