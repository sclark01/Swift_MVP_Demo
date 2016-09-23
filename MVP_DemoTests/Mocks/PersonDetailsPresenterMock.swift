import Foundation

@testable import MVP_Demo

class PersonDetailsPresenterMock : PersonDetailsPresenterType {

    let view: PersonDetailsView

    var mockViewModel: PersonDetailsViewModel!

    required init(view: PersonDetailsView, service: PeopleServiceType) {
        self.view = view
    }

    var didGetPersonWithId: Int?

    func getPersonWith(id: Int) {
        didGetPersonWithId = id
        view.display(person: mockViewModel)
    }
}
