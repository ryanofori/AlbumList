//
//  SecondViewController.swift
//  AlbumList
//
//  Created by Ryan Ofori on 8/12/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var albumViewModel = AlbumViewModel()
    
    var isConfetiiVisable = false
    
    @IBAction func confetiiButton(_ sender: Any) {
        
        if isConfetiiVisable {
            isConfetiiVisable = false
        } else {
            isConfetiiVisable = true
        }
        confetiiLayer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func confetiiLayer() {
        
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x, y: -100)
        layer.name = "confetii"
        
        let colors: [UIColor] = [
            .systemRed, .systemBlue, .systemYellow, .systemGreen
        ]
        let cells: [CAEmitterCell] = colors.compactMap{
            let cell = CAEmitterCell()
            cell.scale = 0.02
            cell.birthRate = 40
            cell.lifetime = 10
            cell.emissionRange = .pi * 2
            cell.velocity = 150
            cell.color = $0.cgColor
            cell.contents = UIImage(named: "WhiteSquare")?.cgImage
            return cell
        }
        
        layer.emitterCells = cells
        if isConfetiiVisable {
            view.layer.addSublayer(layer)
        } else {
            view.layer.sublayers?.forEach { layer in
                if layer.name == "confetii" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
}
