//
//  CustomButton.swift
//  IUE-Worksheet5
//
//  Created by Oleksandr Gevko on 06/11/2019.
//  Copyright © 2019 Oleksandr Gevko. All rights reserved.
//

import UIKit

@IBDesignable public class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable  var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    public override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let halfWidth = bounds.width / 2
        let halfHeight = bounds.height / 2
        let lineWidth: CGFloat = min(bounds.width, bounds.height) * 0.5
        let halfLineWidth = lineWidth / 2
        let linesPath = UIBezierPath()
        linesPath.lineWidth = 3
        
        linesPath.move(to: CGPoint(
        x: halfWidth - halfLineWidth,
                  y: halfHeight))
        linesPath.addLine(to: CGPoint(
        x: halfWidth + halfLineWidth,
        y: halfHeight))
        
        if (isAddButton) { linesPath.move(to: CGPoint(
        x: halfWidth,
        y: halfHeight - halfLineWidth))
        linesPath.addLine(to: CGPoint( x: halfWidth,
        y: halfHeight + halfLineWidth))
        }
        
        UIColor.white.setStroke()
        linesPath.stroke()
        
    }
    }
    

