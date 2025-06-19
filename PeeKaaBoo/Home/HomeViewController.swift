import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var newsArticles: [NewsArticle] = [
        NewsArticle(
            image: UIImage(named: "light") ?? UIImage(named: "img"),
            title: "The Rise of Women in Sports",
            description: """
            In 2024, women athletes are making history by breaking barriers in traditionally male-dominated sports.
            From football to motorsports, female athletes are not only participating but excelling at the highest levels.
            Their stories of perseverance, dedication, and resilience are inspiring millions across the globe.
            """,
            date: "11-11-2024",
            category: "Sports",
            newsChannel: "Twitter"
        ),
        NewsArticle(
            image: UIImage(named: "sugar") ?? UIImage(named: "img"),
            title: "The Future of Fashion",
            description: """
            As fashion evolves, 2024 marks a significant shift towards sustainability and innovation.
            Top designers are incorporating eco-friendly materials, AI-driven fashion designs, and digital clothing into their collections.
            With fashion weeks showcasing virtual runways and smart fabrics, this year is redefining the industry's future.
            """,
            date: "22-09-2017",
            category: "Fashion",
            newsChannel: "Al Jazeera"
        ),
        NewsArticle(
            image: UIImage(named: "shadow") ?? UIImage(named: "img"),
            title: "Gaming in 2024 with VR and AI",
            description: """
            The gaming industry in 2024 is pushing boundaries with virtual reality, artificial intelligence, and photorealistic graphics.
            Gamers can now experience unprecedented levels of immersion, making fantasy worlds feel incredibly real.
            From AI-driven NPCs that adapt to your playstyle to fully immersive VR worlds, 2024 is the golden age for gamers.
            """,
            date: "16-08-2019",
            category: "Video Games",
            newsChannel: "BBC News"
        ),
        NewsArticle(
            image: UIImage(named: "bench") ?? UIImage(named: "img"),
            title: "The Political Landscape of 2024",
            description: """
            The political scene in 2024 is marked by major global shifts.
            From international diplomacy reshaping alliances to emerging political movements in key regions,
            this year has seen transformative changes that will impact the future of governance worldwide.
            """,
            date: "07-11-2021",
            category: "Politics",
            newsChannel: "ABC News"
        ),
        NewsArticle(
            image: UIImage(named: "light") ?? UIImage(named: "img"),
            title: "Sports and Technology: 2024",
            description: """
            2024 has been a groundbreaking year for sports technology. From AI-driven performance analytics
            to wearable devices monitoring athlete health in real time.
            Major events are leveraging data-driven insights to improve player performance and fan engagement,
            making sports more exciting than ever before.
            """,
            date: "11-01-2023",
            category: "Sports",
            newsChannel: "CBC News"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        view.backgroundColor = .white
        table.backgroundColor = .white
        table.rowHeight = UITableView.automaticDimension
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        case 2:
            return newsArticles.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2 {
            let vc = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            let selectedArticle = newsArticles[indexPath.row]
            vc.article = selectedArticle
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .brown
            headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            headerView.contentView.backgroundColor = .white
            headerView.layer.zPosition = -1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return nil
        case 2:
            return "Recommended"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = table.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            return cell
            
        } else if indexPath.section == 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.collectionView.reloadData()
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendTableViewCell", for: indexPath) as! RecommendTableViewCell
            let article = newsArticles[indexPath.row]
            cell.configure(with: article)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 108
        } else if indexPath.section == 1 {
            return 200
        } else {
            return 110
        }
    }
    
    
}
