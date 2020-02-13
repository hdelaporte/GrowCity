//
//  DataBase.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 05/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import Foundation
import MapKit
// je crée mes 2 structures qui vont définir l'utilisation de mon app
// ne pas oublier de rajouter "identifiable" sinon il ne va pas reussir à aller le chercher

enum PlaceType: CaseIterable {
    case shareSpace, independantSpace, recolt
    
    var name: String {
        switch self {
        case .shareSpace:
            return "Espace partagé"
        case .independantSpace:
            return "Espace indépendant"
        case .recolt:
            return "Récolte"
        }
    }
}

struct Place: Identifiable {
    var id : Int
    var name : String
    var type: PlaceType
    var picture : String
    var adress: String
    var description: String
    var date: String
    var userId : Int
    
    let annotationType: AnnotationType = .nativePin
    let location: CLLocationCoordinate2D
}

struct User: Identifiable {
    var id : Int
    var firstName: String
    var lastName: String
    var picture : String
    var email : String
    var password : String
    var phone : String
    var description : String
    
}

struct Connect {
    let defaultsConnected = "defaultsConnected"
    
    func login() {
        UserDefaults.standard.set(true, forKey: defaultsConnected)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: defaultsConnected)
    }
    
    func isConnected() -> Bool {
        return UserDefaults.standard.bool(forKey: defaultsConnected)
    }
}



struct FavoritePlaces {
    let defaultsFavorites = "FavoritePlaces"

    var allFavoritesPlaces: [Place] {
        let favoriteIds = UserDefaults.standard.array(forKey: defaultsFavorites) as? [Int]
        return favoriteIds?.compactMap { id in
            places.first { place in
                place.id == id
            }
        } ?? []
    }

    func isPlaceFavorite(id: Int) -> Bool {
        let favoriteIds = UserDefaults.standard.array(forKey: defaultsFavorites) as? [Int]
        return favoriteIds?.contains(id) ?? false
    }

    func add(placeId: Int) {
        var favoriteIds = UserDefaults.standard.array(forKey: defaultsFavorites) as? [Int] ?? []
        favoriteIds.append(placeId)
        UserDefaults.standard.set(favoriteIds, forKey: defaultsFavorites)
    }

    func remove(placeId: Int) {
        var favoriteIds = UserDefaults.standard.array(forKey: defaultsFavorites) as? [Int]
        favoriteIds?.removeAll { id in id == placeId }
        UserDefaults.standard.set(favoriteIds, forKey: defaultsFavorites)
    }
}




// Ci-dessous ce sont les constantes globales, déclaréées hors structure, c'est ce qui permet une cohérence dans l'app
// On ouvre les corchets car c'est un tableau de données
// places et users au pluriel car ces constantes regroupent toutes les données de la DATABASE


var places = [Place(id: 1, name: "Poulailler à partager", type: .independantSpace, picture: "place1_picture", adress: "10 avenue de la Liberté, Lille", description: "Mon poulailler peut contenir 30 poules, j'en ai déjà 15 qui sont très gentilles et pourraient accueillir des amies.", date: "20 février", userId: 1, location: CLLocationCoordinate2D(latitude: 50.6368293762207, longitude: 3.052717924118042)),
              
              Place(id: 2, name: "Plantes sur balcon", type: .recolt, picture: "place2_picture", adress: "3 rue de la Digue, Lille", description: "Je pars en vacances d'été et mes plantes arômatiques ainsi que mes fleurs auraient besoin de vous pour ne pas faner.", date: "18 février", userId: 2, location: CLLocationCoordinate2D(latitude: 50.6354209, longitude: 3.0452537)),
              
              Place(id: 3, name: "Ruches sur toit", type: .independantSpace, picture: "place3_picture", adress: "10 avenue de la Liberté, Lille", description: "Bienvenue, je vais mettre une ruche sur mon toit dans les prochaines semaines, s'il y a des des apprentis apiculteurs dans le coin je suis preneuse.", date: "23 février", userId: 1, location: CLLocationCoordinate2D(latitude: 50.6368293762207, longitude: 3.052717924118042)),
              
              Place(id: 4, name: "Jardin de légumes variés", type: .shareSpace, picture: "place4_picture", adress: "1 rue du Faubourg Notre Dame, Lille", description: "Et voilà mon jardin, j'y plante des tomates, des haricots, des radis, des poireaux et il reste encore de la place si vous aussi vous voulez planter vos légumes.", date: "25 février", userId: 3, location: CLLocationCoordinate2D(latitude: 50.6306787, longitude: 3.0534665)),
              
              Place(id: 5, name: "Potager d'été", type: .recolt, picture: "place5_picture", adress: "340 avenue de l'Alcazar, Lille", description: "Je tiens beaucoup à mon potager mais je serais absente pour la récolte de cet été. ", date: "2 juillet", userId: 1, location: CLLocationCoordinate2D(latitude: 50.63703536987305, longitude: 3.0845353603363037)),
              
              Place(id: 6, name: "Plantes aromatiques", type: .independantSpace, picture: "place6_picture", adress: "5 rue Ampère, Lambersart", description: "J'arrose tous les jours mes plantes arômatiques, sauf le weekend car je manque de temps.", date: "30 avril", userId: 4, location: CLLocationCoordinate2D(latitude: 50.6406373, longitude: 3.0215792)),
              
              Place(id: 7, name: "Beau jardin", type: .independantSpace, picture: "place7_picture", adress: "34 rue d'esquermes, Lille", description: "Mon jardin est assez grand, j'en prend soin mais je suis seul à m'en occuper, un petit coup de main (verte) me ferais plaisir.", date: "14 février", userId: 5, location: CLLocationCoordinate2D(latitude: 50.6243482, longitude: 3.0438553)),
              
              Place(id: 8, name: "Ruches collectives", type: .shareSpace, picture: "place8_picture", adress: "165 avenue de Bretagne, Lille", description: "Projet de ruches sur les toits d'Euratechnologie, l'ouverture est pour bientot. Nous avons hâte de commencer!", date: "26 février", userId: 6, location: CLLocationCoordinate2D(latitude: 50.6327635, longitude: 3.0209538)),
              
              Place(id: 9, name: "Potager sur roue", type: .shareSpace, picture: "place9_picture", adress: "1 rue Mexico, Lille", description: "J'ai acheté cette magnifique cariole pour pouvoir cultiver mes légumes mais je ne m'en sers pas, je ne m'en séparerais pas non plus ! Si ça peut vous êtes utile!", date: "7 avril", userId: 5, location: CLLocationCoordinate2D(latitude: 50.6220226, longitude: 3.0448327)),
              
              Place(id: 10, name: "Ferme urbaine du Trichon", type: .shareSpace, picture: "place10_picture", adress: "10 avenue Germaine, La Madeleine", description: "Cette ferme est disponible pour vos pratiques agricoles, partageons nos terrains, nos connaissances.", date: "20 mars", userId: 7, location: CLLocationCoordinate2D(latitude: 50.691106, longitude: 3.0754225))]


let users = [User(id: 1, firstName: "Martine", lastName: "Martin", picture: "user1_picture", email: "martin@gmail.com", password: "1234", phone: "0102030405", description: "Hola chicos, je suis Martine, j'adore jardiner et je vous partagerai mes trucs et astuces avec plaisir, à bientôt"),
             
             User(id: 2, firstName: "Françoise", lastName: "Marte", picture: "user2_picture", email: "francoise@gmail.com", password: "1234", phone: "0102030405", description: "Je m'appelle Françoise, j'habite Lille depuis peu et j'ai besoin de quelqu'un pour faire du plant-sitting pendant les vacances"),
             
             User(id: 3, firstName: "Jean", lastName: "Michel", picture: "user3_picture", email: "jean@gmail.com", password: "1234", phone: "0102030405", description: "Salut, je suis Jean et j'ai de la place disponible dans mon jardin, je peux prêter du matériel également"),
             
             User(id: 4, firstName: "Philippe", lastName: "Vert", picture: "user4_picture", email: "pvert@sfr.fr", password: "1234", phone: "0789089783", description: "Je m'appelle Phillipe je suis chef dans un restaurant au centre de Lille, j'aime manger des plats avec du goût et des arômes uniques."),
             
             User(id: 5, firstName: "Gilles", lastName: "Mignon", picture: "user5_picture", email: "gilou@gmail.com", password: "1234", phone: "0768025603", description: "Quoi de mieux qu'un beau jardin, respirer l'air pur et profiter de cette nature dans nos villes? RIEN !"),
             
             User(id: 6, firstName: "Valérie", lastName: "Pita", picture: "user6_picture", email: "pitaV@gmail.com", password: "1234", phone: "2456788", description: "Bonjour, je suis en charge du projet GreenEuratech, je suis impatiente de partager avec vous ma passion pour l'agriculture urbaine"),
             
             User(id: 7, firstName: "Coopérative Trichon", lastName: "", picture: "user7_picture", email: "cooperative@gmail.com", password: "1234", phone: "234567", description: "Ensemble pour un meilleur environnement,vous êtes les bienvenues à la Ferme urbaine de Trichon et vive la nature.")]




