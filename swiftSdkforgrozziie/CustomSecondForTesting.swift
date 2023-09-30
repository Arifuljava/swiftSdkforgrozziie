import UIKit

class CustomSecondForTesting: UIViewController {

    // MARK: - Properties

    

    // Define a data source for the table view
    var tableData: [String] = []

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - View Setup

    private func setupViews() {
        // Create and configure title label
        titleLabel = UILabel()
        titleLabel.text = "Custom Alert Title"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Create and configure table view
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Create and configure buttons
        button1 = UIButton()
        button1.setTitle("Button 1", for: .normal)
        button1.backgroundColor = UIColor.blue
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false

        button2 = UIButton()
        button2.setTitle("Button 2", for: .normal)
        button2.backgroundColor = UIColor.red
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false

        // Add subviews
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(button1)
        view.addSubview(button2)

        // Configure Auto Layout constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 150), // Adjust as needed

            button1.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            button1.heightAnchor.constraint(equalToConstant: 40),

            button2.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            button2.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    // MARK: - Button Actions

    @objc private func button1Tapped() {
        // Handle button 1 tap
        dismiss(animated: true, completion: nil)
    }

    @objc private func button2Tapped() {
        // Handle button 2 tap
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension CustomSecondForTesting: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
}
