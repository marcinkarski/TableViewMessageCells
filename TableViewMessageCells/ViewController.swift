import UIKit

struct Message {
    let text: String
    let isIncoming: Bool
}

class ViewController: UITableViewController {
    
    private let identifier = "Cell"
    
    let messages = [Message(text: "This is my first message", isIncoming: true), Message(text: "With our screen full designed, you'll see a nagging bug that occurs when you pull up the keyboard. We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation.", isIncoming: true), Message(text: "We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation.", isIncoming: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(TableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCell
        let message = messages[indexPath.row]
        cell.label.text = message.text
        cell.isIncoming = message.isIncoming
        return cell
    }
}
