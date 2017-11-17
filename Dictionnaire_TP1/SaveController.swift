//
//  SaveController.swift
//  Dictionnaire_TP1
//

//
// Ajouter un mot au tableau

import UIKit
class SaveController: UIViewController {
    
    
    
    //connection uitextfield outlet english
    @IBOutlet weak var english: UITextField!
    //connection uitextfield outlet french
    @IBOutlet weak var french: UITextField!
    
    var arrFrench : [String]!
    var arrEnglish : [String] = []
    
//--------
    //let userDefObj = UserDefaultsManager()
    
//--------

    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
    }
//---------
    
    // button pour ajouter les mots dans les champs
    @IBAction func SaveDate(_ sender: UIButton) {
    
    arrFrench.append(french.text!)
    arrEnglish.append(english.text!)
        
    UserDefaults.standard.set(arrFrench, forKey: "french")
     UserDefaults.standard.set(arrEnglish, forKey: "english")
        
    }
//---------
    

    func managerUser() {
        if UserDefaults.standard.object(forKey: "french") != nil {
                arrFrench = UserDefaults.standard.object(forKey: "french") as! [String]
                arrEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
            }else{
                
                arrFrench = [String]()
                arrEnglish = [String]()
            }
            
        }
    
 
    
}
