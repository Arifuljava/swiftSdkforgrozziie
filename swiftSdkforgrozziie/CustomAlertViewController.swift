//
//  CustomAlertViewController.swift
//  swiftSdkforgrozziie
//
//  Created by sang on 30/9/23.
//

import UIKit

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var allbluetoothlistrecyclerview: UITableView!
    @IBOutlet weak var labellist: UILabel!
    
    @IBOutlet weak var cancelbutton: UIButton!
    @IBOutlet weak var searchagainbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    init() {
    super.init(nibName: "Bluetooth List", bundle: Bundle(for: CustomAlertViewController.self))
    self.modalPresentationStyle = .overCurrentContext
    self.modalTransitionStyle = .crossDissolve
    }
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    func show() {
    if #available(iOS 13, *) {
    UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
    } else {
    UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
    }
    }
    
    @IBAction func canceldialougebutton(_ sender: Any) {
        
    }
    @IBAction func searchagainbutton(_ sender: Any) {
        
    }
    
}
