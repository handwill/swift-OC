//
//  ViewController.swift
//  testCatigery
//
//  Created by handwill on 2018/10/1.
//  Copyright © 2018年 handwill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var view = UIButton(frame: CGRect(x:100,y:100,width:100,height:100))
        view.backgroundColor = UIColor.red
        view.addTarget(self, action: #selector(ViewController.click), for: .touchUpInside)
        self.view .addSubview(view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        
    }
    @objc func click() {
        var controller = ZYTestViewController.init()
        self.present(controller, animated: true, completion: nil);
    }

}

