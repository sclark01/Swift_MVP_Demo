import Foundation

@testable import MVP_Demo

class MockPeopleService : PeopleServiceType {

    var getPeopleCalled = false

    private var people: [Person] = []

    func getPeople(onCompletion: ([Person]) -> Void) {
        getPeopleCalled = true
        onCompletion(people)
    }

    func withMock(people people: [Person]) {
        self.people = people
    }
}