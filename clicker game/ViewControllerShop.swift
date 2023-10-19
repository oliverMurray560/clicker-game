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
        else{
            let alert = UIAlertController(title: "Errror", message: "Not Enough Money", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            
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
        else{
            let alert = UIAlertController(title: "Errror", message: "Not Enough Money", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            
            
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
        else{
            let alert = UIAlertController(title: "Errror", message: "Not Enough Money", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func gambleAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Warning", message: "Do you want to risk all your money?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "no", style: .default, handler: nil)
        let yesAction = UIAlertAction(title: "yes", style: .default) { action in
            let rand = Int.random(in: 1...2)
            if rand == 1{
                self.delegate.minus(amount: self.points)
                self.points = 0
                
            }
            else{
                
                self.delegate.add(amount: self.points)
                self.points = self.points * 2
                
                
            }
            self.pointsLabel2.text = String(self.points)
            
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
}
