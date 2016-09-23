import Foundation

struct PersonDetailsViewModel {
    fileprivate let person: Person

    init(person: Person) {
        self.person = person
    }

    var name: String {
        return "Name: \(person.name)"
    }

    var age: String {
        return "Age: \(person.age)"
    }

    var phone: String {
        return "Phone: \(person.phone)"
    }

}

extension PersonDetailsViewModel : Equatable {}

func ==(lhs: PersonDetailsViewModel, rhs: PersonDetailsViewModel) -> Bool {
    return lhs.person == rhs.person
}
