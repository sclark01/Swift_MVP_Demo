import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonDetailsPresenterTests : QuickSpec {
    override func spec() {
        describe("the person details presenter") {
            var presenter: PersonDetailsPresenter!
            var mockService: PeopleServiceMock!
            var mockView: PersonDetailsView!

            beforeEach {
                mockService = PeopleServiceMock()
                mockView = PersonDetailsViewMock()
                presenter = PersonDetailsPresenter(view: mockView, service: mockService)
            }


            it("should call the people service to get a person") {
                presenter.getPersonWith(id: 10)


            }
        }
    }
}
