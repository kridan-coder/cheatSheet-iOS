//
//  FriendTableViewCell.swift
//  chat
//
//  Created by KriDan on 10.05.2021.
//

import UIKit
import Kingfisher

struct FriendResponse: Decodable {
    var imageURL: String? = nil
    var friendName: String? = nil
    var friendText: String? = nil
}

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendTextLabel: UILabel!
    
    var data: FriendResponse! {
        didSet {
            friendNameLabel.text = data.friendName
            friendTextLabel.text = data.friendText
            friendImage.kf.indicatorType = .activity
            friendImage.kf.setImage(with: URL(string: data.imageURL!))
        }
    }

    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    override func layoutSubviews() {
//        let margins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 15)
//
//        contentView.frame = contentView.frame.inset(by: margins)

//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
                friendImage.layer.cornerRadius = friendImage.frame.height / 2
        
        self.selectedBackgroundView = UIView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        
        
        // Configure the view for the selected state
    }
    
}
