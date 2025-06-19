import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        self.backgroundColor = .white  
        
        
    
    }
}
