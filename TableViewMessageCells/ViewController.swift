import UIKit

class ViewController: TableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        messagesGrouping()
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    private func setup() {
        view.backgroundColor = .white
        self.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func messagesGrouping() {
        let grouping = Dictionary(grouping: dataFromServer) { (element) -> Date in
            return element.date
        }
        let sorted = grouping.keys.sorted()
        sorted.forEach { (key) in
            let values = grouping[key]
            messages.append(values ?? [])
        }
    }
}
