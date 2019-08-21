import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    fileprivate let textMessages = [
        ChatMessage(text: "Here's my very first message", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false),
        ChatMessage(text: "Yo, dawg, Whaddup!", isIncoming: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(ChatMessagesCell.self, forCellReuseIdentifier: self.cellId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! ChatMessagesCell
        cell.chatMessage = self.textMessages[indexPath.row]
        return cell
    }

}

