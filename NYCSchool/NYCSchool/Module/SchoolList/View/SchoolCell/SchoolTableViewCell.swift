//
//  SchoolTableViewCell.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblCity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(school: SchoolViewProtocol) {
        self.lblSchoolName.text = school.schoolName
        self.lblCity.text = school.city
    }
    
}
