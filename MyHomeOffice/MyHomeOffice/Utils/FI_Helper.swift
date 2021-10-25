//
//  FI_Helper.swift
//  MyHomeOffice
//
//  Created by Johnson Liu on 10/25/21.
//

import UIKit
import LocalAuthentication


class FI_Helper: NSObject {
    
    let kNoFeature = "not support BioMetric features"
    let kFaceId = "having Face ID"
    let kTouchId = "having Touch ID"
    
    //MARK: -
    
    func checkBioMetricTypes() -> String {
        let authContext = LAContext()
        
        if #available(iOS 11, *) {
            let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
            switch(authContext.biometryType) {
            case .none:
                return kNoFeature
            case .touchID:
                return kTouchId
            case .faceID:
                return kFaceId
            default:
                return kNoFeature
            }
        }
        else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? kTouchId : kNoFeature
        }
    }
    
    
    func authenticationWithFaceID(vc: UIViewController, completion: @escaping  (Bool)->()) {
        let localAuthContext = LAContext()
        localAuthContext.localizedFallbackTitle = "Please use your passcode."
        
        var authError: NSError?
        let reason = "Authentication requires to access the secure data."
        
        if localAuthContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            localAuthContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, evaluateError in
                if success {
                    DispatchQueue.main.async() {
                        let alert = UIAlertController(title: "Success", message: "Authenticated succesfully!", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        vc.present(alert, animated: true, completion: nil)
                        
                        completion(true)
                    }
                }
                else {
                    if let error = evaluateError {
                        print(error)
                    }
                    completion(false)
                }
            }
        }
        else {
            if let error = authError {
                print(error)
            }
            completion(false)
        }
    }
    
}
