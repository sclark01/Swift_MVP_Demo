import Foundation

@testable import MVP_Demo

class PersonDetailsViewMock : PersonDetailsView {

    var didDisplayWithPersonViewModel: PersonForListViewModel!

    func display(person person: PersonForListViewModel) {
        didDisplayWithPersonViewModel = person
    }
}