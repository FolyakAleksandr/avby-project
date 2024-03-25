import UIKit.UIImage
class Car {
    let name: NameCars
    let restyling: RestylingCars
    let price: PriceRublesCar
    let imageCar: [UIImage?]

    init(name: NameCars, restyling: RestylingCars, price: PriceRublesCar, imageCar: [UIImage?]) {
        self.name = name
        self.restyling = restyling
        self.price = price
        self.imageCar = imageCar
    }

    static func addCar() -> [Car] {
        [
            .init(name: .nissan350z, restyling: .yes, price: .nissan350z, imageCar: [
                UIImage(named: "350z.1"),
                UIImage(named: "350z.2"),
                UIImage(named: "350z.3"),
                UIImage(named: "350z.4"),
                UIImage(named: "350z.5")
            ]),
            .init(name: .toyotaAltezza, restyling: .no, price: .toyotaAltezza, imageCar: [
                UIImage(named: "altezza.1"),
                UIImage(named: "altezza.2"),
                UIImage(named: "altezza.3"),
                UIImage(named: "altezza.4"),
                UIImage(named: "altezza.5")
            ]),
            .init(name: .toyotaCresta, restyling: .yes, price: .toyotaCresta, imageCar: [
                UIImage(named: "cresta100.1"),
                UIImage(named: "cresta100.2"),
                UIImage(named: "cresta100.3"),
                UIImage(named: "cresta100.4"),
                UIImage(named: "cresta100.5")
            ]),
            .init(name: .mitsubishiEvo, restyling: .no, price: .mitsubishiEvo, imageCar: [
                UIImage(named: "evo10.1"),
                UIImage(named: "evo10.2"),
                UIImage(named: "evo10.3"),
                UIImage(named: "evo10.4"),
                UIImage(named: "evo10.5")
            ]),
            .init(name: .nissanGTR, restyling: .no, price: .nissanGTR, imageCar: [
                UIImage(named: "gtr.1"),
                UIImage(named: "gtr.2"),
                UIImage(named: "gtr.3"),
                UIImage(named: "gtr.4"),
                UIImage(named: "gtr.5")
            ]),
            .init(name: .toyotaMark, restyling: .no, price: .toyotaMark, imageCar: [
                UIImage(named: "mark100.1"),
                UIImage(named: "mark100.2"),
                UIImage(named: "mark100.3"),
                UIImage(named: "mark100.4"),
                UIImage(named: "mark100.5")
            ]),
            .init(name: .mazdaRX8, restyling: .yes, price: .mazdaRX8, imageCar: [
                UIImage(named: "rx8.1"),
                UIImage(named: "rx8.2"),
                UIImage(named: "rx8.3"),
                UIImage(named: "rx8.4"),
                UIImage(named: "rx8.5")
            ])
        ]
    }
}

enum NameCars: String {
    case nissan350z = "Nissan 350Z I"
    case toyotaAltezza = "Toyota Altezza"
    case toyotaCresta = "Toyota Cresta X100"
    case mitsubishiEvo = "Mitsubishi Lancer Evolution X"
    case nissanGTR = "Nissan Skyline GTR"
    case toyotaMark = "Toyota Mark II X100"
    case mazdaRX8 = "Mazda RX-8 I"
}

enum RestylingCars: String {
    case yes = " | · Рестайлинг"
    case no = ""
}

enum PriceRublesCar: Int {
    case nissan350z = 1990000
    case toyotaAltezza = 1150000
    case toyotaCresta = 1180000
    case mitsubishiEvo = 2600000
    case nissanGTR = 3900000
    case toyotaMark = 1390000
    case mazdaRX8 = 2150000
}
