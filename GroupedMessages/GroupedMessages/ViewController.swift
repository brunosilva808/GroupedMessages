import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
//    fileprivate let chatMessages = [
//            [ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "11/03/2018")),
//            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date())],
//
//            [ChatMessage(text: "Here's my very first message", isIncoming: false, date: Date.dateFromCustomString(customString: "23/11/2018")),
//            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
//            ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date())],
//
//            [ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date()),
//             ChatMessage(text: "Yo, dawg, Whaddup!", isIncoming: true, date: Date())]]

    fileprivate let messagesFromServer = [ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "11/03/2018")),
                              ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
                              ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
                              ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date()),ChatMessage(text: "Third section message", isIncoming: false, date: Date())]
    fileprivate var chatMessages = [[ChatMessage]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attemptToAssembleGroupedMessages()
        setupUI()
    }
    
    fileprivate func setupUI() {
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(ChatMessagesCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    func attemptToAssembleGroupedMessages() {
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        groupedMessages.keys.sorted(by: { $0.compare($1) == .orderedAscending }).forEach { (date) in
            self.chatMessages.append(groupedMessages[date]!)
        }

        self.tableView.reloadData()
    }
    
    // UITableView

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! ChatMessagesCell
        cell.chatMessage = self.chatMessages[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: self.view.frame)
        if let firstMessageInSection = self.chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            headerView.dateString = dateString
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        }
        
        return 50 + 16
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.chatMessages.count
    }

}
