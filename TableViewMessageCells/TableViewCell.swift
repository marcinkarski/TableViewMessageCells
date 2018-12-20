import UIKit

class TableViewCell: UITableViewCell {
    
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    
    var message: Message? {
        didSet {
            guard let message = message else { return }
            background.backgroundColor = message.isIncoming ? .white : .gray
            label.textColor = message.isIncoming ? .darkGray : .white
            label.text = message.text
            
            if (message.isIncoming) {
                leadingConstraint?.isActive = true
                trailingConstraint?.isActive = false
            } else {
                leadingConstraint?.isActive = false
                trailingConstraint?.isActive = true
            }
        }
    }

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "With our screen full designed, you'll see a nagging bug that occurs when you pull up the keyboard. We'll have to account for the keyboard's size whenever its being presented by shifting our view up through a translation transformation."
        return label
    }()
    
    let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .yellow
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        addSubview(background)
        addSubview(label)
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: topAnchor, constant: 32), label.widthAnchor.constraint(lessThanOrEqualToConstant: 250), label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16), background.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -16), background.topAnchor.constraint(equalTo: label.topAnchor, constant: -16), background.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16), background.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)])
        
        leadingConstraint = label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint!.isActive = false
        trailingConstraint = label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint!.isActive = true
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
