import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sections: [SettingSection] = [
        SettingSection(
            title: "Account",
            items: [
                SettingItem(icon: UIImage(systemName: "person.circle"), title: "Profile", action: {}),
                SettingItem(icon: UIImage(systemName: "key.fill"), title: "Password", action: {})
            ]
        ),
        SettingSection(
            title: "Notifications",
            items: [
                SettingItem(icon: UIImage(systemName: "bell.fill"), title: "Push Notifications", action: {}),
                SettingItem(icon: UIImage(systemName: "envelope.fill"), title: "Email Notifications", action: {})
            ]
        ),
        SettingSection(
            title: "Privacy",
            items: [
                SettingItem(icon: UIImage(systemName: "lock.fill"), title: "Privacy Settings", action: {}),
                SettingItem(icon: UIImage(systemName: "hand.raised.fill"), title: "Blocked Articles", action: {})
            ]
        ),
        SettingSection(
            title: "General",
            items: [
                SettingItem(icon: UIImage(systemName: "gearshape.fill"), title: "App Settings", action: {}),
                SettingItem(icon: UIImage(systemName: "info.circle.fill"), title: "About", action: {}),
                SettingItem(icon: UIImage(systemName: "arrow.uturn.backward"), title: "Logout", action: {})
            ]
        )
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 60
        mainView.layer.borderColor = UIColor.brown.cgColor
        mainView.layer.borderWidth = 4
        img.layer.cornerRadius = img.layer.frame.size.width / 2
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath)as! SettingTableViewCell
        let item = sections[indexPath.section].items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.imageView?.image = item.icon
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        if item.title == "Privacy Settings" {
            cell.accessoryType = .detailButton
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
