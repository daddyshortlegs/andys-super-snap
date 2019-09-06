//
//  ViewController.swift
//  AndysSuperSnap
//
//  Created by Andy Smith on 06/09/2019.
//  Copyright © 2019 Andy Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var previousCard: UILabel!
    
    @IBOutlet weak var currentCard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawCard(card: previousCard, value: "5❤️")
        drawCard(card: currentCard, value: "9♣")
    }

    func drawCard(card: UILabel, value: String) {
        card.layer.cornerRadius = 10
        card.layer.borderColor = UIColor.black.cgColor
        card.layer.borderWidth = 1
        card.layer.masksToBounds = true
        
        card.text = value
    }
    
}

