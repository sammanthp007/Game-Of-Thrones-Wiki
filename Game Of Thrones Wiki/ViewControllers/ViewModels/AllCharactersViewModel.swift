//
//  AllCharactersViewModel.swift
//  Game Of Thrones Wiki
//
//  Created by Samman Thapa on 5/4/18.
//  Copyright © 2018 Samman Labs. All rights reserved.
//

import Foundation

class AllCharactersViewModel: NSObject {
    @IBOutlet var gotDataManager: GOTDataManager!
    
    // Hold data received from api call
    var allCharacters: [[String: Any]]?
    
    func getAllCharacters(completion: @escaping (_ error: Error?) -> Void) -> Void {
        gotDataManager.fetchCharacterList { (error, allCharacters) in
            if let error = error {
                completion(error)
            }
            /* since this will affect the UI */
            DispatchQueue.main.async {
                /* probably this is where we convert the dictionary to model objects */
                self.allCharacters = allCharacters
                completion(nil)
            }
        }
    }
    
    /* functions used by TableViewController */
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return self.allCharacters?.count ?? 0
    }
    
    func getCharacterNametoDisplay(for indexPath: IndexPath) -> String {
        return self.allCharacters?[indexPath.row]["name"] as? String ?? "Samman"
    }
}
