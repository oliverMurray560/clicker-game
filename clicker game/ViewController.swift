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
        pointsLabel.text = String(points)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewControllerShop
        nvc.delegate = self
    }
    
    
    
    
}

