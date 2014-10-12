//
//  Menu.swift
//  TxoroTxori
//
//  Created by Imanol Terán Maruri on 12/10/14.
//  Copyright (c) 2014 imanolteran. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

var musicaInicial = AVAudioPlayer()
var creacionDeEscena = Bool()

class Menu: SKScene {
   
    override func didMoveToView(view: SKView) {
        if !creacionDeEscena {
            self.crearContenidoEscena()
            creacionDeEscena = true
            self.startMusica()
        }
    }
    
    
    func crearContenidoEscena (){
        var fondo = SKSpriteNode(imageNamed: "fondoInicio")
        fondo.size = self.size
        fondo.position = CGPointMake (CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(fondo)
        self.scaleMode = .AspectFit
        self.addChild(self.tituloJuego())
        self.addChild(self.jugar())
        self.addChild(self.creditos())
        
        //****************************************************
        //*** Implementar imágenes y animaciones título ******
        //****************************************************
        var titulo = SKSpriteNode(imageNamed: "txori1")
        titulo.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) * 1.3)
        titulo.setScale(0.5)
        titulo.name = "dibujoTitulo"
        
        self.addChild(titulo)
        
        // Animación título
        var tituloAtlas = SKTextureAtlas(named: "titulo")
        var txori1 = tituloAtlas.textureNamed("txori1")
        var txori2 = tituloAtlas.textureNamed("txori2")
        var txori3 = tituloAtlas.textureNamed("txori3")
        var txori4 = tituloAtlas.textureNamed("txori4")
        var txori5 = tituloAtlas.textureNamed("txori5")
        var txori6 = tituloAtlas.textureNamed("txori6")
        var txori7 = tituloAtlas.textureNamed("txori7")
        var txori8 = tituloAtlas.textureNamed("txori8")
        var txori9 = tituloAtlas.textureNamed("txori9")
        var txori10 = tituloAtlas.textureNamed("txori10")
        var txori11 = tituloAtlas.textureNamed("txori11")
        var txori12 = tituloAtlas.textureNamed("txori12")
        var txori13 = tituloAtlas.textureNamed("txori13")
        var txori14 = tituloAtlas.textureNamed("txori14")
        var txori15 = tituloAtlas.textureNamed("txori15")
        var txori16 = tituloAtlas.textureNamed("txori16")
        var txori17 = tituloAtlas.textureNamed("txori17")
        var txori18 = tituloAtlas.textureNamed("txori18")
        var txori19 = tituloAtlas.textureNamed("txori19")
        var txori20 = tituloAtlas.textureNamed("txori20")
        var txori21 = tituloAtlas.textureNamed("txori21")
        var txori22 = tituloAtlas.textureNamed("txori22")
        
        var arrayTexturas = [txori1, txori2, txori3, txori4, txori5, txori6, txori7, txori8, txori9, txori10, txori11, txori12, txori13, txori14, txori15, txori16, txori17, txori18, txori19, txori20, txori21, txori22]
        
        var animacion = SKAction.animateWithTextures(arrayTexturas, timePerFrame: 0.2)
        titulo.runAction(animacion)
        
        
    }
    
    //****************************************************
    //*** Implementar Labels de Menu, Juego y Créditos ***
    //****************************************************
    
    func tituloJuego() -> SKLabelNode{
        var pantallaMenu = SKLabelNode(fontNamed: "HelveticaNeue")
        pantallaMenu.text = "TxoroTxori ®"
        pantallaMenu.fontSize = 10
        pantallaMenu.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1/3 - 60)
        
        return pantallaMenu
    }
    
    func jugar() -> SKLabelNode {
        var juego = SKLabelNode(fontNamed: "HekveticaNeue-Bold")
        juego.text = "Jolastu!"
        juego.fontSize = 30
        juego.fontColor = SKColor(red: 1, green: 0.65, blue: 0, alpha: 1)
        
        juego.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 0.8)
        juego.name = "juego"
        
        return juego
    }
    
    func creditos() -> SKLabelNode {
        var imagenCreditos = SKLabelNode(fontNamed: "HelveticaNeue")
        imagenCreditos.text = "Kredituak"
        imagenCreditos.fontSize = 20
        imagenCreditos.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 2/6)
        imagenCreditos.name = "imagenCreditos"
        
        return imagenCreditos
    }
    
    
    //****************************************************
    //*** Implementar Música *****************************
    //****************************************************
    
    func startMusica() {
        var rutaMusica = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Pintxo1", ofType: "mp3")!)
        musicaInicial = AVAudioPlayer(contentsOfURL: rutaMusica, error: nil)
        musicaInicial.prepareToPlay()
        musicaInicial.numberOfLoops = -1
        musicaInicial.play()
    }
    
    func stopMusica() {
        musicaInicial.stop()
    }
    
    
    //****************************************************
    //*** Implementar transiciones ***********************
    //****************************************************
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let toque: AnyObject? = touches.anyObject()
        var tocarLabel = toque?.locationInNode(self)
        var nodo = self.nodeAtPoint(tocarLabel!)
        
        if nodo.name == "juego"{
            var transicion = SKTransition.doorsOpenVerticalWithDuration(2)
            var escena1 = GameScene.sceneWithSize(self.frame.size)
            self.view?.presentScene(escena1, transition: transicion)
            
            self.stopMusica()
        }
        if nodo.name == "imagenCreditos"{
            var transicion = SKTransition.doorsOpenVerticalWithDuration(2)
            var escena2 = Creditos.sceneWithSize(self.frame.size)
            self.view?.presentScene(escena2, transition: transicion)
            
            self.stopMusica()
        }
        
        
    }
    
    
    
    
    
    
    
    
}
