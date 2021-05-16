//
//  PharmacyDetailViewController.swift
//  farmanet
//
//  Created by Andres Efrain Chango Macas on 5/15/21.
//

import UIKit

class PharmacyDetailViewController: UIViewController {
    var viewModel: PharmacyDetailViewModel!
    @IBOutlet weak var detalle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        // Do any additional setup after loading the view.
    }
    func setUp() {
        self.detalle.text = viewModel.detail
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
