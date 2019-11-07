//
//  ViewController.swift
//  IUE-Worksheet5
//
//  Created by Oleksandr Gevko on 06/11/2019.
//  Copyright © 2019 Oleksandr Gevko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var minusButton: CustomButton!
    
    @IBOutlet weak var plusButton: CustomButton!
    
    @IBOutlet weak var counterView: CounterView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    public override func viewWillAppear(_ animated: Bool) {
        
        plusButton.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        
        minusButton.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
        
        counterView.transform = CGAffineTransform(translationX: 0, y: -view.bounds.height)
        
        counterLabel.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1,
            delay: 1,
            options: [.curveEaseInOut],
            animations: {[weak self] in
                self?.plusButton.transform =  CGAffineTransform.identity
                self?.minusButton.transform = CGAffineTransform.identity
                self?.counterView.transform = CGAffineTransform.identity
                self?.counterLabel.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    @IBAction public func plusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
        animations: {[weak self] in
            self?.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            
            self?.plusButton.transform = CGAffineTransform.identity
                    })
        counterView.currentNumber += 1
        updateCounterLabel()
    }
    
    private func updateCounterLabel() { UIView.transition(with: counterLabel,
duration: 0.25,
    options: .transitionCrossDissolve,
    animations: { [weak self] in
        guard let self = self else { return }
        self.counterLabel.text = String(self.counterView.currentNumber)
        }, completion: nil) }
    
    
    @IBAction public func minusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.25,
                       animations: {[weak self] in
                        self?.minusButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                        
                        self?.minusButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                                    })
                counterView.currentNumber -= 1
                updateCounterLabel()
    }
}

