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
        
        let snap = Snap(presenter: self)
        
        DispatchQueue.global(qos: .background).async {
            snap.play()
        }        
    }

    func drawCard(cardView: UILabel) {
        cardView.layer.cornerRadius = 10
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.masksToBounds = true
    }
    
    func updateCurrentCardView(drawnCard: String?) {
        self.showCard(cardView: self.currentCard, value: drawnCard)
    }
    
    func updatePreviousCardView(drawnCard: String?) {
        if drawnCard != nil {
            self.showCard(cardView: self.previousCard, value: drawnCard)
        }
    }
    
    func showCard(cardView: UILabel, value: String?) {
        if value != nil {
            cardView.text = value
            cardView.isHidden = false
        }
    }
    
    func displayStatus(message: String) {
        DispatchQueue.main.async {
            self.gameStatus.text = message
        }
    }
    
}

