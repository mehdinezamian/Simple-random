//
//  ViewController.swift
//  simple random number
//
//  Created by Mehdi Nezamian on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLbl: UILabel!
    
    @IBOutlet weak var randomTextLbl: UILabel!
    
    @IBOutlet weak var wheelBtn: UIButton!
    let randomColors = [UIColor.orange , UIColor.red , UIColor.white , UIColor.green , UIColor.purple , UIColor.systemPink , UIColor.yellow , UIColor.darkGray]
    let randomLuckyTexts = ["bad luck", "not today" , "try again" , "hope next time will be better" , "welldone" , "nice try", "so close" , "jackpot!!"]
    
    func setupView() {
      
        self.wheelBtn.layer.shadowColor = CGColor(red: 55, green: 62, blue: 79, alpha: 0.5)
        self.wheelBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.wheelBtn.layer.shadowOpacity = 1.0
        self.wheelBtn.layer.shadowRadius = 0.0
        self.wheelBtn.layer.masksToBounds = false
        self.wheelBtn.layer.cornerRadius = 4.0
         
        self.numberLbl.text = "۰"
        self.randomTextLbl.text = ""
    }
    func getRandomNumber(index:Int)-> UInt32{
        let lower: UInt32 = 0
        let upper: UInt32 = 8
        
        let randomNumber = arc4random_uniform(upper - lower) + lower
        self.wheelBtn.setTitle("\(self.getPersianNumber(number:randomNumber))", for: .normal)
        return randomNumber
    }
    func getPersianNumber(number:UInt32)-> String{
        switch number {
        case 0:
            return "0"
            break
        case 1:
            return "۱"
            break
        case 2:
            return "۲"
            break
        case 3:
            return "۳"
            break
        case 4:
            return "۴"
            break
        case 5:
            return "۵"
            break
        case 6:
            return "۶"
            break
        case 7:
            return "۷"
            break
            
        default:
        return "۰"
        }
    }
    
    func roundTheWheel(){
        var randomLuckyNumber:UInt32!
        
        DispatchQueue.global(qos: .background).async {
            
        
        for i in 0...7 {
            DispatchQueue.main.async {
                randomLuckyNumber = self.getRandomNumber(index: i)
                self.wheelBtn.backgroundColor = self.randomColors[i]
                if i == 7 {
                    self.wheelBtn.isEnabled = true
                    self.numberLbl.text = self.getPersianNumber(number: randomLuckyNumber!)
                    self.randomTextLbl.text = self.randomLuckyTexts[Int(randomLuckyNumber!)]
                    self.wheelBtn.setTitle("شانستو امتحان کن", for: .normal)
                } else {
                    self.wheelBtn.isEnabled = false
                    self.randomTextLbl.text = ""
                }
            }
            usleep(useconds_t(200000))
        }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     setupView()
    }
    
   

    @IBAction func wheelBtnPressed(_ sender: Any) {
    
    roundTheWheel()
    }
}

