import UIKit.UIImage
class Car {
    let name: NameCars
    let restyling: RestylingCars
    let price: PriceRublesCar
    let imageCar: [UIImage?]
    let description: DescriptionCar
    let city: City

        init(name: NameCars, restyling: RestylingCars, price: PriceRublesCar, imageCar: [UIImage?], description: DescriptionCar, city: City)
    {
        self.name = name
        self.restyling = restyling
        self.price = price
        self.imageCar = imageCar
        self.description = description
        self.city = city
    }

    static func addCar() -> [Car] {
        [
            .init(name: .nissan350z, restyling: .yes, price: .nissan350z, imageCar: [
                UIImage(named: "350z.1"),
                UIImage(named: "350z.2"),
                UIImage(named: "350z.3"),
                UIImage(named: "350z.4"),
                UIImage(named: "350z.5")
            ], description: DescriptionCar(
                year: .nissan350z,
                transmission: .automatic,
                capacity: Capacity.four,
                typeEngine: .gasoline,
                body: .cupe,
                mileage: .nissan350z),
            city: .moscow),

            .init(name: .toyotaAltezza, restyling: .no, price: .toyotaAltezza, imageCar: [
                UIImage(named: "altezza.1"),
                UIImage(named: "altezza.2"),
                UIImage(named: "altezza.3"),
                UIImage(named: "altezza.4"),
                UIImage(named: "altezza.5")
            ], description: DescriptionCar(
                year: .toyotaAltezza,
                transmission: .automatic,
                capacity: Capacity.two,
                typeEngine: .gasoline,
                body: .sedan,
                mileage: .toyotaAltezza),
            city: .omsk),

            .init(name: .toyotaCresta, restyling: .yes, price: .toyotaCresta, imageCar: [
                UIImage(named: "cresta100.1"),
                UIImage(named: "cresta100.2"),
                UIImage(named: "cresta100.3"),
                UIImage(named: "cresta100.4"),
                UIImage(named: "cresta100.5")
            ], description: DescriptionCar(
                year: .toyotaCresta,
                transmission: .mechanic,
                capacity: Capacity.three,
                typeEngine: .gasoline,
                body: .sedan,
                mileage: .toyotaCresta),
            city: .vladivostok),

            .init(name: .mitsubishiEvo, restyling: .no, price: .mitsubishiEvo, imageCar: [
                UIImage(named: "evo10.1"),
                UIImage(named: "evo10.2"),
                UIImage(named: "evo10.3"),
                UIImage(named: "evo10.4"),
                UIImage(named: "evo10.5")
            ], description: DescriptionCar(
                year: .mitsubishiEvo,
                transmission: .robot,
                capacity: Capacity.two,
                typeEngine: .gasoline,
                body: .sedan,
                mileage: .mitsubishiEvo),
            city: .spb),

            .init(name: .nissanGTR, restyling: .no, price: .nissanGTR, imageCar: [
                UIImage(named: "gtr.1"),
                UIImage(named: "gtr.2"),
                UIImage(named: "gtr.3"),
                UIImage(named: "gtr.4"),
                UIImage(named: "gtr.5")
            ], description: DescriptionCar(
                year: .nissanGTR,
                transmission: .mechanic,
                capacity: Capacity.three,
                typeEngine: .gasoline,
                body: .cupe,
                mileage: .nissanGTR),
            city: .moscow),

            .init(name: .toyotaMark, restyling: .no, price: .toyotaMark, imageCar: [
                UIImage(named: "mark100.1"),
                UIImage(named: "mark100.2"),
                UIImage(named: "mark100.3"),
                UIImage(named: "mark100.4"),
                UIImage(named: "mark100.5")
            ], description: DescriptionCar(
                year: .toyotaMark,
                transmission: .automatic,
                capacity: Capacity.three,
                typeEngine: .gasoline,
                body: .sedan,
                mileage: .toyotaMark),
            city: .vladivostok),

            .init(name: .mazdaRX8, restyling: .yes, price: .mazdaRX8, imageCar: [
                UIImage(named: "rx8.1"),
                UIImage(named: "rx8.2"),
                UIImage(named: "rx8.3"),
                UIImage(named: "rx8.4"),
                UIImage(named: "rx8.5")
            ], description: DescriptionCar(
                year: .mazdaRX8,
                transmission: .automatic,
                capacity: Capacity.one,
                typeEngine: .gasoline,
                body: .cupe,
                mileage: .mazdaRX8),
            city: .omsk)
        ]
    }

    static func dateSale() -> String {
        let number = Int.random(in: 1..<31)
        let month = ["дек", "янв", "фев", "мар", "апр", "мая", "июня", "июля", "авг", "сен", "окт", "ноя"].randomElement() ?? ""
        return "\(String(number)) \(month)"
    }

    static func randomPriceCredit() -> String {
        let number = Int.random(in: 250..<500)
        return "\(number)"
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

class DescriptionCar {
    let year: YearCar
    let transmission: Transmission
    let capacity: Capacity
    let typeEngine: TypeEngine
    let body: Body
    let mileage: Mileage

    init(year: YearCar, transmission: Transmission, capacity: Capacity, typeEngine: TypeEngine, body: Body, mileage: Mileage) {
        self.year = year
        self.transmission = transmission
        self.capacity = capacity
        self.typeEngine = typeEngine
        self.body = body
        self.mileage = mileage
    }
}

enum YearCar: Int {
    case nissan350z = 2004
    case toyotaAltezza = 2002
    case toyotaCresta = 1999
    case mitsubishiEvo = 2008
    case nissanGTR = 1998
    case toyotaMark = 1996
    case mazdaRX8 = 2003
}

enum Transmission: String {
    case mechanic = "механика"
    case automatic = "автомат"
    case robot = "робот"
}

enum Capacity: Double {
    case one = 1.3
    case two = 2.0
    case three = 2.5
    case four = 3.5
}

enum TypeEngine: String {
    case gasoline = "бензин"
    case electric = "электричество"
}

enum Body: String {
    case sedan = "седан"
    case cupe = "купе"
}

enum Mileage: Int {
    case nissan350z = 150000
    case toyotaAltezza = 195000
    case toyotaCresta = 289000
    case mitsubishiEvo = 156301
    case nissanGTR = 135000
    case toyotaMark = 331405
    case mazdaRX8 = 144900
}

enum City: String {
    case moscow = "Москва"
    case omsk = "Омск"
    case spb = "Санкт-Петербург"
    case vladivostok = "Владивосток"
}
