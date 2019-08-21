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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        addSubview(self.messageLabel)
        let constraints = [self.messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                           self.messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                           self.messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
                           self.messageLabel.widthAnchor.constraint(equalToConstant: 250)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
