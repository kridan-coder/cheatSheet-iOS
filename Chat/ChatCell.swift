import UIKit

struct CellRequestResponse: Decodable {
    var id: String? = nil
    var message: String? = nil
    var belongsToUser: Bool? = nil
    var date: Date? = nil
}

class ChatCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let dateLabel = UILabel()
    let backgroundBubbleView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var cellData: CellRequestResponse! {
        didSet {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let dateString = dateFormatter.string(from: cellData.date!)
            
            dateLabel.text = dateString
            
            messageLabel.text = cellData.message
            
            if
                !cellData.belongsToUser!
            
            {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
                backgroundBubbleView.backgroundColor = .darkGray
                messageLabel.textColor = .white
                dateLabel.textColor = .white
            }
            else
            {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
                backgroundBubbleView.backgroundColor = .white
                messageLabel.textColor = .darkGray
                dateLabel.textColor = .darkGray
            }
        }
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24)
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        
        self.backgroundColor = .clear
        
        addSubview(backgroundBubbleView)
        addSubview(messageLabel)
        addSubview(dateLabel)
        
        backgroundBubbleView.layer.cornerRadius = 12
        backgroundBubbleView.translatesAutoresizingMaskIntoConstraints = false
        
        
        messageLabel.numberOfLines = 0
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -45),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            backgroundBubbleView.widthAnchor.constraint(greaterThanOrEqualToConstant: 80),
            backgroundBubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10),        backgroundBubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 35),
            backgroundBubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -10),
            backgroundBubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 3),
            dateLabel.bottomAnchor.constraint(equalTo: backgroundBubbleView.bottomAnchor, constant: -5)
        ]
        
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
