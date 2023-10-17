//
//  ViewControllerShop.swift
//  clicker game
//
//  Created by OLIVER MURRAY on 10/12/23.
//

import UIKit

class ViewControllerShop: UIViewController {

    var points : Double = 0
    var delegate : ViewControllerDelegate!
    var per : Double = 1.0
    @IBOutlet weak var pointsLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        points = delegate.show()
        pointsLabel2.text = String(points)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstShop(_ sender: UIButton) {
        
        if  points >= 10{
            points = points - 10
            per = per + 1
            delegate.upgrade(percent: per)
            delegate.minus(amount: 10)
            pointsLabel2.text = String(points)
        }
    }
    
    @IBAction func shop2(_ sender: Any) {
        
        if points >= 120{
          points = points - 120
            per = per + 10
            delegate.upgrade(percent: per)
            delegate.minus(amount: 120)
            pointsLabel2.text = String(points)
            
        }
        
    }
    
    @IBAction func shop3(_ sender: Any) {
        
        if points >= 1500{
           points = points - 1500
            per = per + 100
            delegate.upgrade(percent: per)
            delegate.minus(amount: 1500)
            pointsLabel2.text = String(points)
            
            
            
        }
        
    }
    
    
    
    
    
}
