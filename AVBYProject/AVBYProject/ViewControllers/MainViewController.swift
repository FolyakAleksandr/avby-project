import UIKit

class MainViewController: UIViewController {
    // MARK: - Private properties

    private let carTableView = UITableView()

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
    }
}

// MARK: - Extension

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarsCustomCell", for: indexPath) as? CarsCustomCell else { return UITableViewCell() }
        cell.backgroundColor = UIColor(named: "backgroundView")
        cell.selectionStyle = .none
        return cell
    }
}
