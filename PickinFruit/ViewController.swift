//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.delegate = self
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 0, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 1, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count))), inComponent: 2, animated: true)
        
        winCondition()
    }
    
    func winCondition() {
        let selectedFruit0 = fruitPicker.selectedRow(inComponent: 0)
        let selectedFruit1 = fruitPicker.selectedRow(inComponent: 1)
        let selectedFruit2 = fruitPicker.selectedRow(inComponent: 2)
        
        if (selectedFruit0, selectedFruit1) == (selectedFruit1 , selectedFruit2) {
            resultLabel.text = "WINNER!"
            
        } else {
            resultLabel.text = "TRY AGAIN"
//            self.resultLabel.alpha = 0;
//            UIView.animateKeyframes(withDuration: 1.5, delay: 0.3, options: .repeat, animations: {
//                UIView.addKeyframe(withRelativeStartTime: <#T##Double#>, relativeDuration: <#T##Double#>, animations: <#T##() -> Void#>)
//                }, completion: nil)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
        
    }
    
    // DataSource Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    

}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



