//
//  ViewController.swift
//  SpriteLearn
//
//  Copyright (c) 2015年 soymsk. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        let skView = self.view as! SKView
        // 画面サイズと同じ大きさのscene作成
        let scene = GameScene(size: skView.bounds.size) // ストーリーボードでviewのクラスをSKViewに設定しているので、SKViewのインスタンスとして取得できる
        skView.presentScene(scene) // SKView上にsceneを設定
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

