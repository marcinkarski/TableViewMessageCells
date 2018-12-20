import UIKit

class ViewController: TableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    private func setup() {
        view.backgroundColor = .white
        self.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
