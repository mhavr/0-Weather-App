//
//  ViewController.swift
//  WeatherApp
//
//  Created by Максим Гаврилюк on 03.05.2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        
        
        
        networkWeatherManager.fetchCurrentWeather(forCity: "Ufa")
    }

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
                        
    
        }
        
    }
    
    
    
    func updateInterfaceWith(weather: CurrentWeather) {
        self.cityLabel.text = weather.cityName
        self.temperatureLabel.text = weather.temperatureString
        self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
        self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        
        
    }
    
}

