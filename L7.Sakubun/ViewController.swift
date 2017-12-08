//
//  ViewController.swift
//  L7.Sakubun
//
//  Created by Yuuki Kurosawa on 2017/11/23.
//  Copyright © 2017年 Yuuki Kurosawa. All rights reserved.
//

import UIKit
import AVFoundation  //speak

class ViewController: UIViewController {
    @IBOutlet weak var tvSentence: UITextView!
    var speak:AVSpeechSynthesizer = AVSpeechSynthesizer()  //speak
    
    //節の配列
    let whenArray:[String] = ["1952年","雛鳥が巣立つ頃","忘れもしない昨日10時54分", "いつとも知れぬ時", "今から40年前"]
    let whereArray:[String] = ["ライン戦線","北方ノルデン","ダキア公国領","どことも知れぬ場所","三日三晩進軍を続けたところ"]
    let whoArray:[String] = ["ターニャ・デグレチャフ少佐","セレブリャコーフ少尉","アンソン・スー大佐","無能"]
    let whoArray2:[String] = ["存在X","協商連合","フランソワ共和国","アメリア", "ヴァルハラ"]
    let doArray:[String] = ["爆撃しました","勝利しました","撤退しました","涅槃へ到達した", "喝采をあげた","戦死しました"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //作文ボタンを押した時の処理
    @IBAction func tapMakeSentence(_ sender: Any) {
        let whenNumber:Int = random(whenArray.count)
        let whereNumber:Int = random(whereArray.count)
        let whoNumber:Int = random(whoArray.count)
        let whoNumber2:Int = random(whoArray2.count)
        let doNumber:Int = random(doArray.count)
        let strSentence:String = whenArray[whenNumber] + ", " + whereArray[whereNumber] + "で" + whoArray[whoNumber] + "と" + whoArray2[whoNumber2] + "が" + doArray[doNumber]
        
        tvSentence.text = strSentence
        
        //speak
        let content = AVSpeechUtterance(string: strSentence)
        content.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        self.speak.speak(content)
    }
    
    //乱数を作るファンクション
    func random(_ limit: Int) -> Int {
        return Int(arc4random() % UInt32(limit))
    }
    
}

