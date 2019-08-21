import UIKit

class ChatMessagesCell: UITableViewCell {

    fileprivate let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    fileprivate let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 12
        return view
    }()
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.text = chatMessage.text
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        backgroundColor = .clear
        
        addSubview(self.bubbleBackgroundView)
        addSubview(self.messageLabel)
        let constraints = [self.messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
                           self.messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
                           self.messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
                           self.bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
                           self.bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
                           self.bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
                           self.bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)]
        
        NSLayoutConstraint.activate(constraints)
        
        self.leadingConstraint = self.messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        self.trailingConstraint = self.messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
    }
    
}
