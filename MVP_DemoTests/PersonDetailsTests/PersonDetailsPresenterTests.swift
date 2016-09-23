import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonDetailsPresenterTests : QuickSpec {
    override func spec() {
        describe("the person details presenter") {
            var presenter: PersonDetailsPresenter!
            var mockService: PeopleServiceMock!
            var mockView: PersonDetailsViewMock!
            let id = 10
            let person = Person(id: id, name: "someName", phone: "somePhone", age: "someAge")

            beforeEach {
                mockService = PeopleServiceMock()
                mockView = PersonDetailsViewMock()
                mockService.returnWithPerson = person

                presenter = PersonDetailsPresenter(view: mockView, service: mockService)
            }


            it("should call the people service to get a person") {
                presenter.getPersonWith(id: id)

                expect(mockService.getPersonByIdCallWithId) == id
            }

            it("should update the view with the correct person view model") {
                presenter.getPersonWith(id: id)

                expect(mockView.didDisplayWithPersonViewModel).toEventually(equal(PersonDetailsViewModel(person: person)))
            }
        }
    }
}
