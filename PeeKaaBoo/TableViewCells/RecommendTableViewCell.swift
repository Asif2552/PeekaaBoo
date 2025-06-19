import UIKit

class RecommendTableViewCell: UITableViewCell {

//    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var newsChannelLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        imgView.layer.masksToBounds = true
    }

    func configure(with article: NewsArticle) {
        img.image =  article.image
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        categoryLabel.text = article.category
        newsChannelLabel.text = article.newsChannel
    }

}
