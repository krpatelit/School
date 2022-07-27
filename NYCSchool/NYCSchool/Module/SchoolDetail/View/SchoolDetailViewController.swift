//
//  SchoolDetailViewController.swift
//  NYCSchool
//
//  Created by Kiran Patel on 7/27/22.
//

import UIKit

class SchoolDetailViewController: UIViewController {

    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblZip: UILabel!
    @IBOutlet weak var lblAvgReadingScore: UILabel!
    @IBOutlet weak var lblAvgWritingScore: UILabel!
    @IBOutlet weak var lblAvgMathsScore: UILabel!
    @IBOutlet weak var lblTestTakers: UILabel!

    @IBOutlet weak var actIndReading: UIActivityIndicatorView!
    @IBOutlet weak var actIndWriting: UIActivityIndicatorView!
    @IBOutlet weak var actIndMath: UIActivityIndicatorView!
    @IBOutlet weak var actIndTestTaker: UIActivityIndicatorView!
    @IBOutlet weak var topStackView: UIStackView!

    weak var coordinator: SchoolCoordinator?
    private var viewModel: SchoolDetailViewProtocol

    init?(_ viewModel: SchoolDetailViewProtocol, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable, renamed: "init(viewModel:coder:)")
    required init?(coder: NSCoder) {
            fatalError("Invalid way of decoding this class")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Given more time, I would prefer this statis words keep on localized string
        self.title = "School"

        topStackView.layer.borderColor = UIColor.lightGray.cgColor

        //ViewModel will call below block whenever data updated
        self.viewModel.updateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.reloadData()
                self?.stopUIActivityIndicator()
            }
        }

        //ViewModel will call below block whenever error happen
        self.viewModel.showError = { [weak self] errorMessage in
            //Show Alert/Toast View for errorMessage
            //Given more time, I would show alert here
            print("Show error message:\(errorMessage)")
            DispatchQueue.main.async {
                self?.reloadData() //To set default message
                self?.stopUIActivityIndicator()
            }
        }

        self.reloadData()
        let request = self.viewModel.schoolDetailRequest()
        self.viewModel.fetchSchoolDetail(request)
    }

    deinit {
        print("Deinit DetailViewcontroller ")
    }

    //update view with schoolview data from prev page
    //update detail api data(sat data)
    private func reloadData() {
        self.lblSchoolName.text = self.viewModel.schoolName
        self.lblLocation.text = self.viewModel.location
        self.lblCity.text = self.viewModel.city
        self.lblZip.text = self.viewModel.zip

        self.lblTestTakers.text = self.viewModel.satTestTakers
        self.lblAvgReadingScore.text = self.viewModel.satAvgReadingScore
        self.lblAvgWritingScore.text = self.viewModel.satAvgWritingScore
        self.lblAvgMathsScore.text = self.viewModel.satAvgMathScore
    }

    //Stop & Hide ActivityIndicator
    private func stopUIActivityIndicator() {
        self.actIndTestTaker.stopAnimating()
        self.actIndReading.stopAnimating()
        self.actIndWriting.stopAnimating()
        self.actIndMath.stopAnimating()
    }

}
