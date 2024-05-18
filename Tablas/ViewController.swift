//
//  ViewController.swift
//  Tablas
//
//  Created by Diplomado on 17/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView:UITableView!
    var array = ["Uno", "Dos", "Tres"]
    let arrayDos = ["Cuatro", "Cinco", "Seis"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        array.append(textField.text ?? "")
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource {
    // Aqui le ponemos el titulo a la tabla en este caso se lo ponemos en la parte de arriba
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Mi tabla"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Este es el fin de la tabla"
    }
    
    // si solo tenemos una linea no es necesario poner la palabra reservada return
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    // aqui le decimos cuantas celdas (filas) queremos tener
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // para manipular las secciones
        if section == 0 {
            arrayDos.count
        } else {
            array.count
        }
    }
    
    // aqui es donde creamos el tipo de celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        
        if indexPath.section == 0 {
            cell?.CellTextLabel.text = arrayDos[indexPath.row]
        } else {
            cell?.CellTextLabel.text = array[indexPath.row]
        }
        
        // MARK: nueva forma de hacerla sin usar las cosas deprecadas
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
        
        // validamos que el disposivito soporte iOS 14 para poder ocupar las nuevas
//        // formas de escribir codigo
//        if #available(iOS 14, *) {
//            var content = cell?.defaultContentConfiguration()
////            content?.text = "Hello"
//            // indexPath.row contiene la posicion de la celda
//            content?.text = array[indexPath.row]
//            cell?.contentConfiguration = content
//        } else {
//            cell?.textLabel?.text = "Holis"
//        }
        
        // ----------------
        
        // MARK: Esta es la forma de hacer una celda reutilizable
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
//        cell?.textLabel?.text = "Holis"
        
        // ----------------
        
        // MARK: Esta es la forma de hacer una celda no reutilizable
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // textLabel ya esta deprecado en la version 14 pero se sigue usando
        //cell.textLabel?.text = "Holi"
        // detailTextLabel ya esta deprecado tambien
        //cell.detailTextLabel?.text = "a todos"
        
        return cell!
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            70.0
        } else {
            50.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
