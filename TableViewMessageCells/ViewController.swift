import UIKit

class ViewController: UITableViewController {
    
    private let identifier = "Cell"
    
    let messages = ["This is my first message", "With our screen full designed, you'll see a nagging bug that occurs when you pull up the keyboard. We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation.", "We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation."]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(TableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCell
        cell.label.text = messages[indexPath.row]
        return cell
    }
}
