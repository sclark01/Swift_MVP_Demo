import Foundation

struct PersonForListViewModel {
    fileprivate let person: Person

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

extension PersonForListViewModel : Equatable {}

func ==(lhs: PersonForListViewModel, rhs: PersonForListViewModel) -> Bool {
    return lhs.person == rhs.person
}
