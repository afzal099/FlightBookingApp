//
//  MapsViewController.swift
//  FlightBookingApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 22/10/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController  {
    
    @IBOutlet weak var mapView: MKMapView!
    var datasource: Schedule!
    
    // This method calculates maprect from coordinates
    func makeRect(coordinates:[CLLocationCoordinate2D]) -> MKMapRect {
        var rect = MKMapRect()
        var coordinates = coordinates
        if !coordinates.isEmpty {
            let first = coordinates.removeFirst()
            var top = first.latitude
            var bottom = first.latitude
            var left = first.longitude
            var right = first.longitude
            coordinates.forEach { coordinate in
                top = max(top, coordinate.latitude)
                bottom = min(bottom, coordinate.latitude)
                left = min(left, coordinate.longitude)
                right = max(right, coordinate.longitude)
            }
            let topLeft = MKMapPoint(CLLocationCoordinate2D(latitude:top, longitude:left))
            let bottomRight = MKMapPoint(CLLocationCoordinate2D(latitude:bottom, longitude:right))
            rect = MKMapRect(x:topLeft.x, y:topLeft.y,
                             width:bottomRight.x - topLeft.x, height:bottomRight.y - topLeft.y)
        }
        return rect
    }
    
    // This method draws geodesic polyline
    func drawGeodesic() {
        if let flights = self.datasource.flights {
            var coordinatesArray = [CLLocationCoordinate2D]()
            for flight in flights {
                guard let sourceLocation = flight.departure?.airportCoordinates() else {
                    break
                }
                guard let destinationLocation = flight.arrival?.airportCoordinates() else {
                    break
                }
                var coordinates = [sourceLocation.coordinate,destinationLocation.coordinate]
                let geodesicPolyline = MKGeodesicPolyline(coordinates: &coordinates, count: 2)
                mapView.addOverlay(geodesicPolyline)
                coordinatesArray.append(sourceLocation.coordinate)
                coordinatesArray.append(destinationLocation.coordinate)
            }
            mapView.setVisibleMapRect(self.makeRect(coordinates: coordinatesArray), edgePadding: UIEdgeInsets.init(top: 75.0, left: 75.0, bottom: 75.0, right: 75.0), animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        self.mapView.delegate = self
        self.drawGeodesic()
    }
    
}


extension MapsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer()
        }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.lineWidth = 3.0
        renderer.alpha = 0.5
        renderer.strokeColor = UIColor.blue
        
        return renderer
    }
    
}
