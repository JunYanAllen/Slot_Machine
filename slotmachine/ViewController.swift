//
//  ViewController.swift
//  slotmachine
//
//  Created by 張駿彥 on 2019/5/20.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageArray = ["🍎","😍","🐮","🐼","🐔","🎅","🚍","💖","👑","👻"]
        
        for _ in 1...100{
            dataArray1.append((Int)(arc4random() % 10))
            dataArray2.append((Int)(arc4random() % 10))
            dataArray3.append((Int)(arc4random() % 10))
        }
        
        resultLabel.text = ""
    }


    @IBAction func buttonClicked(_ sender: Any) {
        pickerView.selectRow(Int(arc4random())%94 + 3, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random())%94 + 3, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random())%94 + 3, inComponent: 2, animated: true)
        
        if(dataArray1[pickerView.selectedRow(inComponent: 0)] == dataArray2[pickerView.selectedRow(inComponent: 1)] && dataArray2[pickerView.selectedRow(inComponent: 1)] == dataArray3[pickerView.selectedRow(inComponent: 2)]){
            resultLabel.text = "Bingo!!"
        }else{
            resultLabel.text = ""
        }
    }
    
}
extension ViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if component == 0{
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        }else if component == 1{
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        }else{
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
}
