import UIKit
import CoreData

class ArticleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var trendingItems: [Trending] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.allowsSelection = false
        fetchData()
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        showAlert()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingItems.isEmpty ? 1 : trendingItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if trendingItems.isEmpty {
            let cell = table.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
            cell.labelView.isHidden = false
            cell.labelView.text = "No trending available at the moment!"
            cell.labelView.textColor = .brown
            table.separatorStyle = .none
            return cell
        } else {
            let cell = table.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
            cell.textLabel?.text = "#" + (trendingItems[indexPath.row].title ?? "")
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
            table.separatorStyle = .singleLine
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !trendingItems.isEmpty {
            return 44
        } else {
            return 600
        }
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var swipeActions: UISwipeActionsConfiguration?
        
        if !trendingItems.isEmpty {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
                completionHandler(true)
                self.deleteFromCoreData(at: indexPath)
            }
            deleteAction.image = UIImage(systemName: "trash.fill")
            deleteAction.backgroundColor = .brown
            
            swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
            swipeActions?.performsFirstActionWithFullSwipe = true
        }
        
        return swipeActions
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Add New Trending", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default){ _ in
            if let textField = alertController.textFields?.first, let text = textField.text , !text.isEmpty{
                self.saveToCoreData(title: text)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { textField in
            textField.placeholder = "Trending Name"
        }
        
        alertController.addAction(addAction)
        alertController.addAction(cancel)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true , completion: nil)
        }
    }
    
    func saveToCoreData(title: String) {
        let context = CoreDataManager.shared.context
        let newTrending = Trending(context: context)
        newTrending.title = title
        
        do {
            try context.save()
            fetchData()
            self.table.reloadData()
            print("Saved to Core Data")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchData() {
        let context = CoreDataManager.shared.context
        let fetchRequest: NSFetchRequest<Trending> = Trending.fetchRequest()
        
        do {
            trendingItems = try context.fetch(fetchRequest)
            print("Fetched data: \(trendingItems)")
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func deleteFromCoreData(at indexPath: IndexPath) {
        let context = CoreDataManager.shared.context
        let trendingItem = trendingItems[indexPath.row]
        
        context.delete(trendingItem)
        do {
            try context.save()
            trendingItems.remove(at: indexPath.row)
            if trendingItems.isEmpty {
                table.reloadData()
            } else {
                table.deleteRows(at: [indexPath], with: .automatic)
            }        } catch let error as NSError {
                print("Could not delete. \(error), \(error.userInfo)")
            }
    }
}
