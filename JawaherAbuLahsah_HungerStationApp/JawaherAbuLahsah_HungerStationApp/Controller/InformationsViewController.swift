//
//  InformationsViewController.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/05/1443 AH.
//

import Foundation
import UIKit
import MapKit
class InformationsViewController:UIViewController, UIGestureRecognizerDelegate{
    
    
    var mapView:MKMapView!
    var hamburgerMenuInfo = ""
    
    override func viewDidLoad() {
        
        if hamburgerMenuInfo == "Information about app" {
            let titlePage = UILabel()
            titlePage.text = hamburgerMenuInfo
            titlePage.font = UIFont(name:"Palatino" , size: 25)
            titlePage.textAlignment = .center
            view.addSubview(titlePage)
            titlePage.translatesAutoresizingMaskIntoConstraints = false
            let margins = view.layoutMarginsGuide
            let topConstrainttitlePage = titlePage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 55)
            let leadingConstrainttitlePage = titlePage.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
            let trailingConstrainttitlePage = titlePage.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
            
            topConstrainttitlePage.isActive = true
            leadingConstrainttitlePage.isActive = true
            trailingConstrainttitlePage.isActive = true
            
            
            
            let infoLabel = UILabel()
            infoLabel.text = "Hello, An application to order food from restaurants, in this application you will find many restaurants that you can choose from and order, an application that you use when you are hungry and not when you are bored, beware of obesity 😋 "
            infoLabel.numberOfLines = 0
            infoLabel.textAlignment = .center
            infoLabel.font = UIFont(name:"Palatino" , size: 20)
            view.addSubview(infoLabel)
            infoLabel.translatesAutoresizingMaskIntoConstraints = false
            let topConstraintinfoLabel = infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 120)
            let leadingConstraintinfoLabel = infoLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
            let trailingConstraintinfoLabel = infoLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
            topConstraintinfoLabel.isActive = true
            leadingConstraintinfoLabel.isActive = true
            trailingConstraintinfoLabel.isActive = true
            
        }else if hamburgerMenuInfo == "Map"{
            mapView = MKMapView()
            view = mapView
            let removeButton = UIButton()
            removeButton.setTitle("remove point", for: .normal)
            removeButton.backgroundColor = .systemBlue
            removeButton.tag = 1
            view.addSubview(removeButton)
            removeButton.translatesAutoresizingMaskIntoConstraints = false
            let margins = view.layoutMarginsGuide
            removeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
            removeButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 60).isActive = true
            removeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor,constant: -60).isActive = true
            let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleLongPress(_:)))
            gestureRecognizer.delegate = self
            mapView.addGestureRecognizer(gestureRecognizer)
            removeButton.addTarget(self, action: #selector(removeAnnotation(_:)), for: .allTouchEvents)
        }else{
            let PersonaInfoLabel = UILabel()
            PersonaInfoLabel.text = "𝕵𝕬𝖂𝕬𝕳𝕰𝕽"
            PersonaInfoLabel.textAlignment = .center
            view.addSubview(PersonaInfoLabel)
            let margins = view.layoutMarginsGuide
            PersonaInfoLabel.translatesAutoresizingMaskIntoConstraints = false
            PersonaInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 120).isActive = true
            PersonaInfoLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            PersonaInfoLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            let PersonaStoryLabel = UILabel()
            PersonaStoryLabel.text = "I'm a software developer 👩🏻‍💻"
            PersonaStoryLabel.numberOfLines = 0
            PersonaStoryLabel.textAlignment = .center
            view.addSubview(PersonaStoryLabel)
            PersonaStoryLabel.translatesAutoresizingMaskIntoConstraints = false
            PersonaStoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150).isActive = true
            PersonaStoryLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            PersonaStoryLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            
        }
    }
    
    @objc func handleLongPress(_ gestureRecognizer : UIGestureRecognizer){
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    @objc func removeAnnotation(_ sender: UIButton) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            let annotations = mapView.annotations.filter({ !($0 is MKUserLocation) })
            mapView.removeAnnotations(annotations)
        }
    }
}

