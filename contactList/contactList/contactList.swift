//
//  countryList.swift
//  contactList
//
//  Created by ChicMic on 21/02/23.
//

import Foundation

public class contactArray{
    static var contactArrayInstance = contactArray()
    
    //MARK: - Variables
    var newsectionTitle : [String] = []
    var newcontactDict : [String : [(String,String)]] = [:]
    
    private init() {
        
    }
    
    var newcontact : [(String,String)] = [
        ("Adam","988891"), ("Alex","988892"), ("Aaron","988893"), ("Ben","988894"), ("Brad","988895"),("Roger","877896"), ("Bob","988897"), ("Joe","3243238"),("Deitz","988899"), ("Paiser","988890"), ("Pak","9888901"), ("Sellon","9888902"), ("Miller","9888903"),("Myers","8778904"), ("Ramachandran","9888905"), ("Soulis","32432306"),("Severson","9888907"), ("Tandy","9888908"), ("Thompson","9888909"), ("Christensen","9888910"), ("Linde","9888911"),("Hydinger","8778912"), ("Schmitt","9888913"), ("Joe","32432314"),("Moody","9888915"), ("Jagtap","9888916"), ("Ferry","9888917"), ("LePage","9888918"), ("Yocum","9888919"),("Tisler","8778920"), ("Tapia","9888921"), ("Tiernan","32432322")
    ]
    
//    var contacts : [String] = [
//          "Adam","Anderson", "Ashwoon", "Aikin", "Bateman", "Bongard", "Bowers", "Boyd", "Cannon", "Cast", "Deitz", "Dewalt", "Ebner", "Frick", "Hancock", "Haworth", "Hesch", "Hoffman", "Kassing", "Knutson", "Lawless", "Lawicki", "Mccord", "McCormack", "Miller", "Myers", "Nugent", "Ortiz", "Orwig", "Ory", "Paiser", "Pak", "Pettigrew", "Quinn", "Quizoz", "Ramachandran", "Resnick", "Sagar", "Schickowski", "Schiebel", "Sellon", "Severson", "Shaffer", "Solberg", "Soloman", "Sonderling", "Soukup", "Soulis", "Stahl", "Sweeney", "Tandy", "Trebil", "Trusela", "Trussel", "Turco", "Uddin", "Uflan", "Ulrich", "Upson", "Vader", "Vail", "Valente", "Van Zandt", "Vanderpoel", "Ventotla", "Vogal", "Wagle", "Wagner", "Wakefield", "Weinstein", "Weiss", "Woo", "Yang", "Yates", "Yocum", "Zeaser", "Zeller", "Ziegler", "Bauer", "Baxster", "Casal", "Cataldi", "Caswell", "Celedon", "Chambers", "Chapman", "Christensen", "Darnell", "Davidson", "Davis", "DeLorenzo", "Dinkins", "Doran", "Dugelman", "Dugan", "Duffman", "Eastman", "Ferro", "Ferry", "Fletcher", "Fietzer", "Hylan", "Hydinger", "Illingsworth", "Ingram", "Irwin", "Jagtap", "Jenson", "Johnson", "Johnsen", "Jones", "Jurgenson", "Kalleg", "Kaskel", "Keller", "Leisinger", "LePage", "Lewis", "Linde", "Lulloff", "Maki", "Martin", "McGinnis", "Mills", "Moody", "Moore", "Napier", "Nelson", "Norquist", "Nuttle", "Olson", "Ostrander", "Reamer", "Reardon", "Reyes", "Rice", "Ripka", "Roberts", "Rogers", "Root", "Sandstrom", "Sawyer", "Schlicht", "Schmitt", "Schwager", "Schutz", "Schuster", "Tapia", "Thompson", "Tiernan", "Tisler"
//    ]
    
     
}
