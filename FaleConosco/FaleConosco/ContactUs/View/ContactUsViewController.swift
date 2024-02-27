//
//  ContactUsViewController.swift
//  FaleConosco
//
//  Created by Michael Bressiani on 26/02/24.

import UIKit

public class ContactUsViewController: UIViewController {
    
    
    @IBOutlet weak var titleContactUsLabel: UILabel!
    @IBOutlet weak var descriptionContactUsLabel: UILabel!
    @IBOutlet weak var contactUsChangeButton: UIButton!
    
    let prefix = "55"
    let ddd = "11"
    let numberPhone = "123456789"
    
    var viewModel: ContactUsViewModel = ContactUsViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        
        let fullNumberPhone = viewModel.fullNumberPhone(prefix: prefix, ddd: ddd, numberPhone: numberPhone)
        viewModel.contactUs(fullNumberPhone: fullNumberPhone)
    }
    
    func elementsConfig() {
        titleContactUsLabel.text = "Fale com o Pan CredCard!"
        descriptionContactUsLabel.text = "O número de telefone abaixo é da nossa central de atendimento, clicando nele você será direcionado para falar com nossos atendentes."
        
        contactUsChangeButton.setTitle("123456789", for: .normal)
    }
}
