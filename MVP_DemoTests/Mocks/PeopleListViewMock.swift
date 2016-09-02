import Foundation

@testable import MVP_Demo

class MockPeopleListView : PeopleListView {
    var didSetWithPeople: [PersonViewModel]? = nil

    func set(people people: [PersonViewModel]) {
        didSetWithPeople = people
    }
}