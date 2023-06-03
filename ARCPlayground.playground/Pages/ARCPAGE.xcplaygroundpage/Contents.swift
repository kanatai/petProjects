//import UIKit
//
/////# Automatic reference counting (Автоматический подсчет ссылок) ARC
//
//class Person {
//    var name = String()
//
//    init(name: String) {
//        self.name = name
////        print("\(name) инициализирован и создан в памяти")
//    }
//
//    deinit {
////        print("\(name) Удален из памяти")
//    }
//}
//
//var reference1: Person?
//unowned var reference2: Person?
//unowned var reference3: Person?
//
//reference1 = Person(name: "Jack")
//reference2 = reference1
//reference3 = reference1
//
/////# тут у нас происходит утечка памяти так как объект не освобежден из памяти,
/////# потому что к нему ссылаются другие обьекты нужно их отсяеденить либо сделать слабой ссылкой
//reference1 = nil
//
////MARK: - Цикл сильных ссылок
//class Hotel {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name) Заехал в память")
//    }
//
//    weak var apartament: Apartament?
//
//    deinit {
//        print("\(name) Выселился из памяти")
//    }
//}
//
//class Apartament {
//    let room: String
//
//    init(room: String) {
//        self.room = room
//        print("\(room) Номер в память")
//    }
//
//    weak var hotel: Hotel?
//
//    deinit {
//        print("Апартаменты \(room) освобождаются")
//    }
//}
//
//var objHotel: Hotel?
//var objApartament: Apartament?
//
//objHotel = Hotel(name: "John Smith")
//objApartament = Apartament(room: "122")
//
//objHotel!.apartament = objApartament
//objApartament!.hotel = objHotel
//
//objHotel = nil
//objApartament = nil
//
//
//



