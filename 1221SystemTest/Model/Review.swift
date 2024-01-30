import Foundation

struct Review: Identifiable, Hashable {
    var id: String
    var name: String
    var date: String
    var rating: Int
    var desc: String
}

extension Review {
    static var FETCH_MOCK: Review {
        Review(id: UUID().uuidString, name: "Александар B", date: "7 мая 2021", rating: 4, desc: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
    }
    
    static var FETCH_MOCKS: [Review] {
        [
        Review(id: UUID().uuidString, name: "Александар B", date: "7 мая 2021", rating: 4, desc: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
        Review(id: UUID().uuidString, name: "Александар B", date: "7 мая 2021", rating: 4, desc: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
        Review(id: UUID().uuidString, name: "Александар B", date: "7 мая 2021", rating: 4, desc: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
        Review(id: UUID().uuidString, name: "Александар B", date: "7 мая 2021", rating: 4, desc: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
        ]
    }
}
