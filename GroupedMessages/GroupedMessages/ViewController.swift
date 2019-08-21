import UIKit

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    fileprivate let textMessages = [
            [ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "11/03/2018")),
            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date())],
        
            [ChatMessage(text: "Here's my very first message", isIncoming: false, date: Date.dateFromCustomString(customString: "23/11/2018")),
            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date()),
            ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date())],
            
            [ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date()),
             ChatMessage(text: "Yo, dawg, Whaddup!", isIncoming: true, date: Date())]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! ChatMessagesCell
        cell.chatMessage = self.textMessages[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: self.view.frame)
        if let firstMessageInSection = self.textMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            headerView.dateString = dateString
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//
//
//        return "Section: \(section)"
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.textMessages.count
    }

}
