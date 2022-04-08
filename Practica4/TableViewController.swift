//
//  TableViewController.swift
//  Practica3
//
//  Created by Cesar Morones on 06/04/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var datos = [[String:Any]]()

  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .systemGray
        obtenInfo()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        datos.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loQueYoQuiera", for: indexPath)

        let elDict = datos[indexPath.row]
        
    
        
        // del diccionario obtenemos el valor en la llave "entidad"
        let nombre = (elDict["name"] as? String) ?? "\(indexPath.row)"
       
        
        let imagend = (elDict["image"] as? String) ?? "\(indexPath.row)"
        
        let imagen = UIImage(named: imagend)
        
       cell.textLabel?.text = nombre
       cell.imageView?.image = imagen
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
        
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detalle", sender: self)
    }
    
    func obtenInfo() {
        // encuentra la ubicación en tiempo de ejecución de un archivo agregado al proyecto
        if let rutaAlArchivo = Bundle.main.url(forResource: "Drinks", withExtension: "plist") {
            do {
                let bytes = try Data(contentsOf: rutaAlArchivo)
                let tmp = try PropertyListSerialization.propertyList(from: bytes, options: .mutableContainers, format:nil)
                datos = tmp as! [[String:Any]]
            }
            catch {
                // manejar el error
                print (error.localizedDescription)
            }
        }
    }
    
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let nuevoVC = segue.destination as! ViewControllerT
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            let elDict = datos[indexPath.row]
            let nombre = (elDict["name"] as? String) ?? "\(indexPath.row)"
            let imagend = (elDict["image"] as? String) ?? "\(indexPath.row)"
            let directions = (elDict["directions"] as? String) ?? "\(indexPath.row)"
            let ingredients = (elDict["ingredients"] as? String) ?? "\(indexPath.row)"
            
         
            nuevoVC.bebida_nombre = nombre
            nuevoVC.bebida_imagen = imagend
            nuevoVC.bebida_directions = directions
            nuevoVC.bebida_ingredientes = ingredients
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    

}
