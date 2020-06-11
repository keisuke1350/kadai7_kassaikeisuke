//
//  DetailViewController.swift
//  collectionview2
//
//  Created by 葛西　佳祐 on 2020/06/08.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource{
    
    @IBOutlet weak var DetailImage: UIImageView!
    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var DetailDescription: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var textArray = [String]()
    
    var sdgsinfo: SdgsInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        textField.delegate = self
        guard let sdgsInfo = sdgsinfo else { return }
        DetailImage.image = UIImage(named: sdgsInfo.iconName)
        DetailTitle.text = sdgsInfo.title
        DetailDescription.text = sdgsInfo.description
        configureToDoTableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.toDoTableView.reloadData()
        self.view.layoutIfNeeded()
    }
    
    func configureToDoTableViewCell(){
        let nib = UINib(nibName:"ToDoTableViewCell", bundle: nil)
        //nibに設定したidentifer
        let CellID = "ToDoTableViewCell"
        
        toDoTableView.register(nib, forCellReuseIdentifier: CellID)
        toDoTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as!ToDoTableViewCell
        cell.selectionStyle = .none
        cell.toDoLabel.text = textArray[indexPath.row]
        cell.iconView.image = UIImage(named: "checkbox")
        tableView.separatorStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップしたときにその配列の番号の中身を取り出して値を渡す
        print("didSelectRowAt:", indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as!ToDoTableViewCell
        cell.iconView.image =
            UIImage(named: "didcheck")
        cell.toDoLabel.text = textArray[indexPath.row]
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/14
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textField.text!)
        textField.resignFirstResponder()
        textField.text = ""
        toDoTableView.reloadData()
        
        return true
        
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
