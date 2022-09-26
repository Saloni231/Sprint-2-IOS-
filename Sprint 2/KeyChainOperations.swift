//
//  KeyChainOperations.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 21/09/22.
//

import UIKit

class KeyChainOperations: NSObject {

    //MARK: Storing Email ID and password as key chain object
    class func saveKey(key: String, password: Data) -> OSStatus {
        
        let saveQuery = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: password
        ] as [String : Any]
        
        //SecItemDelete(saveQuery as CFDictionary)
        
        let status = SecItemAdd(saveQuery as CFDictionary, nil)
        return status
    }
    
    //MARK: Reteriving key chain object
    class func reteriveKey(key: String) -> Data? {
        
        let reteriveQuery = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ] as [String : Any]
        
        var content : AnyObject? = nil
        
        let status = SecItemCopyMatching(reteriveQuery as CFDictionary, &content)
        
        if status == noErr {
            
            let contenData = content as! Data
            return(contenData)
        } else {
            fatalError("Error")
        }
    }
}
