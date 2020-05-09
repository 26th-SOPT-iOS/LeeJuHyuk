//
//  TableViewContorller.swift
//  SOPT26_3rd_Seminar
//
//  Created by 이주혁 on 2020/05/09.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class TableViewContorller: UIViewController {

    @IBOutlet var weatherTableView: UITableView!
    private var dateInformations: [DateInformation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setDateInformation()
        self.weatherTableView.delegate = self
        self.weatherTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func setDateInformation(){
        let date1 = DateInformation(weather: .snowy, date: "1월 1일", subTitle: "신정")
        let date2 = DateInformation(weather: .sunny, date: "2월 16일", subTitle: "설날")
        let date3 = DateInformation(weather: .rainny, date: "3월 1일", subTitle: "삼일절")
        let date4 = DateInformation(weather: .sunny, date: "5월 5일", subTitle: "어린이날")
        let date5 = DateInformation(weather: .cloudy, date: "5월 22일", subTitle: "석가탄신일")
        let date6 = DateInformation(weather: .cloudy, date: "6월 6일", subTitle: "현충일")
        let date7 = DateInformation(weather: .rainny, date: "8월 15일", subTitle: "광복절")
        let date8 = DateInformation(weather: .sunny, date: "9월 24일", subTitle: "추석")
        let date9 = DateInformation(weather: .rainny, date: "10월 3일", subTitle: "개천절")
        let date10 = DateInformation(weather: .cloudy, date: "10월 9일", subTitle: "한글날")
        let date11 = DateInformation(weather: .snowy, date: "12월 26일", subTitle: "성탄절")
        dateInformations = [date1, date2, date3, date4, date5, date6, date7, date8, date9, date10, date11]
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TableViewContorller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = self.storyboard?.instantiateViewController(identifier:
            
            "DetailViewController") as? DetailViewController else { return }
        
        detailViewController.imageName = dateInformations[indexPath.row].weather.getImageName()
        detailViewController.date = dateInformations[indexPath.row].date
        detailViewController.subTitle = dateInformations[indexPath.row].subTitle
        self.present(detailViewController, animated: true, completion: nil)
    }
}

extension TableViewContorller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherCell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier,
                                                              for: indexPath) as? WeatherCell else {
                return UITableViewCell()
                
        }
        weatherCell.setDateInformation(weatherImageName:
            dateInformations[indexPath.row].weather.getImageName(),
                                       date: dateInformations[indexPath.row].date,
                                       subTitle: dateInformations[indexPath.row].subTitle)
        
        return weatherCell
    }
    
    
}
