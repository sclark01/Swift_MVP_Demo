import Foundation

@testable import MVP_Demo

class PeopleServiceMock : PeopleServiceType {
    var getPersonByIdCallWithId: Int?

    var returnWithPerson: Person?
    var getPeopleCalled = false

    private var mockPeople: [Person]!

    func withMock(people: [Person]) {
        mockPeople = people
    }

    func getPeople(onCompletion: ([Person]) -> Void) {
        getPeopleCalled = true
        onCompletion(mockPeople)
    }

    func getPersonByID(withID id: Int, onCompletion: (Person) -> Void) {
        getPersonByIdCallWithId = id
        onCompletion(returnWithPerson!)
    }
}