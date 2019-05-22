//
//  ViewController.swift
//  ARKitDreamYard
//
//  Created by Di Gain on 20/05/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
        
        drawHouse()
        drawCylinder()
        drawCircle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
 
        sceneView.session.pause()
    }

}

extension ViewController {
    
    func drawHouse() {
        let scene = SCNScene(named: "art.scnassets/house.dae")!
        let node = scene.rootNode.clone()
        node.position = SCNVector3(0.1, 0, 0)
        node.scale = SCNVector3(0.01, 0.01, 0.01)
       
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    func drawCylinder() {
        let cylinder = SCNNode(geometry: SCNCylinder(radius: 0.002, height: 0.08))
        cylinder.position = SCNVector3(0.03, 0.04, 0.05)
        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        sceneView.scene.rootNode.addChildNode(cylinder)
    }
    
    func drawCircle() {
        let circle = SCNNode(geometry: SCNSphere(radius: 0.02))
        circle.position = SCNVector3(0.03, 0.08, 0.05)
        circle.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        sceneView.scene.rootNode.addChildNode(circle)
    }
}
