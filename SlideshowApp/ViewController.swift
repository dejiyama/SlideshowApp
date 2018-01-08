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
        image1 = UIImage(named:"img1")
        image2 = UIImage(named:"img2")
        image3 = UIImage(named:"img3")
        image = [image1,image2,image3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var imageView: UIImageView!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var image: [UIImage]=[]
    
}

