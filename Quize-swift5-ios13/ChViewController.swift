//
//  ChViewController.swift
//  Quizzler-iOS13
//
//  Created by Moustafa on 12/16/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ChViewController: UIViewController {

    @IBOutlet weak var qLabl: UILabel!
    @IBOutlet weak var scorLabl: UILabel!
    @IBOutlet weak var ch1: UIButton!
    @IBOutlet weak var ch2: UIButton!
    @IBOutlet weak var ch3: UIButton!
    @IBOutlet weak var progBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ChoDataService.instance.playAudio()
        UpdateUI()
       
    }
    @IBAction func selectChoice(_ sender: UIButton) {
        if ChoDataService.instance.checkAnswer(c: (sender.titleLabel?.text!)!)==true
        {
            sender.backgroundColor = .green
            print("right")
        }
        else
        {
            sender.backgroundColor = .red
            print("False")
        }
        ChoDataService.instance.plus(vc:self)
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.UpdateUI), userInfo: nil, repeats: false)
        

    }
    
   @objc func UpdateUI()
    {
        qLabl.text=ChoDataService.instance.getQ()
        ch1.setTitle(ChoDataService.instance.getCh1(), for: .normal)
        ch2.setTitle(ChoDataService.instance.getCh2(), for: .normal)
        ch3.setTitle(ChoDataService.instance.getCh3(), for: .normal)
        ch1.backgroundColor = .clear
        ch2.backgroundColor = .clear
        ch3.backgroundColor = .clear
        scorLabl.text=" scor: \(ChoDataService.instance.score)"
        progBar.progress=ChoDataService.instance.prog()
        
        print(ChoDataService.instance.getCh1())
    }
    

}
