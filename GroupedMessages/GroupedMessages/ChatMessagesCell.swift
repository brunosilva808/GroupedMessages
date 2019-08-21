import UIKit

class ChatMessagesCell: UITableViewCell {

    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
//        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test "
        return label
    }()
    let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 5
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        addSubview(self.bubbleBackgroundView)
        addSubview(self.messageLabel)
        let constraints = [self.messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
                           self.messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
                           self.messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
                           self.messageLabel.widthAnchor.constraint(equalToConstant: 250),
                           
                           self.bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
                           self.bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
                           self.bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
                           self.bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
