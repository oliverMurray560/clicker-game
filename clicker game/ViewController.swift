//
//  ViewController.swift
//  clicker game
//
//  Created by OLIVER MURRAY on 10/4/23.
//


protocol ViewControllerDelegate{
    
    func upgrade(percent: Double)
    func minus(amount: Double)
    func show() -> Double
}



import UIKit

class ViewController: UIViewController, ViewControllerDelegate {
    
    
    func show() -> Double {
        return points
    }
    
    func minus(amount: Double) {
        points = points - amount
    }
    
    func upgrade(percent: Double) {
     factor = percent
    }
    

    @IBOutlet weak var pointsLabel: UILabel!
    var factor : Double = 1
    var points : Double = 0
    var total : Double = 0
    var check = 1
    var clickCounter : Int = 1
    var check2 : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pointsLabel.text = String(points)
    }
    override func viewWillAppear(_ animated: Bool) {
        pointsLabel.text = String(points)
    }

    
    @IBAction func clickAction(_ sender: Any) {
        points += 1 * factor
        total += 1 * factor
        
        pointsLabel.text = String(points)
        
        
        
        if total >= 10000 && check == 1{
            let alert = UIAlertController(title: "Congrats", message: "You've generated 10,000 total points", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            check = 0
        }
        
        if clickCounter >= 1000 && check2 == 1{
            let alert = UIAlertController(title: "Congrats", message: "You've clicked 1000 times", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            check2 = 0
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerShop
        nvc.delegate = self
    }
    
    
    
    
}

