import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonDetailsViewControllerTests : QuickSpec {
    override func spec() {
        describe("the person details view controller") {
            var viewController: PersonDetailsViewController!
            var mockPersonDetailsPresenter: PersonDetailsPresenterMock!

            let mockViewModel = PersonDetailsViewModel(person: Person(id: 10, name: "someName", phone: "somePhone", age: "someAge"))

            let id = 11

            beforeEach {
                let storyBoard = UIStoryboard(name: "PersonDetails", bundle: nil)
                viewController = storyBoard.instantiateInitialViewController() as! PersonDetailsViewController
                mockPersonDetailsPresenter = PersonDetailsPresenterMock(view: viewController, service: PeopleServiceMock())
                mockPersonDetailsPresenter.mockViewModel = mockViewModel
                viewController.personDetailsPresenter = mockPersonDetailsPresenter
                viewController.personId = id
                let _ = viewController.view
            }

            it("should ask the presenter for a user on load") {
                expect(mockPersonDetailsPresenter.didGetPersonWithId) == id
            }

            it("should correctly add the labels") {
                expect(viewController.nameLabel.text) == mockViewModel.name
                expect(viewController.ageLabel.text) == mockViewModel.age
                expect(viewController.phoneLabel.text) == mockViewModel.phone
            }
        }
    }
}