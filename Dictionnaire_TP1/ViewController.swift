//
//  ViewController.swift
//  Dictionnaire_TP1
//
//  Created by eleves on 17-11-04.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrFrench : [String]!
    var arrEnglish : [String]!
    var keys : [String]!
    var dictOfMot: [String: String]!//// c'est variable a été crée pour montrer au programme que je vais entrer avec un nombre ou quelque chose ,mais l'exclamation est une optionel
    //-------
    // buttons outlet
    @IBOutlet weak var frButton: UIButton!
    @IBOutlet weak var anButton: UIButton!
    var buttons : [UIButton]! // c'est variable a été crée pour montrer au programme que je vais entrer avec un nombre ou quelque chose ,mais l'exclamation est une optionel
    @IBOutlet weak var tabView: UITableView!
    @IBOutlet weak var results: UILabel!
    
    //-----

  
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser() // appeler le fonction managerUse
        
        // Effacer les mots de la table view
        
         //UserDefaults.standard.removeObject(forKey: "french")
        // UserDefaults.standard.removeObject(forKey: "english")
        
        buttons = [frButton,anButton]
        
        // Ajouter les mots [cle, valeur] au dictionnaire
        dictOfMot = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish ))
      
    }
    
   //-----
   
  // Bouttons Fracais et Anglais - utilise l'alpha pour afficher les mots a selectioné dans la table View
    
    @IBAction func actionForButtons(_ sender: UIButton) {
        if sender.alpha == 1.0 {
            return
        }
        for button in buttons {
            if button.alpha == 1.0 {
                button.alpha = 0.5
            } else {
                button.alpha = 1.0
               
                displayOfMots(frenchOfEnglish: sender.currentTitle!) // faire l'inversion des mots noms , prenoms
            }
        }
        tabView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return  arrFrench.count
    }
    
    
 // Indexation pour les mots Francais vs Anglais, methode tableau[cle,valeur]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = [String](dictOfMot.keys)[indexPath.row]
        return cell
    }
    //---------
// Fonction pour montrer le valeur dans le view results, suivre la clé de la table View
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        results.text = [String](dictOfMot.values)[indexPath.row]
    }
    
    //---------
 // Ajouter le mot selon le clé et le valeur correspondante
    func managerUser() {
        if UserDefaults.standard.object(forKey: "french") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "french") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
        }else{
            
            arrFrench = [String]()
            arrEnglish = [String]()
        }
        
    }
 // zip pour construire un dictionnaire de deux mots anglais/francais - francais/anglais
    func displayOfMots(frenchOfEnglish: String){
        
        if frenchOfEnglish == "Français" {
            dictOfMot = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish ))
        }else {
            dictOfMot = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench ))
            
        }

        
    }
    
    //---------
   

    }

   



