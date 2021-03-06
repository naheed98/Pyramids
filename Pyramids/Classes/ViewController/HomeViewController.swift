//
//  HomeViewController.swift
//  Pyramids
//
//  Created by Naheed Shamim on 01/11/17.
//  Copyright © 2017 Naheed Shamim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var instructionsView: UIView!
    @IBOutlet weak var highScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        highScore.text = "0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let score = Utility.getHighScore()
        {
            highScore.text = "\(score)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showInfoAction(_ sender: Any) {
        self.instructionsView.center = self.view.center
        
        self.instructionsView.layer.cornerRadius = 10
        Utility.showWithZoomAnim(view: self.instructionsView)
        self.view.addSubview(self.instructionsView)
    }

    @IBAction func closeInstructions(_ sender: UIButton) {
        Utility.hideWithZoomAnim(view: self.instructionsView, completion: nil)
        self.instructionsView.removeFromSuperview()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
