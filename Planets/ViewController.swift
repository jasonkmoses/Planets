//
//  ViewController.swift
//  Planets
//
//  Created by jason Moses on 2019/06/18.
//  Copyright © 2019 jason Moses. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate
{

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        let sun = SCNSphere(radius: 1.8)
        let mecury = SCNSphere(radius: 0.08)
        let venus = SCNSphere(radius: 0.17)
        let earth = SCNSphere(radius: 0.18)
        let mars = SCNSphere(radius: 0.155)
        let jupiter = SCNSphere(radius: 1.1)
        let saturn = SCNSphere(radius: 0.7)
//        let saturnRing = SCNSphere(radius: 0.95)
        let uranus = SCNSphere(radius: 0.86)
        let neptune = SCNSphere(radius: 0.87)

        let material = SCNMaterial()
        let material2 = SCNMaterial()
        let material3 = SCNMaterial()
        let material4 = SCNMaterial()
        let material5 = SCNMaterial()
        let material6 = SCNMaterial()
        let material7 = SCNMaterial()
        let material8 = SCNMaterial()
        let material9 = SCNMaterial()
        
        
        material9.diffuse.contents = UIImage(named: "art.scnassets/neptune.jpg")
        material8.diffuse.contents = UIImage(named: "art.scnassets/uranus.jpg")
        material7.diffuse.contents = UIImage(named: "art.scnassets/saturn.jpg")
        material6.diffuse.contents = UIImage(named: "art.scnassets/jupiter.jpg")
        material5.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        material4.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        material3.diffuse.contents = UIImage(named: "art.scnassets/venus.jpg")
        material2.diffuse.contents = UIImage(named: "art.scnassets/mercury.jpg")
        material.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        
        sun.materials = [material]
        mecury.materials = [material2]
        venus.materials = [material3]
        earth.materials = [material4]
        mars.materials = [material5]
        jupiter.materials = [material6]
        saturn.materials = [material7]
        uranus.materials = [material8]
        neptune.materials = [material9]
        
        let nodeSun = SCNNode()
        let nodeMecury = SCNNode()
        let nodeVenus = SCNNode()
        let nodeEarth = SCNNode()
        let nodeMars = SCNNode()
        let nodeJupiter = SCNNode()
        let nodeSaturn = SCNNode()
        let nodeUrauns = SCNNode()
        let nodeNeptune = SCNNode()
        nodeMars.position = SCNVector3(7.8, 0.1, -6.3)
        nodeEarth.position = SCNVector3(8.8, 0.1, -7.8)
        nodeVenus.position = SCNVector3(9.2, 0.1, -8.4)
        nodeMecury.position = SCNVector3(10.8, 0.1, -9)
        nodeSun.position = SCNVector3(12, 0.1, -14.7)
        nodeJupiter.position = SCNVector3(6.2, 0.1, -7.8)
        nodeSaturn.position = SCNVector3(5, 0.1, -7.8)
        nodeUrauns.position = SCNVector3(4.5, 0.1, -7.8)
        nodeNeptune.position = SCNVector3(3.5, 0.1, -7.8)
        nodeMars.geometry = mars
        nodeEarth.geometry = earth
        nodeMecury.geometry = mecury
        nodeVenus.geometry = venus
        nodeSun.geometry = sun
        nodeJupiter.geometry = jupiter
        nodeSaturn.geometry = saturn
        nodeUrauns.geometry = uranus
        nodeNeptune.geometry = neptune
        sceneView.scene.rootNode.addChildNode(nodeSun)
        sceneView.scene.rootNode.addChildNode(nodeMecury)
        sceneView.scene.rootNode.addChildNode(nodeVenus)
        sceneView.scene.rootNode.addChildNode(nodeEarth)
        sceneView.scene.rootNode.addChildNode(nodeMars)
        sceneView.scene.rootNode.addChildNode(nodeJupiter)
        sceneView.scene.rootNode.addChildNode(nodeSaturn)
        sceneView.scene.rootNode.addChildNode(nodeUrauns)
        sceneView.scene.rootNode.addChildNode(nodeNeptune)
        
        sceneView.autoenablesDefaultLighting = true

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        ARWorldTrackingConfiguration().planeDetection = .horizontal
        
 
        // Run the view's session
        sceneView.session.run(ARWorldTrackingConfiguration())
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
        let pl = SCNPlane(width: CGFloat((anchor as! ARPlaneAnchor).extent.x), height: CGFloat((anchor as! ARPlaneAnchor).extent.y))
        let grid = SCNNode()
        grid.position = SCNVector3(x: (anchor as! ARPlaneAnchor).center.x, y: 0, z: (anchor as! ARPlaneAnchor).center.z)
        grid.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        let m = SCNMaterial()
        m.diffuse.contents = UIImage(named: "art.scnassets/GRID.png")
        pl.materials = [m]
        grid.geometry = pl
        node.addChildNode(grid)
        }
        else {
            return
        }
    }
    
}
