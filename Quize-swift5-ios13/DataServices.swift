//
//  DataServices.swift
//  Quizzler-iOS13
//
//  Created by Moustafa on 12/15/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
struct tFDataService {
    static var instance=tFDataService()
    var player:AVAudioPlayer!

    
   private let quizeTF:[Question]=[Question(q: " 1- my name is mostafa ", a:"True" ),Question(q: "2-  your age = 22", a: "True"),Question(q:" 3- you study Fci" , a:"True"),Question(q:" 4- 3+8 = 12", a: "False"),Question(q:"5- cairo capital of Egypt" , a: "True"),Question(q:" 6- 22/2=2" , a: "False"),Question(q:" 7- zwail from Egypt" , a: "True"),Question(q:" 8- 1-1 = -1" , a:"False" ),Question(q:"9- 1+1 = 1", a: "False"),Question(q:"10-  1+100=20" , a:"False" ),Question(q: "A slug's blood is green.", a: "True"),
               Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
               Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
               Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
               Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
               Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
               Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
               Question(q: "Google was originally called 'Backrub'.", a: "True"),
               Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
               Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
               Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
               Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

       ]
    
    var scor = 0
    
    var numOfQuestion=0
    var proCount:Float!
    func getQize()->[Question]
    {
        return quizeTF
    }
    
    mutating func answer(answer:String) -> Bool {
        if quizeTF[numOfQuestion].anser==answer
        {
            scor += 1
            return true
                    }
        else
        {
            return false
        }
    }
    
    func getCount()->Int
    {
        return quizeTF.count
    }
    func getNexQ()->String
    {
        return getQize()[numOfQuestion].text
    }
    mutating func Getscor()->Int
    {
        
        return scor
    }
   
    func getProsses()->Float
    {
        let proCount=Float(numOfQuestion)/Float(getQize().count)
        return proCount
    }
     
    mutating func plus(vc:UIViewController)
    {
        if  numOfQuestion+1 < getQize().count
        {
            numOfQuestion += 1
      
            
        }
        else
        {
            
            stopAudio()
            
            let alert=UIAlertController(title: "Done", message: "correct:\(scor) \n wrong:\(quizeTF.count-scor)", preferredStyle: .alert)
            let action=UIAlertAction(title: "Ok", style: .default) { (action) in
               
                vc.performSegue(withIdentifier: "mVC", sender: vc)
            }
           
            alert.addAction(action)
            vc.present(alert,animated:true,completion:nil)
            numOfQuestion=0
            scor=0
            
            print("Done")
        }
    }
    
    mutating func playAudio(){
           let url=Bundle.main.url(forResource: "begin", withExtension: "mp3")
           player=try! AVAudioPlayer(contentsOf: url!)
           player.play()
       }
       func stopAudio()
       {
           player.stop()
       }
       
    
    
    //----------------------------------------------------------------
    
    
    
    
    
}
struct ChoDataService {
    
     static var instance=ChoDataService()
    var player:AVAudioPlayer!

    
      private let quizeCH:[cQuestion]=[cQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        cQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        cQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        cQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        cQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        cQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        cQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        cQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        cQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        cQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    
    var numberOfQ=0
    var score=0
    var pro:Float=0
    func getQuestion()->[cQuestion]
    {
        return quizeCH
    }
    
    func getQ()->String
    {
        return quizeCH[numberOfQ].text
    }
    func getCh1()->String
    {
        return quizeCH[numberOfQ].ch[0]
    }
    func getCh2()->String
    {
        return quizeCH[numberOfQ].ch[1]
    }
    func getCh3()->String
    {
        return quizeCH[numberOfQ].ch[2]
    }
    mutating func plus(vc:UIViewController)
    {
        if numberOfQ+1 < quizeCH.count
        {
            numberOfQ += 1
            
        }
        else
        {
            stopAudio()
            let alert=UIAlertController(title: "Done", message: "correct:\(score) \n wrong:\(quizeCH.count-score)", preferredStyle: .alert)
            let action=UIAlertAction(title: "ok", style: .default) { (action) in
                vc.performSegue(withIdentifier: "mVC", sender: vc)
            }
            
            alert.addAction(action)
            vc.present(alert,animated:true,completion:nil)
            score=0
            numberOfQ=0
            pro=0
        }
    }
    
    mutating func checkAnswer(c:String)->Bool
     {
        if quizeCH[numberOfQ].correctAnswer==c
        {
            score += 1
            return true
        }
        else
        {
            return false
        }
    }
    mutating func prog()->Float
    {
         pro=Float(numberOfQ)/Float(quizeCH.count)
        print(pro)
        return pro
    }
    
    mutating func playAudio(){
        let url=Bundle.main.url(forResource: "begin", withExtension: "mp3")
        player=try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func stopAudio()
    {
        player.stop()
    }
    
    
    
}
