import Foundation

@testable import MVP_Demo

class PersonDetailsViewMock : PersonDetailsView {

    var didDisplayWithPersonViewModel: PersonDetailsViewModel!

    func display(person: PersonDetailsViewModel) {
        didDisplayWithPersonViewModel = person
    }
}
