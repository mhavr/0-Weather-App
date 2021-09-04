//
//  ViewController.swift
//  WeatherApp
//
//  Created by Максим Гаврилюк on 03.05.2021.
//

import UIKit

class ViewController: UIViewController {

    var currentCitySwipe:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        if let currentCitySwipe = currentCitySwipe {
        networkWeatherManager.fetchCurrentWeather(forCity: currentCitySwipe )
        }
    }
    @IBAction func listPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "cityName", sender: nil)
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
        DispatchQueue.main.async {
        
        self.cityLabel.text = weather.cityName
        self.temperatureLabel.text = weather.temperatureString
        self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
        self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    @IBAction func unWindSegueFor(unwindSegue:UIStoryboardSegue) { // - Func for UnWindSegue
    
    }
    
}

