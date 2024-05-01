import UIKit
class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var itemStore : ItemStore!
    required init? (coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemStore.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let table_cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as? ListViewCell else{return UITableViewCell()}
        
        let item = self.itemStore.itemArray[indexPath.row]
        table_cell.source.text = item.field1
        table_cell.destination.text = item.field2
        table_cell.metric.text = item.field3
        
        table_cell.selectionStyle = .none
        return table_cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return  }
        vc.item = self.itemStore.itemArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addItem(_ sender: Any) {
        let item = Item()
        let alert = UIAlertController(title: "Add List", message: "Add source and destination", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Source"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Destination"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Gallons"
        }
        
        alert.addAction (UIAlertAction(title: "Submit", style: .default, handler: { [weak alert] (_) in
            if let textField = alert?.textFields![0], let userText = textField.text {
                item.field1 = userText
            }
            if let textField = alert?.textFields![1], let userText = textField.text {
                item.field2 = userText
         
            }
            if let textField = alert?.textFields![2], let userText = textField.text {
                item.field3 = userText
             
            }
            
            self.itemStore.itemArray.append(item)

            print("count", self.itemStore.itemArray.count)
            self.myTableView.reloadData()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var myTableView: UITableView!{
        didSet{
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
            
//            let fuel_litre = Measurement(value: fuel_Double ?? 0.0 unit:  UnitVolume.gallons)
//            let fuel_gallon = fuel_litre.converted(to: UnitVolume.liters)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear (animated)
        myTableView.reloadData()
    }
    
}
