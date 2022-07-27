//
//  SchoolListViewController.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/26/22.
//

import UIKit

class SchoolListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!

    weak var coordinator: SchoolCoordinator?
    private var viewModel: SchoolListViewProtocol

    init?(_ viewModel: SchoolListViewProtocol, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable, renamed: "init(viewModel:coder:)")
    required init?(coder: NSCoder) {
            fatalError("Invalid way of decoding this class")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYC Schools"

        self.tblView.register(SchoolTableViewCell.nib,
                              forCellReuseIdentifier: SchoolTableViewCell.reuseIdentifier)
        tblView.rowHeight = UITableView.automaticDimension
        tblView.dataSource = self
        tblView.delegate = self

        //ViewModel will call below block whenever data updated
        self.viewModel.updateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }

        //ViewModel will call below block whenever error happen
        self.viewModel.showError = { [weak self] errorMessage in
            //Show Alert/Toast View for errorMessage
            //Given more time, I would show alert here
            print("Show error message:\(errorMessage)")
            //Reloading Tableview even if error case so tableview can update id ant steal data
            DispatchQueue.main.async {
                self?.tblView.reloadData()
            }
        }

        //Given more time, I would prefer to implement pagination
        let request = self.viewModel.schoolListRequest()
        self.viewModel.fetchSchool(request)
    }
}

extension SchoolListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = SchoolTableViewCell.reuseIdentifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? SchoolTableViewCell else {
            return UITableViewCell()
        }
        let schoolViewModel = viewModel.itemAtIndexPath(indexPath.row)
        cell.configure(school: schoolViewModel)
        return cell
    }
}

extension SchoolListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolViewModel = viewModel.itemAtIndexPath(indexPath.row)
        coordinator?.coordinateToDetailPage(with: schoolViewModel)
    }
}
