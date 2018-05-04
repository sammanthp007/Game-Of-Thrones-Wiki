//
//  GOTDataManager.swift
//  Game Of Thrones Wiki
//
//  Created by Samman Thapa on 5/4/18.
//  Copyright © 2018 Samman Labs. All rights reserved.
//

import Foundation
import Alamofire


let GOTDataManager = _GOTDataManager()

class _GOTDataManager {
    func fetchCharacterList(completion: @escaping (_ error: Error?, _ characters: [[String: Any]]?) -> Void) -> Void {
        guard let url = URL(string: "https://anapioficeandfire.com/api/characters/") else {
            print ("Could not unwrap url")
            let newError = NSError(domain: "GOTDataManagerError", code: 100, userInfo: ["message": " Could not unwrap the url for characters"])
            completion(newError, nil)
            return
        }
        
        Alamofire.request(url).responseJSON { (response) in
            if let characters = response.result.value as? [[String: Any]] {
                completion(nil, characters)
            }
        }
        
        completion(nil, nil)
    }
}
