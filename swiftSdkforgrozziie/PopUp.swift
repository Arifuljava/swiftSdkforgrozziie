//
//  PopUp.swift
//  swiftSdkforgrozziie
//
//  Created by sang on 30/9/23.
//

import UIKit

class PopUp: UIView{
    @IBOutlet weak var closebutton: UIButton!
    @IBOutlet weak var searchagain: UIButton!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        XibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func XibSetup(frame : CGRect){
        let  view = loadXib();
        view.frame = frame;
        addSubview(view)
        
    }
    func loadXib() -> UIView{
        let  bundle = Bundle(for: type(of: self))
        let ntb = UINib(nibName: "Pop Up", bundle: bundle)
        let view = ntb.instantiate(withOwner: self, options: nil).first as! UIView
        return view;
        
    }
}
