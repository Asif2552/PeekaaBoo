//
//  DetailViewController.swift
//  Exakt.
//
//  Created by mac on 28/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var article: NewsArticle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.layer.cornerRadius = 7
        if let article = article {
            img.image = article.image
            titleLabel.text = article.title
            channelLabel.text = article.newsChannel
            dateLabel.text = article.date
            categoryLabel.text = article.category
            descriptionLabel.text = article.description
        }
        
    }
    
}
