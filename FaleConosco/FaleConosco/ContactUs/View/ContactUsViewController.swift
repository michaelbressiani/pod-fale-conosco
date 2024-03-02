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
    let numberPhonePrint = "(11) 9 2345 6789"
    
    var viewModel: ContactUsViewModel = ContactUsViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        elementsConfig()
        fadeInElementsInitialConfigContactUs()
        backNavegationFadeOut()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fadeInContactUs()
    }
    
    @IBAction func contactUsButton(_ sender: UIButton) {
        
        let fullNumberPhone = viewModel.fullNumberPhone(prefix: prefix, ddd: ddd, numberPhone: numberPhone)
        viewModel.contactUs(fullNumberPhone: fullNumberPhone)
    }
    
    func fadeInContactUs() {
        UITableView.animate(withDuration: 2.0) {
            self.titleContactUsLabel.alpha = 1
        }
        UISearchBar.animate(withDuration: 2.0) {
            self.descriptionContactUsLabel.alpha = 1
        }
        UIButton.animate(withDuration: 2.0) {
            self.titlePhoneNumberLabel.alpha = 1
        }
        UIButton.animate(withDuration: 2.0) {
            self.contactUsChangeButton.alpha = 1
        }
    }
    
    func fadeInElementsInitialConfigContactUs() {
        self.titleContactUsLabel.alpha = 0
        self.descriptionContactUsLabel.alpha = 0
        self.titlePhoneNumberLabel.alpha = 0
        self.contactUsChangeButton.alpha = 0
    }
    
    func backNavegationFadeOut() {
        
        let backButtonNavegation = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backActionNavegation))
        self.navigationItem.leftBarButtonItem = backButtonNavegation
    }
    
    @objc func backActionNavegation() {
        UITableView.animate(withDuration: 1.0) {
            self.titleContactUsLabel.alpha = 0
        }
        UISearchBar.animate(withDuration: 1.0) {
            self.descriptionContactUsLabel.alpha = 0
        }
        UIButton.animate(withDuration: 1.0) {
            self.titlePhoneNumberLabel.alpha = 0
        }
        UIButton.animate(withDuration: 1.0) {
            self.contactUsChangeButton.alpha = 0
        }
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
        self.navigationController?.popViewController(animated: false)
        })
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
        
        let titleString = NSAttributedString(string: numberPhonePrint, attributes: [
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0, weight: .bold)
                ])
        contactUsChangeButton.setAttributedTitle(titleString, for: .normal)
        contactUsChangeButton.tintColor = UIColor(red: 0/255.0, green: 176/255.0, blue: 240/255.0, alpha: 1.0)
    }
}

extension ContactUsViewController: ContactUsViewModelProtocol {
    func successContact() {
    }
    
    func errorContact() {
        let alert = UIAlertController(title: "\u{1F615}", message: "Dispositivo não realiza chamadas telefônicas", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
