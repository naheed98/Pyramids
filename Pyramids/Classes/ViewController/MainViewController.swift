
//  MainViewController.swift
//  Pyramids
//
//  Created by Naheed Shamim on 24/10/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//
import UIKit
import SceneKit

class MainViewController: UIViewController, GameScoreDelegate {
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var livesLbl: UILabel!
    @IBOutlet weak var mGameView: GameView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()        
        mGameView.scoreDelegate = self
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func closeGameAction(_ sender: Any)
    {
        mGameView.stopGame()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pauseAction(_ sender: UIButton)
    {
        let pauseLbl = sender
        let buttonTitle = mGameView.isGamePaused ? "Pause" : "Resume"
        pauseLbl.setTitle(buttonTitle,for: .normal)
        
        mGameView.pauseGame()
    }
    
    @IBAction func levelChange(_ sender: Any)
    {
        mGameView.setLevel(level: 2)
    }
    
    func updateScore(score: Int)
    {
        DispatchQueue.main.async
        {
            self.scoreLbl.text = "\(score)"
            Utility.showZoomOutIn(view: self.scoreLbl, scaleFactor:2.0)
        }
    }
    
    func updateLives(life: Int) {
        DispatchQueue.main.async
        {
            self.livesLbl.text = "\(life)"
            
            Utility.showZoomOutIn(view: self.livesLbl, scaleFactor: 8.0)
        }        
    }
}
