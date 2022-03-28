import UIKit

class CompactTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var tapZone: UIView!
    
    var delegate: CellDelegate?
    
    private var title: String?
    private var ownerName: String?
    
    static let identifier = "CompactTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: CompactTableViewCell.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func configureCell(title: String?, ownerName: String?) {
        self.title = title
        self.ownerName = ownerName
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onCellTap))
        tapZone.addGestureRecognizer(tap)
        
        setupLabels(title: title, ownerName: ownerName)
    }
    
    
    @objc private func onCellTap() {
        guard let title = title else { return }
        delegate?.onCellTap(title: title)
    }
    
    private func setupLabels(title: String?, ownerName: String?) {
        titleLabel.text = title
        starsLabel.text = "👤" + (ownerName ?? "")
    }
    
}
