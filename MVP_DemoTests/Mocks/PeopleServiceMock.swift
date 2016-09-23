import Foundation

@testable import MVP_Demo

class PeopleServiceMock : PeopleServiceType {
    var getPersonByIdCallWithId: Int?

    var returnWithPerson: Person?
    var getPeopleCalled = false

    fileprivate var mockPeople: [Person]!

    func withMock(_ people: [Person]) {
        mockPeople = people
    }

    func getPeople(_ onCompletion: @escaping ([Person]) -> Void) {
        getPeopleCalled = true
        onCompletion(mockPeople)
    }

    func getPersonByID(withID id: Int, onCompletion: @escaping (Person) -> Void) {
        getPersonByIdCallWithId = id
        onCompletion(returnWithPerson!)
    }
}
