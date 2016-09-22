import Foundation

@testable import MVP_Demo

class PersonDetailsPresenterMock : PersonDetailsPresenterType {

    required init(view: PersonDetailsView, service: PeopleServiceType) {

    }

    var didGetPersonWithId: Int?

    func getPersonWith(id id: Int) {
        didGetPersonWithId = id
    }
}