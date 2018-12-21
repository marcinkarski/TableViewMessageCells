import UIKit

class TableViewController: UIViewController {
    
    let dataFromServer = [Message(date: Date.dateFromString(string: "14/12/2018"), text: "This is my first message", isIncoming: true), Message(date: Date.dateFromString(string: "14/12/2018"), text: "With our screen full designed, you'll see a nagging bug that occurs when you pull up the keyboard. We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation.", isIncoming: true), Message(date: Date.dateFromString(string: "15/12/2018"), text: "We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation.", isIncoming: false), Message(date: Date.dateFromString(string: "15/12/2018"), text: "Last message.", isIncoming: true)]
    
    var messages = [[Message]]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
}

extension Date {
    static func dateFromString(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: string) ?? Date()
    }
}

extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let message = messages[indexPath.section][indexPath.row]
        cell.message = message
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = messages[section].first {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeader()
            let container = UIView()
            label.text = dateString
            container.addSubview(label)
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            return container
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
