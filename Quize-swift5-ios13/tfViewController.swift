//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class tfViewController: UIViewController {
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLable: UILabel!
    
    var proCount:Float!
    var score=0
    var time:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        tFDataService.instance.playAudio()
                updateUI()
              
    }
    @IBAction func buttonPress(_ sender: UIButton) {
       
        let yourAnser=sender.currentTitle
        let realAnser=tFDataService.instance.getQize()[tFDataService.instance.numOfQuestion].anser
        let rr=tFDataService.instance.answer(answer: yourAnser!)
        
        if rr
        {
            
                sender.backgroundColor=UIColor.green
            
            
           
            print("Right")
        }
        else
        {
           
                sender.backgroundColor=UIColor.red
            
            print("false")
        }


        tFDataService.instance.plus(vc:self)
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: true)

    }
    @objc func updateUI()
    {
        questionLbl.text=tFDataService.instance.getNexQ()
        progressBar.progress=tFDataService.instance.getProsses()
        trueBtn.backgroundColor=UIColor.clear
        falseBtn.backgroundColor=UIColor.clear
        
        scoreLable.text="scor: \(tFDataService.instance.Getscor())"
        
        
    }
}

