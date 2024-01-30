import Foundation

final class DetailViewModel: ObservableObject {
    var names: [String] = [
        "Производство",
        "Энергетическая ценность, ккал/ 100г",
        "Жиры/100г",
        "Белги/100г",
        "Углеводы/100г"
    ]
    
    var features: [String] = [
        "Россия, Краснодарский край",
        "25 ккал, 105 кДЖ",
        "0,1 г",
        "0,3 г",
        "3,3 г"
    ]
    
    @Published var selectedUnit = "шт"
    @Published var count = 1
    
    let units = ["шт", "кг"]
}
