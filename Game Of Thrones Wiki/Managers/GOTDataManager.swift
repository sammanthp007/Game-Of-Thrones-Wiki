//
//  GOTDataManager.swift
//  Game Of Thrones Wiki
//
//  Created by Samman Thapa on 5/4/18.
//  Copyright © 2018 Samman Labs. All rights reserved.
//

import Foundation
import Alamofire


@objc protocol GOTDataManagerProtocol {
    func fetchCharacterList(completion: @escaping (_ error: Error?, _ character: [[String: Any]]?) -> Void)
}

class GOTDataManager: NSObject, GOTDataManagerProtocol {
    func fetchCharacterList(completion: @escaping (Error?, [[String : Any]]?) -> Void) {
        guard let url = URL(string: "https://anapioficeandfire.com/api/characters/") else {
            print ("Could not unwrap url")
            let newError = NSError(domain: "GOTDataManagerError", code: 100, userInfo: ["message": " Could not unwrap the url for characters"])
            completion(newError, nil)
            return
        }
        
        Alamofire.request(url).responseJSON { (response) in
            if let characters = response.result.value as? [[String: Any]] {
                completion(nil, characters)
            } else {
                let newError = NSError(domain: "GOTDataManagerError", code: 404, userInfo: ["message": "Could not find any data"])
                completion(newError, nil)
            }
        }
    }
}
