//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/11/30.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import UIKit
import CoreLocation
import moa

class HomeViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var lt = 0.0
    var ln = 0.0

    var locationManager = CLLocationManager()
    var currentDateLabel: UILabel!
    var currentLocationLbl: UILabel!
    var tempDegreeLabel: UILabel!
    var currentTempLabel: UILabel!
    var weatherDescLbl: UILabel!
    var backgroundImageView: UIImageView!
    var weatherImageView: UIImageView!
    var parentView:UIView!
    var bottomSheet:UIView!
    var collectionViewParent: UIView!
    var vLine: UIView!
    var forecastDays = [List]()
    var fiveDayForecastList = [List]()
    var favouriteBtn: UIButton!
    var mapBtn: UIButton!
    var likeImg: UIImageView!
    var collectionViewViewHeight: CGFloat!
    var viewH: CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.isUserInteractionEnabled = true
        
        self.navigationController?.isNavigationBarHidden = false
        
       
        makeImageBG()
        makeCurrentDateLabel()
        makeCurrentLocationLbl()
        makeWeatherImage()
        makeTempDegreeLabel()
        makeCurrentTempLabel()
        makeWeatherDescLbl()
        makeBottomSheet()
        makeCollectionViewParentView()
        makeFavBtn()
       
       collectionViewParent.addSubview(wcollectionView)
        wcollectionView.delegate = self
        wcollectionView.dataSource = self
       setupCollectionConstraints()
       wcollectionView.register(UICollectionViewCell.self,
       forCellWithReuseIdentifier: cellId)
      
         makeVLine()
         makeFavouriteBtn()
         makeMapBtn()
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    
    }
    
    let wcollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        cv.register(ForecastColectionViewCell.self, forCellWithReuseIdentifier: "cell")
           return cv
       }()
    
    func setupCollectionConstraints() {
       
        wcollectionView.translatesAutoresizingMaskIntoConstraints = false
        wcollectionView.topAnchor.constraint(equalTo: collectionViewParent.topAnchor, constant: 0).isActive = true
        wcollectionView.bottomAnchor.constraint(equalTo: collectionViewParent.bottomAnchor, constant: 0).isActive = true
        wcollectionView.leftAnchor.constraint(equalTo: collectionViewParent.leftAnchor).isActive = true
        wcollectionView.rightAnchor.constraint(equalTo: collectionViewParent.rightAnchor).isActive = true
    }
    
    
    
    // MARK: - BACKGROUND IMAGE VIEW
    private func makeImageBG(){
        
//        backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView = Controls.theImageView(imageName: "sunny_bg")
        backgroundImageView.contentMode = .center
        backgroundImageView.clipsToBounds = true
        view.addSubview(backgroundImageView)
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    // MARK: - CURRENT DATE LABEL
    private func makeCurrentDateLabel(){
        
        currentDateLabel = Controls.theLabel(title: "", fontSize: 18, fontType: Constants.montserrat_bold, fontColor: .black)
        view.addSubview(currentDateLabel)
        
        currentDateLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 100).isActive = true
        currentDateLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 30).isActive = true
    }
    
    
    // MARK: - CURRENT LOCATION LABEL
    private func makeCurrentLocationLbl(){
        
        currentLocationLbl = Controls.theLabel(title: "Harare", fontSize: 17, fontType: Constants.montserrat_regular, fontColor: .black)
        backgroundImageView.addSubview(currentLocationLbl)
        
        currentLocationLbl.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 8).isActive = true
        currentLocationLbl.leadingAnchor.constraint(equalTo: currentDateLabel.leadingAnchor, constant: 0).isActive = true
        
        
    }
    
    
    // MARK: - TEMPERETURE LABEL
    private func makeTempDegreeLabel(){
        
        tempDegreeLabel = Controls.theLabel(title: "°C", fontSize: 20, fontType: Constants.montserrat_bold, fontColor: .black)
        
        backgroundImageView.addSubview(tempDegreeLabel)
        tempDegreeLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 5).isActive = true
        tempDegreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
     // MARK: - TEMPERETURE LABEL
    private func makeCurrentTempLabel(){
        
        currentTempLabel = Controls.theLabel(title: "40", fontSize: 50, fontType: Constants.montserrat_bold, fontColor: .black)
        backgroundImageView.addSubview(currentTempLabel)
        
        currentTempLabel.trailingAnchor.constraint(equalTo: tempDegreeLabel.leadingAnchor, constant: -1).isActive = true
        currentTempLabel.topAnchor.constraint(equalTo: tempDegreeLabel.topAnchor, constant: 0).isActive = true
    }
    
    // MARK: - WEATHER IMAGEVIEW
    private func makeWeatherImage(){
        
        weatherImageView = Controls.theImageView(imageName: "clouds")
        backgroundImageView.addSubview(weatherImageView)
        
        weatherImageView.topAnchor.constraint(equalTo: currentLocationLbl.bottomAnchor, constant: 0).isActive = true
        weatherImageView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -15).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    // MARK: - WEATHER DESCRIPTION
    private func makeWeatherDescLbl(){
        
        weatherDescLbl = Controls.theLabel(title: "Partly Cloudy", fontSize: 16, fontType: Constants.montserrat_semiBold, fontColor: .black)
        backgroundImageView.addSubview(weatherDescLbl)
        weatherDescLbl.topAnchor.constraint(equalTo: currentTempLabel.bottomAnchor, constant: 8).isActive = true
        weatherDescLbl.trailingAnchor.constraint(equalTo: tempDegreeLabel.trailingAnchor, constant: 0).isActive = true
    }
    
    // MARK: - MAKE BOTTOM SHEET
    private func makeBottomSheet(){
        
        viewH = Utils.screenHeight() * (0.3)
        bottomSheet = Controls.theView()
        backgroundImageView.addSubview(bottomSheet)
        bottomSheet.backgroundColor = .white
        bottomSheet.heightAnchor.constraint(equalToConstant: viewH).isActive = true
        bottomSheet.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 0).isActive = true
        bottomSheet.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 0).isActive = true

        bottomSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8.0).isActive = true
 
    }
    
    // MARK: - MAKE COLLECTIONVIEW PARENT VIEW
    private func makeCollectionViewParentView(){
    
        collectionViewViewHeight = viewH * (0.5)
       
        collectionViewParent = Controls.theView()
        collectionViewParent.backgroundColor = .lightGray
        print("COLLECTION VIEW HEIGHT: \(collectionViewViewHeight!)")
        
        bottomSheet.addSubview(collectionViewParent)
        
        collectionViewParent.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 5).isActive = true
        collectionViewParent.leftAnchor.constraint(equalTo: bottomSheet.leftAnchor, constant: 1).isActive = true
        collectionViewParent.rightAnchor.constraint(equalTo: bottomSheet.rightAnchor, constant: 1).isActive = true
        collectionViewParent.heightAnchor.constraint(equalToConstant: collectionViewViewHeight).isActive = true
        
    }
    
    // MARK: - MAKE VLINE
    public func makeVLine(){
        vLine = Controls.theView()
        bottomSheet.addSubview(vLine)
        vLine.backgroundColor = .lightGray
        vLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        vLine.topAnchor.constraint(equalTo: collectionViewParent.bottomAnchor, constant: 3).isActive = true
        vLine.heightAnchor.constraint(equalToConstant: 60).isActive = true
        vLine.centerXAnchor.constraint(equalTo: bottomSheet.centerXAnchor).isActive = true
    }
    
    

    
     // MARK: - MAKE UIBUTTON PARENT VIEW
    func makeFavouriteBtn(){
        
        
        favouriteBtn = Controls.theButton(title: "Favourites")
        bottomSheet.addSubview(favouriteBtn)
        favouriteBtn.setTitleColor(.black, for: .normal)
        favouriteBtn.centerYAnchor.constraint(equalTo: vLine.centerYAnchor).isActive = true
        favouriteBtn.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 3).isActive = true
        favouriteBtn.trailingAnchor.constraint(equalTo: vLine.leadingAnchor, constant: -3).isActive = true
        favouriteBtn.isUserInteractionEnabled = true
        favouriteBtn.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
    }
    @objc func didButtonClick(_ sender: UIButton) {
        // your code goes here
        print("Working........")
    }
    
    // MARK: - MAKE MAP UIBUTTON PARENT VIEW
       func makeMapBtn(){
        
           mapBtn = Controls.theButton(title: "Map")
           bottomSheet.addSubview(mapBtn)
           mapBtn.setTitleColor(.black, for: .normal)
           mapBtn.centerYAnchor.constraint(equalTo: vLine.centerYAnchor).isActive = true
           mapBtn.leadingAnchor.constraint(equalTo: vLine.trailingAnchor, constant: 3).isActive = true
           mapBtn.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -3).isActive = true
            mapBtn.isUserInteractionEnabled = true
            mapBtn.addTarget(self, action: #selector(mapClick), for: .touchUpInside)
       }
    
        @objc func mapClick()
        {
            print("Tapped on Image")
            let mapViewController = MapViewController()
            mapViewController.lat = lt
            mapViewController.lon = ln
            self.navigationController?.pushViewController(mapViewController, animated: true)
        }
    
    
    
     // MARK: - MAKE LIKE BUTTON
    func makeFavBtn(){
        
        likeImg = Controls.theImageView(imageName: "like")
        backgroundImageView.addSubview(likeImg)
        likeImg.topAnchor.constraint(equalTo: currentDateLabel.topAnchor, constant: 10).isActive = true
        likeImg.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -10).isActive = true
        likeImg.widthAnchor.constraint(equalToConstant: 25).isActive = true
        likeImg.heightAnchor.constraint(equalToConstant: 25).isActive = true
        likeImg.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.favClick))
        likeImg.addGestureRecognizer(tap)

    }
    
    @objc func favClick()
    {
        print("Tapped on Image")
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               
        
        print("TABLE DATA COUNT: \(fiveDayForecastList.count)")
        
        return fiveDayForecastList.count
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ForecastColectionViewCell
                
                let rowData = fiveDayForecastList[indexPath.row]
                print("ROW DATA \(indexPath.row)")
        
                cell.forecastList = rowData
    

                return cell
            }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

               return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height-6)
           }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          
          return 4
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           
           return 4
       }
    
    

    private func getCurrentWeather(lat: Float, lon: Float, appId: String){
        
        let currentWeatherURL = Constants.base_url + "/weather?lat=\(lat)&lon=\(lon)&units=metric&appid=\(appId)"
        
        GenericRest.getDataFromNetwork(urlString: currentWeatherURL) { (response: CurrentWeather?, error) in
            
            
            if error != nil {
                
                print("Error: \(error.debugDescription)")

            }else{
                
                 print(response!.toJSONString(prettyPrint: true)!)
                
                print("Weather Details: \(response!.weather!)")
                
                guard let weatherDetails = response?.weather else{
                    return
                }
                
                var weatherDesc = ""
                for currentWeatherDetails in weatherDetails {
                    
                    weatherDesc = currentWeatherDetails.weatherDescription!
                }
                
                self.weatherDescLbl.text = weatherDesc
                guard let currentTemp = response?.main?.temp else{ return }
              
                
                self.currentTempLabel.text = "\(Int(currentTemp))"
                
                print("TEMP:  \(response!.main!.temp!)")
                
                print("TIME: \(Utils.convertDate(timestamp: response!.dt!))")
                
                self.currentDateLabel.text = Utils.convertDate(timestamp: response!.dt!)
                
            }
        }
    }
    
    fileprivate func getWeatherForecast(lat: Float, lon: Float, appId: String){
        
         let forecastWeatherURL = Constants.base_url + "/forecast?lat=\(lat)&lon=\(lon)&units=metric&appid=\(appId)"
        
        GenericRest.getDataFromNetwork(urlString: forecastWeatherURL) { (response: WeatherForecast?, error) in
                   
                   
                   if error != nil {
                       
                       print("Error: \(error.debugDescription)")

                   }else{
                       
                   print(response!.toJSONString(prettyPrint: true)!)
                    
                    var previousDate = ""
                    for list in response!.list!{
                        
                        let currentDate = String(list.dt_txt!.prefix(10))
                        
                        if currentDate != previousDate {
                            
                            self.forecastDays.append(list)
                    
                        }
                        
                        previousDate = currentDate
                        
                        print("FORECAST_DAYS: \(list.dt_txt!.prefix(10))")
                    }
                    
                    for days in self.forecastDays {
                        
                        print("Days: \(Utils.convertDateDay(days.dt_txt!))")
                        self.fiveDayForecastList.append(days)
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.wcollectionView.reloadData()
                    }
                   }
               }
        
              
        
    }

}

extension HomeViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        let location: CLLocation = locations.last!
    
        guard let location = locations.last else{
            
            print("Failed to get the last location")
            return
        }
        
        print("Latitude: \(location.coordinate.latitude) ,  Longitude : \(location.coordinate.longitude)")
        
       
     
        
        manager.stopUpdatingLocation()
         
        lt = location.coordinate.latitude
        ln = location.coordinate.longitude
        
       let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks, _) in

            placemarks?.forEach { (placemark) in

                if let city = placemark.locality, let country = placemark.country {
                    
                    print("My City Is: \(city)")
                    print("My Country Is: \(country)")
                    
                    self.currentLocationLbl.text = "\(city), \(country)"
                    
                }

            }
            
            
        }
        
        getCurrentWeather(lat: Float(location.coordinate.latitude), lon: Float(location.coordinate.longitude), appId: Constants.weather_api_key)
        
        getWeatherForecast(lat: Float(location.coordinate.latitude), lon: Float(location.coordinate.longitude), appId: Constants.weather_api_key)
    
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .restricted:
          print("Location access was restricted")
        case .denied:
          print("User denied access to location")
        case .notDetermined:
          print("Location status not determined")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
          print("Location status is OK")
        @unknown default:
          fatalError()
        }
    }
    
    // Handle location manager errors.
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       locationManager.stopUpdatingLocation()
       print("Error: \(error)")
     }
    
    
}

extension UIView{
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.bottomAnchor
      }
      return self.bottomAnchor
    }
}










