//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 出島大和 on 2018/01/08.
//  Copyright © 2018年 出島大和. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func onTapImage(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    //一定間隔で処理を行うためのタイマー
    var timer: Timer!
    var timer_sec: Float = 0
    
    //表示している画像の番号
    var displayImageNo = 0
    
    //表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "img1.jpg",
            "img2.jpg",
            "img3.jpg",
            ]
        
        
        //範囲より下を指している場合、最後の画像を表示
        if displayImageNo < 0 {
            displayImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if displayImageNo > 2 {
            displayImageNo = 0
        }
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        //画像を読み込み
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image1 = UIImage(named:"img1.jpg")
        image2 = UIImage(named:"img2.jpg")
        image3 = UIImage(named:"img3.jpg")
        
        image = [image1,image2,image3]
        
        imageView.image = image1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        // 遷移先のresultviewcontrollerで宣言しているimageに現在表示しているimageを渡す
        resultViewController.image = imageView.image
    }
    
    
    
    
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var image: [UIImage]=[]
    
    @IBOutlet weak var playPauseAction: UIButton!
    
    @IBAction func playPauseAction(_ sender: Any) {
        
        /*タイマーが始動中かどうか*/ 
        if timer == nil {
            //タイマーを作成・始動
            
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            print("timerStart")
            
            playPauseAction.setTitle("停止", for: .normal)
            
            
            //ボタンを無効にする
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        }else{
            //タイマーの停止
            self.timer.invalidate()
            
            //タイマーをnilにしておく
            timer = nil
            
            print("timerStop")
            
            playPauseAction.setTitle("再生", for: .normal)
            
            nextButton.isEnabled = true
            prevButton.isEnabled = true
        }
        
        
    }
    
    //selector: #selector(updatetimer)で指定された関数
    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 3
        print("ontimer")
        
        
        //表示している画像の番号を１増やす
        displayImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
        print("image")
        
        
        
    }
    

    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func next(_ sender: Any) {
        
        
        //表示している画像の番号を１増やす
        displayImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBAction func prev(_ sender: Any) {
        
        //表示している画像の番号を１増やす
        displayImageNo -= 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
}

