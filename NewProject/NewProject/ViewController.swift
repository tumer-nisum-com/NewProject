//
//  ViewController.swift
//  NewProject
//
//  Created by Tabish Umer Farooqui on 18/07/2017.
//  Copyright © 2017 Nisum Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let segmentBottomBorder = CALayer()
    var totalCount: Double = 0.00
    
    var actualDepositValue: Double = 0.00
    var varianceValue: Double = 0.00
    var depositExpectedValue: Double = 0.00
    
    let labelTextColor = UIColor(red: 29.0/255.0, green: 129.0/255.0, blue: 191.0/255.0, alpha: 1.0)
    var calculatorViewPositioning = CGAffineTransform(translationX: 0, y: 0)
    var isNumberPadOn = false
    
    var selectedTextField : UITextField!
    var selectedLabel: UILabel!
    var textFields: [UITextField] = [UITextField]()
    var labels: [UILabel] = [UILabel]()
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var dataEntryView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //TotalView Outlets
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var actualCashDepositLabel: UILabel!
    @IBOutlet weak var actualCashDepositTextField: UITextField!
    
    //CoinsEntryView Outlets
    @IBOutlet weak var coinsEntryView: UIView!
    @IBOutlet weak var label1Cent: UILabel!
    @IBOutlet weak var Cent1TextField: UITextField!
    @IBOutlet weak var label5Cent: UILabel!
    @IBOutlet weak var Cent5TextField: UITextField!
    @IBOutlet weak var label10Cent: UILabel!
    @IBOutlet weak var Cent10TextField: UITextField!
    @IBOutlet weak var label25Cent: UILabel!
    @IBOutlet weak var Cent25TextField: UITextField!
    @IBOutlet weak var label50Cent: UILabel!
    @IBOutlet weak var Cent50TextField: UITextField!
    @IBOutlet weak var label1Dollar: UILabel!
    @IBOutlet weak var dollar1TextField: UITextField!
    @IBOutlet weak var penniesLabel: UILabel!
    @IBOutlet weak var penniesTextField: UITextField!
    @IBOutlet weak var nickelsLabel: UILabel!
    @IBOutlet weak var nickelsTextField: UITextField!
    @IBOutlet weak var dimesLabel: UILabel!
    @IBOutlet weak var dimesTextField: UITextField!
    @IBOutlet weak var quartersLabel: UILabel!
    @IBOutlet weak var quartersTextField: UITextField!
    @IBOutlet weak var bill1DollarLabel: UILabel!
    @IBOutlet weak var bill1DollarTextField: UITextField!
    @IBOutlet weak var bill2DollarLabel: UILabel!
    @IBOutlet weak var bill2DollarTextField: UITextField!
    @IBOutlet weak var bill5DollarLabel: UILabel!
    @IBOutlet weak var bill5DollarTextField: UITextField!
    @IBOutlet weak var bill10DollarLabel: UILabel!
    @IBOutlet weak var bill10DollarTextField: UITextField!
    @IBOutlet weak var bill20DollarLabel: UILabel!
    @IBOutlet weak var bill20DollarTextField: UITextField!
    @IBOutlet weak var bill50DollarLabel: UILabel!
    @IBOutlet weak var bill50DollarTextField: UITextField!
    @IBOutlet weak var bill100DollarLabel: UILabel!
    @IBOutlet weak var bill100DollarTextField: UITextField!
    
    //CalculationsView Outlets
    @IBOutlet weak var calculationsView: UIView!
    @IBOutlet weak var depositExpectedLabel: UILabel!
    @IBOutlet weak var varianceLabel: UILabel!
    @IBOutlet weak var actualDepositLabel: UILabel!
    
    //DepositView Outlets
    @IBOutlet weak var depositView: UIView!
    
    //CalculatorView Outlets
    @IBOutlet weak var calculatorView: UIView!
    @IBOutlet weak var number1Button: UIButton!
    @IBOutlet weak var number2Button: UIButton!
    @IBOutlet weak var number3Button: UIButton!
    @IBOutlet weak var number4Button: UIButton!
    @IBOutlet weak var number5Button: UIButton!
    @IBOutlet weak var number6Button: UIButton!
    @IBOutlet weak var number7Button: UIButton!
    @IBOutlet weak var number8Button: UIButton!
    @IBOutlet weak var number9Button: UIButton!
    @IBOutlet weak var number00Button: UIButton!
    @IBOutlet weak var number0Button: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Four views will be used
        // DataEntryView----CalculationView----DepositView----CalculatorView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        navigationBar.topItem?.title = "Count Cash Deposit"
        
        number1Button.layer.borderWidth = 0.5
        number1Button.layer.borderColor = UIColor.lightGray.cgColor

        number2Button.layer.borderWidth = 0.5
        number2Button.layer.borderColor = UIColor.lightGray.cgColor

        number3Button.layer.borderWidth = 0.5
        number3Button.layer.borderColor = UIColor.lightGray.cgColor

        number4Button.layer.borderWidth = 0.5
        number4Button.layer.borderColor = UIColor.lightGray.cgColor

        number5Button.layer.borderWidth = 0.5
        number5Button.layer.borderColor = UIColor.lightGray.cgColor

        number6Button.layer.borderWidth = 0.5
        number6Button.layer.borderColor = UIColor.lightGray.cgColor

        number7Button.layer.borderWidth = 0.5
        number7Button.layer.borderColor = UIColor.lightGray.cgColor

        number8Button.layer.borderWidth = 0.5
        number8Button.layer.borderColor = UIColor.lightGray.cgColor
        
        number9Button.layer.borderWidth = 0.5
        number9Button.layer.borderColor = UIColor.lightGray.cgColor
        
        number00Button.layer.borderWidth = 0.5
        number00Button.layer.borderColor = UIColor.lightGray.cgColor
        
        number0Button.layer.borderWidth = 0.5
        number0Button.layer.borderColor = UIColor.lightGray.cgColor
        
        deleteButton.layer.borderWidth = 0.5
        deleteButton.layer.borderColor = UIColor.lightGray.cgColor

        self.segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray], for: UIControlState.normal)
        self.segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: UIControlState.selected)
        
        self.segmentedControlDidChange(segmentedControl)
        
        highlightSelectedSegment()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func segmentedControlDidChange(_ sender: Any) {
        actualDepositLabel.text = "-"
        varianceLabel.textColor = UIColor.red
        varianceLabel.text = "-$0.40"
        depositExpectedLabel.text = "$0.40"

        switch segmentedControl.selectedSegmentIndex
        {
        case 0:// Toal View is Visible
            actualCashDepositTextField.text = ""
            self.totalView.isHidden = false
            self.coinsEntryView.isHidden = true
            self.backButton.isHidden = true
            self.forwardButton.isHidden = true
            
            self.labels = self.totalView.subviews.filter({ (view) -> Bool in
                return view.isKind(of: UILabel.self)
            }) as! [UILabel]

            self.textFields = self.totalView.subviews.filter({ (view) -> Bool in
                return view.isKind(of: UITextField.self)
            }) as! [UITextField]

        case 1:// Denominations View is Visible
            actualCashDepositTextField.text = ""
            self.totalView.isHidden = true
            self.coinsEntryView.isHidden = false
            self.backButton.isHidden = false
            self.forwardButton.isHidden = false
            
            self.labels = self.coinsEntryView.subviews.filter({ (view) -> Bool in
                return view.isKind(of: UILabel.self)
            }) as! [UILabel]
            
            self.textFields = self.coinsEntryView.subviews.filter({ (view) -> Bool in
                return view.isKind(of: UITextField.self)
            }) as! [UITextField]

        default:
//            actualDepositLabel.text = "-"
//            varianceLabel.textColor = UIColor.red
//            varianceLabel.text = "-$0.40"
//            depositExpectedLabel.text = "$0.40"

            break;
        }
        
        for textField in textFields {
            textField.delegate = self
            changeTextFieldBorderColor(color: UIColor.gray, textField: textField)
        }
        
        highlightSelectedSegment()
    }
    
    func animationHandler() {
        if isNumberPadOn {
            calculatorViewPositioning = CGAffineTransform(translationX: 0, y: 0)
            isNumberPadOn = false
        }
        else {
            calculatorViewPositioning = CGAffineTransform(translationX: 0, y: -240)
            isNumberPadOn = true
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.calculatorView.transform = self.calculatorViewPositioning
        }, completion: nil)
    }
    
    func highlightSelectedSegment() {
        self.segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray], for: UIControlState.normal)
        self.segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: UIControlState.selected)
        
        segmentedControl.layer.cornerRadius = 0.0
        segmentedControl.tintColor = UIColor.clear
        
        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        segmentBottomBorder.borderColor = UIColor( red: 19/255, green: 118/255, blue:200/255, alpha: 1.0 ).cgColor
        segmentBottomBorder.borderWidth = 3
        let width: CGFloat = segmentedControl.frame.size.width/2
        
        let x = CGFloat(segmentedControl.selectedSegmentIndex) * width
        let y = segmentedControl.frame.size.height - (segmentBottomBorder.borderWidth)
        segmentBottomBorder.frame = CGRect(x: x, y: y, width: width, height: (segmentBottomBorder.borderWidth))
        segmentedControl.layer.addSublayer(segmentBottomBorder)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if selectedTextField != nil {
            selectedLabel.textColor = UIColor.gray
            changeTextFieldBorderColor(color: UIColor.gray, textField: selectedTextField)
            selectedTextField.clearButtonMode = .never
        }
        
        selectedTextField = textField
        selectedTextField = textFields.filter({ (view) -> Bool in
            return view.tag == selectedTextField.tag
        }).first
        
        changeTextFieldBorderColor(color: UIColor.customBlueColor(), textField: selectedTextField)
        selectedTextField.clearButtonMode = .whileEditing
        
        selectedLabel = labels.filter({ (view) -> Bool in
            return view.tag == selectedTextField.tag
        }).first
        
        selectedLabel.textColor = UIColor.customBlueColor()
        
        print("editing\(selectedTextField.tag)")
        
        if !isNumberPadOn {
            animationHandler()
        }
        
        if self.totalView.isHidden {
            actualDepositLabel.text = "-"
            varianceLabel.textColor = UIColor.red
            varianceLabel.text = "-$0.40"
            depositExpectedLabel.text = "$0.40"
            
        }
        //calculateTotalAmount()
        
        return false
    }
    
    func changeTextFieldBorderColor (color: UIColor, textField: UITextField) {
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = color.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        print("back\(selectedTextField.tag)")
        if selectedTextField.tag > 0 {
            selectedTextField.tag = selectedTextField.tag - 1
            selectedTextField.resignFirstResponder()
            
            //print(selectedTextField.tag)
            
            textFieldShouldBeginEditing(selectedTextField)
        }
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        print("forward\(selectedTextField.tag)")
        if selectedTextField.tag < 16 {
            selectedTextField.tag = selectedTextField.tag + 1
            selectedTextField.resignFirstResponder()
            
            textFieldShouldBeginEditing(selectedTextField)
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        isNumberPadOn = true
        animationHandler()
        hideKeyboard()
    }
    
    @IBAction func keyBoardPressed(_ sender:UIButton){
        let tag = sender.tag
        var value : String = ("\(String(describing: selectedTextField!.text!))\(tag)")
        
        if (selectedTextField.text?.characters.count)! > 0 {
            if tag == 12 {
                selectedTextField?.text = selectedTextField?.text?.substring(to: (selectedTextField?.text?.index(before: (selectedTextField?.text?.endIndex)!))!)
            }
            else if tag == 10 {
                value = selectedTextField.text! + (sender.titleLabel?.text)!
                selectedTextField.text! = value
            }
            else if tag == 11 {
                value = ("\(String(describing: selectedTextField!.text!))\(0)")
                selectedTextField.text! = value
            }
            else {
                selectedTextField.text! = value
            }
        }
            
        else{
            if !(tag == 10 || tag == 11) {// For 00 KeyPad Button
                selectedTextField.text! = value
            }
        }
        
        actualCashDepositTextField.text! = value.currency()!
        totalCount = 0
        calculateTotalAmount()
        calculationsViewValues()
    }
    
    func calculateTotalAmount(){
        if self.totalView.isHidden {
            let selectedView = !totalView.isHidden ? totalView! : coinsEntryView!
            
            for view: UIView in selectedView.subviews {
                if (view is UITextField) {
                    let textField: UITextField? = (view as? UITextField)
                    if ((textField!.text?.characters.count)! > 0){
                        let tag = textField?.tag
                        if(tag == 0){
                            totalCount += Double((textField?.text!)!)!.C
                        }
                        else if(tag == 1){
                            totalCount += Double((textField?.text!)!)!.FIVE_C
                        }
                        else if(tag == 2){
                            totalCount += Double((textField?.text!)!)!.TEN_C
                        }
                        else if(tag == 3){
                            totalCount += Double((textField?.text!)!)!.TWETYFIVE_C
                        }
                        else if(tag == 4){
                            totalCount += Double((textField?.text!)!)!.FIFTY_C
                        }
                        else if(tag == 5){
                            totalCount += Double((textField?.text!)!)!.HUNDRED_C
                        }
                        else if(tag == 6){
                            totalCount += Double((textField?.text!)!)!.PENNIES
                        }
                        else if(tag == 7){
                            totalCount += Double((textField?.text!)!)!.NICKEL
                        }
                        else if(tag == 8){
                            totalCount += Double((textField?.text!)!)!.DIMES
                        }
                        else if(tag == 9){
                            totalCount += Double((textField?.text!)!)!.QUARTERS
                        }
                        else if(tag == 10){
                            totalCount += Double((textField?.text!)!)!.Dollar1
                        }
                        else if(tag == 11){
                            totalCount += Double((textField?.text!)!)!.Dollar2
                        }
                        else if(tag == 12){
                            totalCount += Double((textField?.text!)!)!.Dollar5
                        }
                        else if(tag == 13){
                            totalCount += Double((textField?.text!)!)!.Dollar10
                        }
                        else if(tag == 14){
                            totalCount += Double((textField?.text!)!)!.Dollar20
                        }
                        else if(tag == 15){
                            totalCount += Double((textField?.text!)!)!.Dollar50
                        }
                        else if(tag == 16){
                            totalCount += Double((textField?.text!)!)!.Dollar100
                        }
                    }
                }
            }
        }
        
        else {
            let selectedView = !coinsEntryView.isHidden ? totalView! : totalView!
            
            for view: UIView in selectedView.subviews {
                if (view is UITextField) {
                    let textField: UITextField? = (view as? UITextField)
                    if ((textField!.text?.characters.count)! > 0){
                        let tag = textField?.tag
                        if(tag == 20){
                            totalCount += Double((textField!.text!.replacingOccurrences(of: "$", with: "")))!.ACTUAL_AMOUNT
                        }
                    }
                }
            }
        }
    }
    
    func calculateTotalAmountTest(tag: Int, textField: UITextField) -> Double{

                if(tag == 0){
                    totalCount += Double((textField.text!))!.C
                }
                else if(tag == 1){
                    totalCount += Double((textField.text!))!.FIVE_C
                }
                else if(tag == 2){
                    totalCount += Double((textField.text!))!.TEN_C
                }
                else if(tag == 3){
                    totalCount += Double((textField.text!))!.TWETYFIVE_C
                }
                else if(tag == 4){
                    totalCount += Double((textField.text!))!.FIFTY_C
                }
                else if(tag == 5){
                    totalCount += Double((textField.text!))!.HUNDRED_C
                }
                else if(tag == 6){
                    totalCount += Double((textField.text!))!.PENNIES
                }
                else if(tag == 7){
                    totalCount += Double((textField.text!))!.NICKEL
                }
                else if(tag == 8){
                    totalCount += Double((textField.text!))!.DIMES
                }
                else if(tag == 9){
                    totalCount += Double((textField.text!))!.QUARTERS
                }
                else if(tag == 10){
                    totalCount += Double((textField.text!))!.Dollar1
                }
                else if(tag == 11){
                    totalCount += Double((textField.text!))!.Dollar2
                }
                else if(tag == 12){
                    totalCount += Double((textField.text!))!.Dollar5
                }
                else if(tag == 13){
                    totalCount += Double((textField.text!))!.Dollar10
                }
                else if(tag == 14){
                    totalCount += Double((textField.text!))!.Dollar20
                }
                else if(tag == 15){
                    totalCount += Double((textField.text!))!.Dollar50
                }
                else if(tag == 16){
                    totalCount += Double((textField.text!))!.Dollar100
                }
        return totalCount
    }

    func calculationsViewValues () {
        actualDepositLabel.text! = ("$\(totalCount)")
        varianceValue = totalCount - 0.40
        if varianceValue < 0 {
            varianceLabel.textColor = UIColor.red
        }
        else {
            varianceLabel.textColor = UIColor.black
        }
        varianceLabel.text = ("$\(varianceValue)")
    }
}

extension UIColor {
    static func customBlueColor  () -> UIColor {
        return UIColor(red: 29.0/255.0, green: 129.0/255.0, blue: 191.0/255.0, alpha: 1.0)
    }
}

extension Double{
    var C:Double {return self/100}
    var FIVE_C : Double {return self * 5/100}
    var TEN_C : Double {return self * 10/100}
    var TWETYFIVE_C:Double{return self * 25/100}
    var FIFTY_C:Double{return self * 50/100}
    var HUNDRED_C:Double{return self}
    var PENNIES:Double{return self *  50/100}
    var NICKEL : Double{ return self * 2}
    var DIMES : Double{return self * 5}
    var QUARTERS : Double{return self * 10}
    var Dollar1:Double{return self}
    var Dollar2:Double{return self * 2}
    var Dollar5:Double{return self * 5}
    var Dollar10:Double{return self * 10}
    var Dollar20:Double{return self * 20}
    var Dollar50:Double{return self * 50}
    var Dollar100:Double{return self * 100}
    var ACTUAL_AMOUNT:Double{return self}
}

extension String {
    
    func currency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        let digits = NSDecimalNumber(string: sanitized())
        let place = NSDecimalNumber(value: powf(10, 2))
        return formatter.string(from: digits.dividing(by: place))
    }

    func sanitized() -> String {
        return String(self.characters.filter { "01234567890".characters.contains($0) })
    }
    
}
