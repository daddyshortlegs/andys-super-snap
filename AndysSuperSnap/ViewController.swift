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

        drawCard(cardView: previousCard, card: Card("5❤️"))
        drawCard(cardView: currentCard, card: Card("9♣"))
    }

    func drawCard(cardView: UILabel, card: Card) {
        cardView.layer.cornerRadius = 10
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.masksToBounds = true
        
        cardView.text = card.value
    }
    
}

