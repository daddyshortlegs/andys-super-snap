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

        drawCard(cardView: previousCard, card: Card(pipValue: .five, suit: .hearts))
        drawCard(cardView: currentCard, card: Card(pipValue: .nine, suit: .clubs))
        
        let deck = Deck()
        
        var previousDrawnCard = ""
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if !deck.isEmpty() {
                let drawnCard = deck.takeCard()?.value
                
                self.currentCard.text = drawnCard
                self.previousCard.text = previousDrawnCard
                
                previousDrawnCard = drawnCard ?? ""
                
            } else {
                timer.invalidate()
            }
        }
    }

    func drawCard(cardView: UILabel, card: Card) {
        cardView.layer.cornerRadius = 10
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.masksToBounds = true
        
        cardView.text = "\(card.value)"
    }
    
}

