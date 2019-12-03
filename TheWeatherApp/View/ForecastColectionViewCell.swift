//
//  ForecastColectionViewCell.swift
//  WeatherApp
//
//  Created by Tatenda Kabike on 2019/12/02.
//  Copyright © 2019 Tatenda Kabike. All rights reserved.
//

import UIKit
import moa


class ForecastColectionViewCell: UICollectionViewCell {
    
     var todayLabel = Controls.theLabel(title: "hjkhjkhj", fontSize: 15, fontType: Constants.montserrat_bold, fontColor: .blue)
     var imgWeatherImageView = Controls.theImageView(imageName: "clouds")
     var lblTemperature = Controls.theLabel(title: "", fontSize: 50, fontType: Constants.montserrat_regular, fontColor: .black)
     var lblTemperatureDegree = Controls.theLabel(title: "°C", fontSize: 30, fontType: Constants.montserrat_regular, fontColor: .black)
     var  lblWeatherDescription = Controls.theLabel(title: "", fontSize: 15, fontType: Constants.montserrat_regular, fontColor: .black)
    var forecastList: List? {
        
        didSet{
            
            
            guard let day = forecastList?.dt_txt else { return }
            guard let weatherData = forecastList?.weather else{ return }
            guard let img = weatherData[0].icon else { return }
            guard let wDesc = weatherData[0].description else { return }
            guard let curTemp = forecastList?.main?.temp else { return }
            
            //http://openweathermap.org/img/wn/10d@2x.png
            let imgUrl = "\(Constants.weather_img_url)\(img)@2x.png"
            
            print("WEATHER_IMAGE_URL: \(imgUrl)")
            
            makeDayLabel(text: Utils.convertDateDay(day))
            makeImageView(url: imgUrl)
            makeCellTemperetureLbl(text: "\(Int(curTemp))")
            makeTempDegreeLbl()
            makeWeatherDescription(text: wDesc)
//            guard let profileImageUrl = user?.profileImageUrl else {
//
//                profileImageView.backgroundColor = .purple
//                return}
//
//           profileImageView.loadImage(urlString: profileImageUrl)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .yellow
        self.layer.cornerRadius = 5
        addSubview(todayLabel)
        addSubview(imgWeatherImageView)
        addSubview(lblTemperature)
        addSubview(lblTemperatureDegree)
        addSubview(lblWeatherDescription)
        self.backgroundColor = #colorLiteral(red: 0.8457483053, green: 0.8407213092, blue: 0.8496129513, alpha: 0.9455532962)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Make day label
    func makeDayLabel(text: String){
        
        todayLabel.textColor = .black
        todayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        todayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2).isActive = true
        todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        todayLabel.textAlignment = .center
        
        todayLabel.text = text
    }
    
    
    //Make Weather Image
    func makeImageView(url: String){
        
     
               imgWeatherImageView.contentMode = .scaleAspectFit
               imgWeatherImageView.clipsToBounds = true
                imgWeatherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
                imgWeatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
                imgWeatherImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
                imgWeatherImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
                 imgWeatherImageView.moa.url = url
        
                
    }
    
     // MARK: - FORECAST TEMPERETURE LABEL
    public func makeCellTemperetureLbl(text: String){

            lblTemperature.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 8).isActive = true
            lblTemperature.centerXAnchor.constraint(equalTo: todayLabel.centerXAnchor).isActive = true
            lblTemperature.text = text
        }
    
    
     // MARK: - FORECAST TEMPERETURE DEGREE LABEL
        public func makeTempDegreeLbl(){
    
            
            lblTemperatureDegree.topAnchor.constraint(equalTo: lblTemperature.topAnchor, constant: -2).isActive = true
            lblTemperatureDegree.leadingAnchor.constraint(equalTo: lblTemperature.trailingAnchor, constant: 1).isActive = true
    
        }
    
    
     // MARK: - FORECAST WEATHER DESCRIPTION LABEL
    public func makeWeatherDescription(text: String){

        lblWeatherDescription.textAlignment = .center
        lblWeatherDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        lblWeatherDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        lblWeatherDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
            lblWeatherDescription.text = text
        
        }
    
    
    
    
    //Make weather img
//    public func makeWeatherImage(){
//
//           imgWeatherImageView = Controls.theImageView(imageName: "clouds")
//           imgWeatherImageView.contentMode = .scaleAspectFit
//           imgWeatherImageView.clipsToBounds = true
//           cellParentView.addSubview(imgWeatherImageView)
//
//            imgWeatherImageView.topAnchor.constraint(equalTo: cellParentView.topAnchor, constant: 8).isActive = true
//            imgWeatherImageView.trailingAnchor.constraint(equalTo: cellParentView.trailingAnchor, constant: 8).isActive = true
//            imgWeatherImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//            imgWeatherImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
//
//    //        imgWeatherImageView.moa.url = imageUrl
//
//
//        }
    
    
}













//class ForecastColectionViewCell: UICollectionViewCell{
//    var forecastDetails: List!
//
//    var lblForecastDay:UILabel!
//    var lblTemperature: UILabel!
//    var lblTemperatureDegree: UILabel!
//    var imgWeatherImageView: UIImageView!
//    var lblWeatherDescription: UILabel!
//    var cellParentView: UIView!
    
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setUpWeatherCell()
//
//    }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    func setUpWeatherCell(){
        
//        self.forecastDetails = forecast
//        makeCellParentView()
//        lblForecastDay = Controls.theLabel(title: "Tuesday", fontSize: 10, fontType: Constants.montserrat_bold, fontColor: .black)
//        cellParentView.addSubview(lblForecastDay)
//        lblForecastDay.topAnchor.constraint(equalTo: cellParentView.topAnchor, constant: 10).isActive = true
//        lblForecastDay.centerXAnchor.constraint(equalTo: cellParentView.centerXAnchor).isActive = true
       
        
//        guard let fDay = forecastDetails.dt else { return }
//        guard let fTemp = forecastDetails.main?.temp else{ return }
//        guard let fWeatherDetails = forecastDetails.weather else{ return }
//
//        let description = fWeatherDetails[0].description!
//        let fWeatherImage = fWeatherDetails[0].icon!
//        
//        makeCellParentView()
//        makeCellForecastDayLbl()
//        makeCellTemperetureLbl()
//        makeTempDegreeLbl()
//        makeWeatherImage()

//        makeCellForecastDayLbl(text: Utils.convertDate(timestamp: fDay))
//        makeCellTemperetureLbl(text: "\(Int(fTemp))")
//        makeWeatherDescription(text: description)
//        makeWeatherImage(imageUrl: "\(Constants.weather_img_url)/\(fWeatherImage)@2x.png")
        
//    }
    
    
    // MARK: - CELL PARENT VIEW  LABEL
//    public func makeCellParentView(){
//
//        cellParentView = Controls.theView()
//        cellParentView.backgroundColor = .yellow
//        addSubview(cellParentView)
//        cellParentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        cellParentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
//        cellParentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
//        cellParentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//
//    }
//
//
////     // MARK: - FORECAST DAY LABEL
//    public func makeCellForecastDayLbl(text: String){
//
//        lblForecastDay = Controls.theLabel(title: "Tuesday", fontSize: 10, fontType: Constants.montserrat_bold, fontColor: .black)
//         cellParentView.addSubview(lblForecastDay)
//        lblForecastDay.topAnchor.constraint(equalTo: cellParentView.topAnchor, constant: 10).isActive = true
//        lblForecastDay.centerXAnchor.constraint(equalTo: cellParentView.centerXAnchor).isActive = true
//        lblForecastDay.text = text
//
//    }

//     // MARK: - FORECAST TEMPERETURE LABEL
//    public func makeCellTemperetureLbl(){
//
//        lblTemperature = Controls.theLabel(title: "30", fontSize: 15, fontType: Constants.montserrat_regular, fontColor: .black)
//        cellParentView.addSubview(lblTemperature)
//        lblTemperature.topAnchor.constraint(equalTo: lblForecastDay.bottomAnchor, constant: 8).isActive = true
//        lblTemperature.centerXAnchor.constraint(equalTo: lblForecastDay.centerXAnchor).isActive = true
////        lblTemperature.text = text
//    }
//
//     // MARK: - FORECAST TEMPERETURE DEGREE LABEL
//    public func makeTempDegreeLbl(){
//
//        lblTemperatureDegree = Controls.theLabel(title: "°", fontSize: 10, fontType: Constants.montserrat_regular, fontColor: .black)
//        cellParentView.addSubview(lblTemperatureDegree)
//        lblTemperatureDegree.topAnchor.constraint(equalTo: lblTemperature.topAnchor, constant: -2).isActive = true
//        lblTemperatureDegree.leadingAnchor.constraint(equalTo: lblTemperature.leadingAnchor, constant: 1).isActive = true
//
//    }
//
//     // MARK: - FORECAST WEATHER DESCRIPTION LABEL
//    public func makeWeatherDescription(){
//
//        lblWeatherDescription = Controls.theLabel(title: "Partly Coudy", fontSize: 10, fontType: Constants.montserrat_regular, fontColor: .black)
//        cellParentView.addSubview(lblWeatherDescription)
//        lblWeatherDescription.bottomAnchor.constraint(equalTo: cellParentView.bottomAnchor, constant: 5).isActive = true
//        lblWeatherDescription.centerXAnchor.constraint(equalTo: cellParentView.centerXAnchor).isActive = true
////        lblWeatherDescription.text = text
//    }
//
//    public func makeWeatherImage(){
//
//       imgWeatherImageView = Controls.theImageView(imageName: "clouds")
//       imgWeatherImageView.contentMode = .scaleAspectFit
//       imgWeatherImageView.clipsToBounds = true
//       cellParentView.addSubview(imgWeatherImageView)
//
//        imgWeatherImageView.topAnchor.constraint(equalTo: cellParentView.topAnchor, constant: 8).isActive = true
//        imgWeatherImageView.trailingAnchor.constraint(equalTo: cellParentView.trailingAnchor, constant: 8).isActive = true
//        imgWeatherImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        imgWeatherImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
//
////        imgWeatherImageView.moa.url = imageUrl
//
//
//    }
    
    
//}
