import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    fileprivate let textMessages = [
        "Here's my very first message",
        "I'm going to message another long message that will word wrap",
        "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessagesCell.self, forCellReuseIdentifier: self.cellId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! ChatMessagesCell
        cell.messageLabel.text = self.textMessages[indexPath.row]
        return cell
    }

}

