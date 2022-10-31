//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by HYEONG SIK NAM on 2022/05/11.
//

import UIKit
import Lottie

class CardDetailViewController: UIViewController {
    
    var promotionDetail: PromotionDetail?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let animationView = AnimationView(name: "money")
        
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let promotionDetail = promotionDetail else { return }
        
        titleLabel.text = """
\(promotionDetail.companyName)카드를 쓰면
\(promotionDetail.amount)만원을 드려요
"""
        periodLabel.text = promotionDetail.period
        conditionLabel.text = promotionDetail.condition
        benefitConditionLabel.text = promotionDetail.benefitCondition
        benefitDetailLabel.text = promotionDetail.benefitDetail
        benefitDateLabel.text = promotionDetail.benefitDate
    }
}
