//
//  DetailViewController.swift
//  group5Assignment4
//
//  Created by user215207 on 11/10/22.
//

import UIKit

class DetailViewController: UIViewController{

    var item : Item!

    override func viewDidLoad(){
        super.viewDidLoad()
    }
  
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var field3: UITextField!
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        field1.text = item.field1
        field2.text = item.field2
        field3.text = item.field3
    }

    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        view.endEditing(true)
        print("1", item!)
        item.field1 = field1.text ?? ""
        item.field2 = field2.text ?? ""
        item.field3 = field3.text ?? ""
    }
}



