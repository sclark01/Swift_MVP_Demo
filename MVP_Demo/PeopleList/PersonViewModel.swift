import Foundation

struct PersonViewModel {
    private let person: Person

    init(person: Person) {
        self.person = person
    }

    var name: String {
        return person.name
    }

    var phone: String {
        return "Phone: \(person.phone)"
    }

    var id: Int {
        return person.id
    }
}

extension PersonViewModel : Equatable {}

func ==(lhs: PersonViewModel, rhs: PersonViewModel) -> Bool {
    return lhs.person == rhs.person
}