//
//  ViewController.swift
//  RollerCoaster
//
//  Created by zino-mac on 2020/02/07.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mario: UIImageView!
    
    var pointArray:Array = Array<Array<CGFloat>>()
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(createPoint))
        
        self.view.addGestureRecognizer(gesture)
    }

    
    @objc func createPoint(touch: UITapGestureRecognizer){
        let point:CGPoint = touch.location(in: self.view)
        
        NSLog("x: %f , y:%f", point.x, point.y)
        
        let rect = UIView(frame: CGRect(x: point.x, y: point.y, width: 3, height: 3))
        rect.backgroundColor = UIColor.red

        let pos:Array = [point.x, point.y]
        
        pointArray.append(pos)
        
        self.view.addSubview(rect)
    }
    
    @IBAction func btnClick(_ sender: Any) {
        startAni()
    }
    
    func startAni(){
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    
    @objc func move(){
        let arr = pointArray[index]
        mario.frame.origin = CGPoint(x: arr[0], y: arr[1])
        
        if index < pointArray.count-1 {
            index += 1
        }
    }
}

