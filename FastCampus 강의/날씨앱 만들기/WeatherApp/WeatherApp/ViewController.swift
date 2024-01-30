//
//  ViewController.swift
//  WeatherApp
//
//  Created by ryu hyunsun on 2023/12/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var citynameTextField: UITextField!
    @IBOutlet weak var citynameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherStackView: UIStackView!
    
    
    @IBAction func tapFetchWeatherButton(_ sender: Any) {
        if let cityName = citynameTextField.text {
            getCurrentWeather(cityName: cityName)
            view.endEditing(true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=9b18bcb2554f31b8b56b86e1a3eb5dda") else { return }
        let session = URLSession(configuration: .default)
        // 서버로부터 데이터 요청
        // 데이터 Task가 api를 호출하고, 서버에서 응답이 오면, completion handler 클로저가 호출됨.
        session.dataTask(with: url) { [weak self] data, response, error in
            let successRange = (200...299)
            
            guard let data = data, error == nil else { return }
            // JSONDecoder는 json 객체에서 -> 데이터 유형의 인스턴스로 디코딩하는 객체
            // 한마디로 Decodable 또는 Codable 프로토콜을 준수하는 사용자 정의 타입으로 변환시켜 줌.
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else { return }
                // 네트워크 작업은 별도의 쓰레드에서 진행되고, 응답이 온다고 해도 자동으로 메인 쓰레드로 돌아오지 않음. 따라서 completion handler에서 UI 작업을 한다면 main 쓰레드에서 작업할 수 있도록 만들어줘야함.
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInformation: weatherInformation)
                }
            }
            else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                
                
                DispatchQueue.main.async {
                    self?.citynameTextField.text = ""
                    self?.weatherStackView.isHidden = true
                    self?.showAlert(message: errorMessage.message)
                }
            }
            
            
        }.resume()
        // .resume -> 작업을 실행.
    }
    
    func configureView(weatherInformation: WeatherInformation) {
        citynameLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first {
            weatherDescriptionLabel.text = weather.description
        }
        tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))°C"
        minTempLabel.text = "최저 \(Int(weatherInformation.temp.minTemp - 273.15))°C"
        maxTempLabel.text = "최고 \(Int(weatherInformation.temp.maxTemp - 273.15))°C"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

