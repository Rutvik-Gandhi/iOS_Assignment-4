//
//  ListViewCell.swift
//  group5Assignment4
//
//  Created by user215207 on 11/10/22.
//

import UIKit


class ListViewCell: UITableViewCell {


    @IBOutlet weak var metric: UILabel!


    @IBOutlet weak var source: UILabel!

    @IBOutlet weak var destination: UILabel!

    override func awakeFromNib () {
        super . awakeFromNib ()
    // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super . setSelected(selected, animated: animated)
    }
}
