//
//  AllCharactersViewModel.swift
//  Game Of Thrones Wiki
//
//  Created by Samman Thapa on 5/4/18.
//  Copyright © 2018 Samman Labs. All rights reserved.
//

import UIKit

class AllCharactersViewModel: NSObject {
    @IBOutlet var gotDataManager: GOTDataManager!
    
    // Hold data received from api call
    var allCharacters: [[String: Any]]?
}
