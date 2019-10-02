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
    
    @IBOutlet weak var deck: DeckView!
    
    var snap: Snap?
    
    @IBOutlet weak var deckButton: UIButton!
    
    @IBAction func takeCard(_ sender: UIButton) {
        snap?.takeTurn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snap = Snap(presenter: self)
        drawCard(cardView: previousCard)
        drawCard(cardView: currentCard)
    }

    func drawDeck(deckView: UIView) {
        deckView.layer.cornerRadius = 10
        deckView.layer.masksToBounds = true

        deckView.layer.shadowColor = UIColor.black.cgColor
        deckView.layer.shadowOpacity = 1
        deckView.layer.shadowOffset = .zero
        deckView.layer.shadowRadius = 10
    }
    
    func drawCard(cardView: UILabel) {
        cardView.layer.cornerRadius = 10
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.masksToBounds = true
    }
    
    func updateCurrentCardView(drawnCard: String?) {
        showCard(cardView: self.currentCard, value: drawnCard)
    }
    
    func updatePreviousCardView(drawnCard: String?) {
        if drawnCard != nil {
            showCard(cardView: self.previousCard, value: drawnCard)
        }
    }
    
    private func showCard(cardView: UILabel, value: String?) {
        if value != nil {
            cardView.text = value
            cardView.isHidden = false
        }
    }
    
    func gameOver(message: String) {
        displayStatus(message: message)
        deckButton.isHidden = true
    }
    
    func displayStatus(message: String) {
        DispatchQueue.main.async {
            self.gameStatus.text = message
        }
    }
    
}

