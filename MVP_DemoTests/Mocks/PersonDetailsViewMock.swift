import Foundation

@testable import MVP_Demo

class PersonDetailsViewMock : PersonDetailsView {

    var didDisplayWithPersonViewModel: PersonDetailsViewModel!

    func display(person person: PersonDetailsViewModel) {
        didDisplayWithPersonViewModel = person
    }
}