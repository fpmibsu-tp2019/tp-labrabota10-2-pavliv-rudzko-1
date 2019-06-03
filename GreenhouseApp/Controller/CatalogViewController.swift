//
//  CatalogViewController.swift
//  GreenhouseApp
//
//  Created by Elizaveta on 6/2/19.
//

import UIKit
import CoreData

class CatalogViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var compositionsView: UIView!
    @IBOutlet var compositionsTable: UITableView!
    @IBOutlet var flowersTable: UITableView!
    @IBOutlet var flowersView: UIView!
    
    var compositions = [NSManagedObject]()
    var flowers = [NSManagedObject]()
    var login: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init compos (all from db for user)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        flowersView.isHidden = true
        compositionsView.isHidden = false
    }
    
    @IBAction func cartButtonClicked(_ sender: Any) {
         performSegue(withIdentifier: "cartSegue", sender: compositions)
    }
    
    @IBAction func backMenuButtonClicked(_ sender: Any) {
         dismiss(animated: true, completion: nil)
         let vc  = ViewController(nibName: "ViewController", bundle:nil)
         navigationController?.pushViewController(vc, animated: true)
         vc.getTable = { () in
            return self.compositions
         }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView == compositionsTable)
        {
            return compositions.count
        }
        return flowers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if (tableView == compositionsTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
            let comp = compositions[indexPath.row] /*as! Composition*/
           /* cell.name?.text = comp.name
            cell.price?.text = (String)(comp.price)*/
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlowerTableViewCell") as! OrderTableViewCell
        let flower = flowers[indexPath.row] /*as! Flower*/
        /* cell.name?.text = flower.name
         cell.kind?.text = flower.kind
         cell.price?.text = (String)(flower.price)
         cell.count?.text = (String)flower.count*/
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (tableView == compositionsTable)
        {
            compositionsView.isHidden = true
            flowersView.isHidden = false
            //flowers array init with values from db for composition at indexPath.row
            flowersTable.reloadData()
        }
        else
        {
            DispatchQueue.main.async
                {
                    let alert = UIAlertController(title: "Flower photo", message: nil, preferredStyle: UIAlertController.Style.alert)
                    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 300, height: 300))
                   // imageView.image = image //  image from db
                    alert.view.addSubview(imageView)
                    let height = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 370)
                    let width = NSLayoutConstraint(item: alert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
                    alert.view.addConstraint(height)
                    alert.view.addConstraint(width)
                    let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    {
                        (UIAlertAction) -> Void in
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                    {
                        () -> Void in
                    }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "makeSegue")
        {
            let vc = segue.destination as! CatalogViewController
            vc.login = (sender as? String)!
        }
    }

}
