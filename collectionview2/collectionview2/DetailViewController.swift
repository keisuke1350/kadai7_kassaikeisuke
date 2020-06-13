//
//  DetailViewController.swift
//  collectionview2
//
//  Created by 葛西　佳祐 on 2020/06/08.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import TextFieldEffects


class DetailViewController: UIViewController,UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource{
    
    @IBOutlet weak var DetailImage: UIImageView!
    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var DetailDescription: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var textArray = [String]()
    
    var sdgsinfo: SdgsInfo?
    let userDafaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let value = userDafaults.stringArray(forKey: "Array"){
            textArray = value
        }
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        textField.delegate = self
        guard let sdgsInfo = sdgsinfo else { return }
        DetailImage.image = UIImage(named: sdgsInfo.iconName)
        DetailTitle.text = sdgsInfo.title
        DetailDescription.text = sdgsInfo.description
        configureToDoTableViewCell()
        toDoTableView.allowsMultipleSelectionDuringEditing = true
        navigationItem.rightBarButtonItem = editButtonItem

    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        toDoTableView.isEditing = editing
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        //エラーの原因の可能性
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as!ToDoTableViewCell
        cell.iconView.image =
            UIImage(named: "didcheck")
        cell.toDoLabel.text = textArray[indexPath.row]
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        print(indexPath.row)
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    @IBAction func tapactionButton(_ sender: Any) {
        let userDafaults = UserDefaults.standard
        userDafaults.set(textArray, forKey: "Array")
        userDafaults.synchronize()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        textArray.remove(at: indexPath.row)
        toDoTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = textArray[sourceIndexPath.row]
        textArray.remove(at: sourceIndexPath.row)
        textArray.insert(todo, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
