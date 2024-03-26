import UIKit

class MainViewController: UIViewController {
    // MARK: - Private properties

    private let carTableView = UITableView()
    private let infoCar = Car.addCar()

    // MARK: - Variables

    var counter = 0

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundViewController()
        configureCarTableView()
    }

    // MARK: - Methods

    private func configureCarTableView() {
        view.addSubview(carTableView)
        carTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            carTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            carTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            carTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.separatorStyle = .none
        carTableView.backgroundColor = UIColor(named: "backgroundView")
        carTableView.register(CarsCustomCell.self, forCellReuseIdentifier: "CarsCustomCell")
        carTableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extension

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoCar.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarsCustomCell", for: indexPath) as? CarsCustomCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "backgroundView")
        cell.selectionStyle = .none
        cell.setupInfoCar(model: infoCar[indexPath.row])
        cell.closure = {
            self.present(Alert.showAlert("Кредит!", "Данный авто будет обходиться в \(self.infoCar[indexPath.row].priceCredit) USD/месяц"), animated: true)
        }
        cell.closureBookmarkButton = {
            if self.counter == 0 {
                self.present(Alert.showAlert("Успех!", "Вы добавили \(self.infoCar[indexPath.row].name.rawValue) в избранное"), animated: true)
                self.counter += 1
            } else {
                self.present(Alert.showAlert("Жаль!", "Вы удалили \(self.infoCar[indexPath.row].name.rawValue) из избранного"), animated: true)
                self.counter = 0
            }
        }
        return cell
    }
}
