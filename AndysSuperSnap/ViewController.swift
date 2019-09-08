//
//  ViewController.swift
//  AndysSuperSnap
//
//  Created by Andy Smith on 06/09/2019.
//  Copyright © 2019 Andy Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameStatusPresenter {

    @IBOutlet weak var previousCard: UILabel!
    
    @IBOutlet weak var currentCard: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawCard(cardView: previousCard)
        drawCard(cardView: currentCard)
        
        let deck = Deck()
        
        var previousDrawnCard: String?
    
        displayStatus(message: "Get ready....")
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if !deck.isEmpty() {
                self.displayStatus(message: "")

                let drawnCard = deck.takeCard()?.value
                self.showCard(cardView: self.currentCard, value: drawnCard)
                
                if previousDrawnCard != nil {
                    self.showCard(cardView: self.previousCard, value: previousDrawnCard)
                }
                
                previousDrawnCard = drawnCard ?? ""
                
            } else {
                timer.invalidate()
                self.displayStatus(message: "Game over")
            }
        }
    }

    func drawCard(cardView: UILabel) {
        cardView.layer.cornerRadius = 10
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.masksToBounds = true
    }
    
    func showCard(cardView: UILabel, value: String?) {
        if value != nil {
            cardView.text = value
            cardView.isHidden = false
        }
    }
    
    func displayStatus(message: String) {
        self.gameStatus.text = message
    }
    
}

