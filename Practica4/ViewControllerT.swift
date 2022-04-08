//
//  ViewControllerT.swift
//  Sesion3
//
//  Created by Ángel González on 25/03/22.
//

import UIKit

class ViewControllerT: UIViewController  {

    var nombre: UILabel!
    var directions: UILabel!
    var image: UIImageView!
    var btnBack: UIButton!
    var ingredients : UILabel!
 
   
    
    
    var bebida_nombre = String()
    var bebida_imagen = String()
    var bebida_directions = String()
    var bebida_intrucciones = String()
    var bebida_ingredientes = String()
      

      
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        
      
        //  let nombre = (bebida["name"] as? String) ?? ""
        
        let imagen = UIImage(named: bebida_imagen)
        
        nombre.text = bebida_nombre
        directions.text = bebida_directions
        ingredients.text = bebida_ingredientes
        image.image = imagen
    }

    override func viewDidLoad() {
      super.viewDidLoad()
        
      
     
    nombre = UILabel()
        nombre.text="Nombre"
        nombre.font=UIFont.systemFont(ofSize: 24)
        nombre.autoresizingMask = .flexibleWidth
        nombre.translatesAutoresizingMaskIntoConstraints=true
        nombre.frame=CGRect(x:self.view.bounds.width / 2, y:50, width: self.view.bounds.width / 2, height: 50)
      self.view.addSubview(nombre)
      
        ingredients = UILabel()
        ingredients.text="Ingredientes"
        ingredients.autoresizingMask = .flexibleWidth
        ingredients.translatesAutoresizingMaskIntoConstraints=true
        ingredients.frame=CGRect(x:self.view.bounds.width / 2, y:110, width:self.view.bounds.width / 2, height: 40)
        self.view.addSubview(ingredients)
        
        
        directions = UILabel()
        directions.text="tipo"
        directions.autoresizingMask = .flexibleWidth
        directions.translatesAutoresizingMaskIntoConstraints=true
        directions.frame=CGRect(x:self.view.bounds.width / 2, y:170, width:self.view.bounds.width / 2, height: 40)
        self.view.addSubview(directions)
      
      image = UIImageView()
      image.backgroundColor = .lightGray
      image.autoresizingMask = [.flexibleWidth, .flexibleWidth]
      image.frame=CGRect(x:0, y:50, width:self.view.bounds.width / 2, height:self.view.frame.width / 2)
      self.view.addSubview(image)
      
      btnBack = UIButton(type: .system)
      btnBack.setTitle("back", for: .normal)
      btnBack.autoresizingMask = .flexibleWidth
      btnBack.translatesAutoresizingMaskIntoConstraints=true
      btnBack.frame=CGRect(x:0, y:0, width: 100, height: 40)
      btnBack.center = self.view.center
      self.view.addSubview(btnBack)
      btnBack.addTarget(self, action: #selector(self.back(_:)), for:.touchUpInside)
        

       
    
    }
    
    @objc func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 

}
