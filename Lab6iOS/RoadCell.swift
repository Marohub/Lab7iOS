//
//  RoadCell.swift
//  Lab6iOS
//
//  Created by Marek Kozłowski on 05/06/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation
import UIKit

class RoadCell : UITableViewCell{
    
    @IBOutlet weak var roadStartCell: UILabel!
    //iboutlets
    @IBOutlet weak var roadDestinationCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roadStartCell.adjustsFontSizeToFitWidth=true
        roadDestinationCell.adjustsFontSizeToFitWidth=true
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
