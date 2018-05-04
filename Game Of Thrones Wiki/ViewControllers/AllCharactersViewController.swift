//
//  AllCharactersViewController.swift
//  Game Of Thrones Wiki
//
//  Created by Samman Thapa on 5/4/18.
//  Copyright © 2018 Samman Labs. All rights reserved.
//

import UIKit

class AllCharactersViewController: UIViewController {
    @IBOutlet var allCharacterViewModel: AllCharactersViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        allCharacterViewModel.getAllCharacters { (error) in
            if let error = error {
                /* create a new error based on the message */
                print ("oops, we found nothing", error.localizedDescription)
                self.displayMessageToUserUsingAlert(title: "Oops", message: "Could not load data", completion: nil, okButtonText: "Ok", afterHittingAction: nil)
            } else {
                print ("got all characters")
            }
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

extension AllCharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allCharacterViewModel.numberOfItemsToDisplay(in: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersCell", for: indexPath)
        cell.textLabel?.text = self.allCharacterViewModel.getCharacterNametoDisplay(for: indexPath)
        return cell
    }
}
