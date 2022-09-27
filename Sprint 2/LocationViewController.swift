//
//  LocationViewController.swift
//  Sprint 2
//
//  Created by Capgemini-DA078 on 23/09/22.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class LocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //MARK: Variable Decleration
    var locationManager: CLLocationManager!
    var location: CLLocation!
    
    var orderItem : [Cart] = []
    
    
    //MARK: Outlet Connection
    @IBOutlet weak var locationMapView: MKMapView!
    
    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var placeOrderButton: UIButton!
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tab Bar
        self.tabBarController?.tabBar.isHidden = true
        
        //Table View
        orderTableView.dataSource = self
        orderTableView.delegate = self
        
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        
        //function call to map loaction confirmation
        mapLocationConfirmation()
        
        //function call for fetching data of orders
        callCartRecord()
    }
    
    //MARK: Map Function
    func mapLocationConfirmation() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: Did Update Loaction Function
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        locationMapView.setRegion(region, animated: true)
        
        //Annotation
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        locationName {(placeName) in
            annotation.title = placeName
        }
        
        locationMapView.addAnnotation(annotation)
    }
    
    //MARK: Current location function
    func locationName (handler: @escaping(String) -> Void) {
        
        let loc = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(loc, completionHandler: {(placeMark, error) -> Void in
            
            let place : CLPlacemark? = placeMark?[0]
            
            let address = "\(place?.subLocality ?? ""), \(place?.locality ?? ""), \(place?.postalCode ?? "")"
            
            handler(address)
        })
    }
    
    //MARK: Place Order Button Clicked Function
    @IBAction func placeOrderButtonClicked(_ sender: Any) {
        
        //Updating Cart Table for placed order
        DBOperations.dbOperationInstance().orderPlaced(userEmail: (Auth.auth().currentUser?.email)!)
        
        
        let localNotif = self.storyboard?.instantiateViewController(withIdentifier: "LocalNotificationViewController") as! LocalNotificationViewController
        self.navigationController?.pushViewController(localNotif, animated: true)
    }
}

extension LocationViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Function call for fetching cart data
    func callCartRecord() {
        
        orderItem = DBOperations.dbOperationInstance().fetchCartRecord(userEmail: (Auth.auth().currentUser?.email)!)!
        
        orderTableView.dataSource = self
        orderTableView.delegate = self
        orderTableView.reloadData()

    }

    //MARK: Number of rows in section function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orderItem.count
    }
    
    //MARK: Cell for each row function
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let order = orderTableView.dequeueReusableCell(withIdentifier: "order", for: indexPath) as! OrderTableViewCell
        
        order.itemName.text = orderItem[indexPath.row].product_name
        order.itemImage.image = UIImage(data: orderItem[indexPath.row].product_image!)
        
        return order
    }
    
    //MARK: Height of each row function
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150.0
    }
    
}
