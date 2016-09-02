import Foundation

@testable import MVP_Demo

class MockPeopleListView : PeopleListView {
    var didSetWithPeople: [Person]? = nil

    func set(people people: [Person]) {
        didSetWithPeople = people
    }
}