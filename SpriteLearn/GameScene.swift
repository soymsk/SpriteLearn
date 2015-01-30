//
//  GameScene.swift
//  SpriteLearn
//
//  Copyright (c) 2015年 soymsk. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene {
    var initiated: Bool = false;

    /* sceneがSKView上に表示される度に呼ばれる関数 */
    
    override func didMoveToView(view: SKView) {
        if ( !initiated ) { //初期化時のみ実行
            self.initContent()
            self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
            self.initiated = true
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.allObjects[0] as UITouch
        let location = touch.locationInNode(self)
        
        // 図形の追加
        addShape(location)
    }
    
    func initContent() {
        self.backgroundColor = SKColor.blueColor() // 背景色設定
        var label = self.newHelloNode() // テキストノードの作成
        self.addChild(label) // sceneにテキストノードを追加
    }
    
    func newHelloNode(Void) -> SKLabelNode {
        var helloNode = SKLabelNode(text: "Hello, World!")
        helloNode.fontColor = UIColor(red: 1.0, green:1.0, blue: 1.0, alpha: 1)
        helloNode.fontSize = 60
        helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))

        // 物理演算の追加
        helloNode.physicsBody = SKPhysicsBody(rectangleOfSize: helloNode.frame.size)
        helloNode.physicsBody?.dynamic = false
        return helloNode
    }
    
    func addShape(location: CGPoint) {
        var size = self.frame.width/100.0
        let shape = SKShapeNode(circleOfRadius: size)
        shape.fillColor = UIColor.whiteColor() // 塗りつぶし設定
        shape.position = location
        
        // 物理演算の追加
        shape.physicsBody = SKPhysicsBody(circleOfRadius: size)
        shape.physicsBody?.dynamic = true // このオブジェクト自体が物理演算によって動くように指定
        self.addChild(shape)
    }
    
}
