//
//  AllCharactersViewController.swift
//  Game Of Thrones Wiki
//
//  Created by Samman Thapa on 5/4/18.
//  Copyright © 2018 Samman Labs. All rights reserved.
//

import UIKit

class AllCharactersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        GOTDataManager.fetchCharacterList { (error, characters) in
            print ("got all characters")
            print (characters)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
