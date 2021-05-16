//
//  PharmacyViewController.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import UIKit

class PharmacyViewController: UIViewController {
    var viewModel = PharmacyViewModel(service: ServiceManager())
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var logOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegates()
        self.checkStatus()
        self.setUI()
        self.bind()

        // Do any additional setup after loading the view.
    }

    func setUI() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        title = MessageText.shared.welcomeMsg + SettingsManager.shared.loginUser
        tableView.register(UINib(nibName: "PharmacyTableViewCell", bundle: nil), forCellReuseIdentifier: "PharmacyCell")
                activity.startAnimating()
        logOutButton.layer.cornerRadius = 5
        viewModel.retriveDataList()
    }
    func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bind() {
        viewModel.refreshData = {[weak self]  in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
            }
            
        }
    }
    private func checkStatus() {
        viewModel.refreshStatus = {[weak self] (status) in
            if !status {
            DispatchQueue.main.async {
                self?.activity.stopAnimating()
                self?.showAlert(title: MessageText.shared.errorMsg, message: MessageText.shared.networkError)
            }
        }
        }
    }
  
    func showAlert(title: String, message: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: MessageText.shared.aceptMsg, style: .default) {_ in
            DispatchQueue.main.async {
                self.activity.startAnimating()
                self.viewModel.retriveDataList()
            }
        }
        let cancelButton = UIAlertAction(title: MessageText.shared.cancelMsg, style: .default, handler: nil)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: false, completion: nil)
    }

    @IBAction func logOut(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
extension PharmacyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell", for: indexPath) as? PharmacyTableViewCell else { fatalError("Cell not exists")}
        let cellVM = viewModel.getCellViewModel(index: indexPath.row)
        cell.addresss.text = cellVM.localAddress
        cell.name.text = cellVM.localName
        cell.localidad.text = cellVM.localLocalize
        return cell
    }
}
extension PharmacyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pharmacyTableDatilVC = PharmacyDetailViewController(nibName: "PharmacyDetailViewController", bundle: nil)
        let cellVM = viewModel.getCellViewModel(index: indexPath.row)
        pharmacyTableDatilVC.viewModel = PharmacyDetailViewModel(detail: cellVM.description)
        self.navigationController?.pushViewController(pharmacyTableDatilVC, animated: true)
    }
}
