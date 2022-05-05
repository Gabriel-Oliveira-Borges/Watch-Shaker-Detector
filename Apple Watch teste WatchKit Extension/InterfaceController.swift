//
//  InterfaceController.swift
//  Apple Watch teste WatchKit Extension
//
//  Created by Gabriel Oliveira Borges on 04/05/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    private let motionController = MotionController.sharedInstance
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        print("Chegou aquiii")
        label.setText("Ativado")
        
        motionController.label = label
        motionController.delegate = self
        motionController.start()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        MotionController.sharedInstance.stop()
        label.setText("Desativado")
    }

}

extension InterfaceController: MotionControllerDelegate {
    func didShake() {
        label.setText("Did Shake")
        print("Did shake")
    }
    
    
}
