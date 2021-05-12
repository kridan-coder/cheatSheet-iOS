//
//  FriendListViewController.swift
//  chat
//
//  Created by KriDan on 10.05.2021.
//

import UIKit

class FriendListViewController: UIViewController {

    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FriendTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "FriendTableViewCell")
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FriendListViewController: UITableViewDelegate{}
extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("da")
        var vc = storyboard!.instantiateViewController(withIdentifier: "dada")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
        cell.data = FriendResponse(imageURL: "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg", friendName: "AbrakoDaniel", friendText: "Hello! Would you like to asda sd asd a das  dakd ajn da sdkj andj nasdjk nask djna jdk asj ajk daj nda dnjka sndj adk jna")
        return cell
    }
    
    
}
