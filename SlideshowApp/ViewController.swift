//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 出島大和 on 2018/01/08.
//  Copyright © 2018年 出島大和. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    @IBOutlet weak var imageView: UIImageView!
    
    //一定間隔で処理を行うためのタイマー
    var timer: Timer!
    var timer_sec: Float = 0
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var image: [UIImage]=[]
    
    
    @IBAction func playPauseAction(_ sender: Any) {
        
        /*タイマーが始動中かどうか*/ 
        if timer.isValid == true {
            //タイマーの停止
            self.timer.invalidate()
        
            
        }else{
            //タイマーの作成、始動
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }

    }
    
    //selector: #selector(updatetimer)で指定された関数
    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 0.1
        print("ontimer")
    }
    
    
    

    

    
}

