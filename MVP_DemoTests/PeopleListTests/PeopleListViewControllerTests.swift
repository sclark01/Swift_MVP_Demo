import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PeopleListViewControllerTests : QuickSpec {
    override func spec() {
        describe("the people list view controller") {
            var viewController: PeopleListViewController!
            var mockPresenter: PeopleListPresenterMock!

            let personModel = PersonViewModel(person: Person(id: 1, name: "someName", phone: "somePhone", age: "someAge"))

            beforeEach {
                let storyboard = UIStoryboard(name: "PeopleList", bundle: nil)
                viewController = storyboard.instantiateInitialViewController() as! PeopleListViewController
                mockPresenter = PeopleListPresenterMock(view: viewController, peopleService: PeopleServiceMock())
                mockPresenter.willSetWithUsers = [personModel]
                viewController.peoplePresenter = mockPresenter
                let _ = viewController.view
            }

            it("should get users from presenter on load") {
                expect(mockPresenter.didCallGetUsers).to(beTrue())
            }

            it("should have a table view with one section") {
                let sections = viewController.numberOfSectionsInTableView(viewController.tableView)
                expect(sections) == 1
            }

            it("should have 1 row of people") {
                let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
                expect(rows) == 1
            }

            it("should set the correct labels") {
                let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))

                expect(cell.textLabel?.text) == personModel.name
                expect(cell.detailTextLabel?.text) == personModel.phone
            }
        }
        describe("transitioning to person details view controller") {
            var viewController: TestablePeopleListViewController!

            beforeEach {
                viewController = TestablePeopleListViewController()
            }


            it("should push the correct VC") {
                viewController.transitionToPeopleDetailsView(withId: 0)

                expect(viewController.didTransitionWithViewController).to(beAKindOf(PersonDetailsViewController))
            }

            it("should add the correct id to the person details view controller") {
                let id = 10
                viewController.transitionToPeopleDetailsView(withId: id)

                let pushedVC = viewController.didTransitionWithViewController as! PersonDetailsViewController

                expect(pushedVC.personId) == id
            }
        }
    }
}

class TestablePeopleListViewController : PeopleListViewController {
    var didTransitionWithViewController: UIViewController!

    override func transitionTo(viewController vc: UIViewController) {
        didTransitionWithViewController = vc
    }
}
