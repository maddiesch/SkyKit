//
//  TableViewController.swift
//  SkyKit
//
//  Created by Skylar Schipper on 3/24/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import UIKit

open class TableViewController : ViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table View Setup
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: type(of: self).defaultTableViewStyle())
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self._configure(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        self.view.addSubview(tableView)
        self.installConstraints(forTableView: tableView, onView: self.view)

        return tableView
    }()

    private func _configure(_ tableView: UITableView) {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        self.configure(tableView: tableView)
    }

    /// Add constraints for the table view.
    ///
    /// - Parameters:
    ///   - tableView: The table view instance
    ///   - view: The view instance the constraints should be added to
    open func installConstraints(forTableView tableView: UITableView, onView view: UIView) {
        view <<| NSLayoutConstraint.offset(view: tableView, edges: .all, offset: 0.0)
    }

    /// Can be overriden to provide configuration
    ///
    /// - Parameter tableView: The table view
    open func configure(tableView: UITableView) {

    }

    /// The table view style
    ///
    /// - Returns: The plain type
    open class func defaultTableViewStyle() -> UITableViewStyle {
        return .plain
    }

    // MARK: - View Lifecycle
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.reloadTableView()
    }

    // MARK: - Reloading
    open func reloadTableView() {
        self.tableView.reloadData()
    }

    // MARK: - Data Source
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = self.tableView(tableView, identifierForCellAtIndexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        self.tableView(tableView, configureCell: cell, forIndexPath: indexPath)
        return cell
    }

    open func tableView(_ tableView: UITableView, identifierForCellAtIndexPath indexPath: IndexPath) -> String {
        return TableViewCell.identifier
    }

    open func tableView(_ tableView: UITableView, configureCell cell: UITableViewCell, forIndexPath indexPath: IndexPath) {
    }
}
