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
    
    override func didMove(to view: SKView) {
        if ( !initiated ) { //初期化時のみ実行
            self.initContent()
            self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
            self.initiated = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        // 図形の追加
        addShape(location)
    }
    
    func initContent() {
        self.backgroundColor = SKColor.blue // 背景色設定
        let label = self.newHelloNode() // テキストノードの作成
        self.addChild(label) // sceneにテキストノードを追加
    }
    
    func newHelloNode(_: Void) -> SKLabelNode {
        let helloNode = SKLabelNode(text: "Hello, World!")
        helloNode.fontColor = UIColor(red: 1.0, green:1.0, blue: 1.0, alpha: 1)
        helloNode.fontSize = 60
        helloNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        // 物理演算の追加
        helloNode.physicsBody = SKPhysicsBody(rectangleOf: helloNode.frame.size)
        helloNode.physicsBody?.isDynamic = false
        return helloNode
    }
    
    func addShape(_ location: CGPoint) {
        let size = self.frame.width/100.0
        let shape = SKShapeNode(circleOfRadius: size)
        shape.fillColor = UIColor.white // 塗りつぶし設定
        shape.position = location
        
        // 物理演算の追加
        shape.physicsBody = SKPhysicsBody(circleOfRadius: size)
        shape.physicsBody?.isDynamic = true // このオブジェクト自体が物理演算によって動くように指定
        self.addChild(shape)
    }
    
}
