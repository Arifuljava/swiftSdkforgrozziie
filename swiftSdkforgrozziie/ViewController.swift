//
//  ViewController.swift
//  swiftSdkforgrozziie
//
//  Created by sang on 28/9/23.
//
import SPIndicator
import UIKit
import CoreBluetooth



class ViewController: UIViewController , CBCentralManagerDelegate,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var print_options: UIButton!
    @IBOutlet weak var bitmapImage_forPrint: UIImageView!
    @IBOutlet weak var checkforbluetoothdevices: UIView!
    var cbcm: CBCentralManager!;
    var  flag = 0;
    @IBOutlet weak var print_speed: UITextField!
    @IBOutlet weak var print_copy: UITextField!
    
    @IBOutlet weak var print_density: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))

                // Add the UITapGestureRecognizer to your view
                checkforbluetoothdevices.addGestureRecognizer(tapGestureRecognizer)
        //check bluetooth is enable or not
        cbcm = CBCentralManager();
               cbcm = CBCentralManager.init()
        cbcm = CBCentralManager.init()
                self.cbcm = CBCentralManager(delegate: self, queue: nil)
        
        //management input intext
        print_speed.delegate = self
            print_copy.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5 // Adjust the number of rows as needed
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Device \(indexPath.row + 1)"
            return cell
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == print_speed || textField == print_copy || textField == print_density {
            // Check if the input string is empty (e.g., pasting non-numeric characters)
            if string.isEmpty {
                return true
            }
            
            // Create a character set that allows only digits
            let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let inputCharacterSet = CharacterSet(charactersIn: string)
            
            // Check if the input string contains only digits
            if allowedCharacterSet.isSuperset(of: inputCharacterSet) {
                // Check if the resulting text length after the change is within the limit
                let currentText = textField.text ?? ""
                let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                return newText.count <= 5
            } else {
                // Reject non-numeric characters
                return false
            }
        }
        
        // Allow input for other text fields
        return true
    }
    func showAlertDialougeforbutton(){
        // Create a custom view to hold the buttons and table view
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

        // Create a table view
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Create "Search again" button on the left
        let searchAgainButton = UIButton(type: .system)
        searchAgainButton.setTitle("Search again", for: .normal)
        searchAgainButton.frame = CGRect(x: 0, y: 200, width: 150, height: 50)
        searchAgainButton.addTarget(self, action: #selector(searchAgainButtonTapped), for: .touchDown)

        // Create "Cancel" button on the right
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.frame = CGRect(x: 150, y: 200, width: 150, height: 50)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchDown)

        // Add the table view and buttons to the custom view
        customView.addSubview(tableView)
        customView.addSubview(searchAgainButton)
        customView.addSubview(cancelButton)

        // Create the alert controller with a title and message (spaces)
        let alertController = UIAlertController(title: "Bluetooth List", message: " Here all bluetooth list", preferredStyle: .alert)

        // Add the custom view as a subview of the alert controller's view
        alertController.view.addSubview(customView)

        // Present the alert controller centered vertically
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = view
            presenter.sourceRect = view.bounds
            presenter.permittedArrowDirections = []
        }

        present(alertController, animated: true, completion: nil)
    }
    @objc func searchAgainButtonTapped(_ sender : UITapGestureRecognizer)
    {
        
    }
    @objc func cancelButtonTapped() {
        // Dismiss the UIAlertController
        print("JJJJJ");
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
            // This function will be called when the view is tapped
            // You can add your gesture recognition logic here
        cbcm = CBCentralManager.init()
                self.cbcm = CBCentralManager(delegate: self, queue: nil)
        if(flag==1)
               {
         
           //showAlertDialougeforbutton();
            let customAlert = CustomSecondForTesting()
            customAlert.tableData = ["Item 1", "Item 2", "Item 3"] // Set your table view data
            present(customAlert, animated: true, completion: nil)
           
              }
               else{
                   var checkFlag =  0;
                   if(checkFlag==0)
                   {
                       var    statusMessage = "Bluetooth Status: Turned Off , please turn on bluetooth."
                         SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .error, from: .bottom)
                         let alert = UIAlertController(title: "Now Bluetooth Off ", message: "Are you want to turn On bluetooth?", preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                             switch action.style{
                                 case .default:
                                 let url = URL(string: "App-Prefs:root=Bluetooth") //for bluetooth setting
                                 let app = UIApplication.shared
                                 app.openURL(url!)
                                 print("default")
                                 
                                
                                 case .cancel:
                                 
                                 print("cancel")
                                 
                                 
                                 case .destructive:
                                 
                                 print("destructive")
                                 
                                 
                             }
                         }))
                         alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
                             switch action.style{
                                 case .default:
                                 print("default")
                                 
                                 
                                 case .cancel:
                                 print("cancel")
                                 
                                 case .destructive:
                                 print("destructive")
                                 
                             }
                         }))
                         self.present(alert, animated: true, completion: nil)
                       checkFlag = 1; 
                   }
                
                   
               }
        }
//is no or not
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
           var statusMessage = ""
           //TestView.text  = "clicked"
           switch central.state {
           case .poweredOn:
               statusMessage = "Bluetooth Status: Turned On"
               flag = 1
               
               SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .done, from: .bottom)
               
               //TestView.text = statusMessage
               //labeltext.text = statusMessage
               

           case .poweredOff:
               flag = 2
               statusMessage = "Bluetooth Status: Turned Off"
               SPIndicator.present(title: ""+statusMessage+" Please open bluetooth. ", message: "Bluetooth Status", preset: .done, from: .bottom)
               //TestView.text = statusMessage
              // labeltext.text = statusMessage
               let alert = UIAlertController(title: "Bluetooth Status", message: "Bluetooth status is off. Please enable/ON  bluetooth.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                           let url = URL(string: "App-Prefs:root=Bluetooth") //for bluetooth setting
                           let app = UIApplication.shared
                           app.openURL(url!)
                       print("default")
                       
                      
                       case .cancel:
                       
                       print("cancel")
                       
                       
                       case .destructive:
                       
                       print("destructive")
                       
                       
                   }
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                       print("default")
                       
                       
                       case .cancel:
                       print("cancel")
                       
                       case .destructive:
                       print("destructive")
                       
                   }
               }))
               self.present(alert, animated: true, completion: nil)
               

           case .resetting:
               statusMessage = "Bluetooth Status: Resetting"
               //TestView.text = statusMessage
               //labeltext.text = statusMessage
               SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .done, from: .bottom)
           case .unauthorized:
               statusMessage = "Bluetooth Status: Not Authorized"
               //TestView.text = statusMessage
               //labeltext.text = statusMessage
               SPIndicator.present(title: ""+statusMessage+". Please check bluetooth again.", message: "Bluetooth Status", preset: .done, from: .bottom)
               let alert = UIAlertController(title: "Bluetooth Status", message: "Bluetooth status is not authorized. Please check bluetooth again.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                           let url = URL(string: "App-Prefs:root=Bluetooth") //for bluetooth setting
                           let app = UIApplication.shared
                           app.openURL(url!)
                       print("default")
                       
                      
                       case .cancel:
                       
                       print("cancel")
                       
                       
                       case .destructive:
                       
                       print("destructive")
                       
                       
                   }
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                       print("default")
                       
                       
                       case .cancel:
                       print("cancel")
                       
                       case .destructive:
                       print("destructive")
                       
                   }
               }))
               self.present(alert, animated: true, completion: nil)

           case .unsupported:
               statusMessage = "Bluetooth Status: Not Supported"
               //TestView.text = statusMessage
              // labeltext.text = statusMessage
               SPIndicator.present(title: ""+statusMessage+". Please check bluetooth again.", message: "Bluetooth Status", preset: .done, from: .bottom)
               let alert = UIAlertController(title: "Bluetooth Status", message: "Bluetooth is not supported. Please check bluetooth again.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                           let url = URL(string: "App-Prefs:root=Bluetooth") //for bluetooth setting
                           let app = UIApplication.shared
                           app.openURL(url!)
                       print("default")
                       
                      
                       case .cancel:
                       
                       print("cancel")
                       
                       
                       case .destructive:
                       
                       print("destructive")
                       
                       
                   }
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                       print("default")
                       
                       
                       case .cancel:
                       print("cancel")
                       
                       case .destructive:
                       print("destructive")
                       
                   }
               }))
               self.present(alert, animated: true, completion: nil)

           case .unknown:
               
               statusMessage = "Bluetooth Status: Unknown"
               SPIndicator.present(title: ""+statusMessage+". Please check bluetooth again.", message: "Bluetooth Status", preset: .done, from: .bottom)
              /// TestView.text = statusMessage
               let alert = UIAlertController(title: "Bluetooth Status", message: "Bluetooth status is unknown. Please check bluetooth again.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                       let url = URL(string: "App-Prefs:root=Bluetooth") //for bluetooth setting
                       let app = UIApplication.shared
                       app.openURL(url!)
                       print("default")
                       
                      
                       case .cancel:
                       
                       print("cancel")
                       
                       
                       case .destructive:
                       
                       print("destructive")
                       
                       
                   }
               }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                   switch action.style{
                       case .default:
                       print("default")
                       
                       
                       case .cancel:
                       print("cancel")
                       
                       case .destructive:
                       print("destructive")
                       
                   }
               }))
               self.present(alert, animated: true, completion: nil)
               
               //labeltext.text = statusMessage///
           }

           print(statusMessage)
       }
    func peripheralManagerDidUpdateStateBlueon(peripheral: CBPeripheralManager!) {
           SPIndicator.present(title: ""+"statusMessage", message: "Bluetooth Status", preset: .done, from: .bottom)
              var statusMessage = ""
              //TestView.text  = "clicked"
              switch peripheral.state {
              case .poweredOn:
                  statusMessage = "Bluetooth Status: Aready  On"
                  SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .done, from: .bottom)
                  

              case .poweredOff:
                  statusMessage = "Bluetooth Status: Turned Off , please turn on bluetooth."
                  SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .error, from: .bottom)
                  let alert = UIAlertController(title: "Bluetooth On", message: "Are you want to turn On bluetooth?", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                      switch action.style{
                          case .default:
                          let url = URL(string: "App-Prefs:root=Bluetooth") //for bluetooth setting
                          let app = UIApplication.shared
                          app.openURL(url!)
                          print("default")
                          
                         
                          case .cancel:
                          
                          print("cancel")
                          
                          
                          case .destructive:
                          
                          print("destructive")
                          
                          
                      }
                  }))
                  alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
                      switch action.style{
                          case .default:
                          print("default")
                          
                          
                          case .cancel:
                          print("cancel")
                          
                          case .destructive:
                          print("destructive")
                          
                      }
                  }))
                  self.present(alert, animated: true, completion: nil)
                 
                  
              case .resetting:
                  statusMessage = "Bluetooth Status: Resetting"
                  SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .error, from: .bottom)
                 
                  

              case .unauthorized:
                  statusMessage = "Bluetooth Status: Not Authorized"
                  SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .error, from: .bottom)
                
                  

              case .unsupported:
                  statusMessage = "Bluetooth Status: Not Supported"
                  SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .error, from: .bottom)
               
                  

              case .unknown:
                  statusMessage = "Bluetooth Status: Unknown"
                  SPIndicator.present(title: ""+statusMessage, message: "Bluetooth Status", preset: .error, from: .bottom)

              }

              print(statusMessage)

              if peripheral.state == .poweredOff {
                  //TODO: Update this property in an App Manager class
              }
   }
}

