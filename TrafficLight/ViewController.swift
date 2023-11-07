//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Solop on 02.11.2023.
//


// Я заметил странный баг если в xcode выбран такой же айфон как на симуляторе то view на светофоре круглые а если на симуляторе например айфон 15 а в икскоде выбран например 13 pro то почему-то светофор больше не круглый если его перезапустить


import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    private var currentLightIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLightViews()
        
        setLightsToInactiveState()
    }

    private func updateCurrentLightState() {
        if currentLightIndex == 0 { currentLightIndex += 1 }
        if currentLightIndex > 3 { currentLightIndex = 1 }
    }

    private func configureLightViews() {
        redView.layer.cornerRadius = redView.frame.size.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.size.width / 2
        greenView.layer.cornerRadius = greenView.frame.size.width / 2
    }

    private func setLightsToInactiveState() {
        redView.alpha = 0.3
        yellowView.alpha = 0.3
        greenView.alpha = 0.3
    }

    private func switchLight() {
        switch currentLightIndex {
        case 1:
            redView.alpha = 1
            currentLightIndex += 1
        case 2:
            yellowView.alpha = 1
            currentLightIndex += 1
        case 3:
            greenView.alpha = 1
            currentLightIndex += 1
        default:
            break
        }
    }

    @IBAction func changeLight(_ sender: UIButton) {
        sender.setTitle("Next", for: .normal)

        updateCurrentLightState()

        setLightsToInactiveState()

        switchLight()
    }
}
