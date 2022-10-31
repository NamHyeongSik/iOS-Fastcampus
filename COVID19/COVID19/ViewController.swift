//
//  ViewController.swift
//  COVID19
//
//  Created by HYEONG SIK NAM on 2022/05/09.
//

import UIKit
import Charts
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    
    @IBOutlet weak var pieChartsView: PieChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicatorView.startAnimating()
        self.fetchCovidOverview { [weak self] result in
            guard let self = self else { return }
            self.indicatorView.stopAnimating()
            self.indicatorView.isHidden = true
            self.labelStackView.isHidden = false
            self.pieChartsView.isHidden = false
            switch result {
            case let .success(result):
                //alamofire는 main스레드에서 실행되기 때문에 굳이 dispatchQueue안해줘도 됨
                self.configureStackView(koreaCoivdOverview: result.korea)
                
                let covidOverviewList = self.makeCovidOvierviewList(cityCovidOverview: result)
                self.configureChartView(covidOverviewList: covidOverviewList)
    
            case let .failure(error):
                debugPrint("failure \(error)")
            }
        }
    }
    
    private func configureStackView(koreaCoivdOverview: CovidOverview) {
        self.totalCaseLabel.text = "\(koreaCoivdOverview.totalCase) 명"
        self.newCaseLabel.text = "\(koreaCoivdOverview.newCase) 명"
    }
    
    private func makeCovidOvierviewList(cityCovidOverview: CityCovidOverview) -> [CovidOverview] {
        return [
            cityCovidOverview.seoul,
            cityCovidOverview.busan,
            cityCovidOverview.incheon,
            cityCovidOverview.gwangju,
            cityCovidOverview.daejeon,
            cityCovidOverview.ulsan,
            cityCovidOverview.gangwon,
            cityCovidOverview.chungbuk,
            cityCovidOverview.chungnam,
            cityCovidOverview.jeonbuk,
            cityCovidOverview.jeonnam,
            cityCovidOverview.gyeongbuk,
            cityCovidOverview.gyeongnam,
            cityCovidOverview.jeju,
        ]
    }
    
    func configureChartView(covidOverviewList: [CovidOverview]) {
        self.pieChartsView.delegate = self
        
        let entries = covidOverviewList.compactMap { [weak self] overview -> PieChartDataEntry? in
            guard let self = self else { return nil }
            return PieChartDataEntry(value: self.removeFormatString(string: overview.newCase), label: overview.countryName, data: overview)
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        
        dataSet.valueTextColor = .black
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3
        dataSet.colors = ChartColorTemplates.vordiplom() + ChartColorTemplates.joyful() + ChartColorTemplates.liberty() + ChartColorTemplates.pastel() + ChartColorTemplates.material()
        
        self.pieChartsView.data = PieChartData(dataSet: dataSet)
        
    }
    
    func removeFormatString(string: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    private func fetchCovidOverview(completion: @escaping (Result<CityCovidOverview, Error>) -> Void) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "qBCaNhMk3DHyLuK1fG5V9QOjiAzn7I6cX"
        ]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                    }
                    
                case let .failure(error):
                    completion(.failure(error))
                }
            })
    }


}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let covidDetailVC = UIStoryboard(name: "CovidDetailTableViewController", bundle: nil).instantiateViewController(withIdentifier: "CovidDetailTableViewController") as? CovidDetailTableViewController else { return }
        
        guard let covidOverview = entry.data as? CovidOverview else { return }
        
        covidDetailVC.covidOverview = covidOverview
        self.navigationController?.pushViewController(covidDetailVC, animated: true)
    }
}
