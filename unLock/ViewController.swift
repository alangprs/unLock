

import UIKit

class ViewController: UIViewController {
    
    //數字按鈕
    @IBOutlet var passwordButton: [UIButton]!
    //密碼圖片
    @IBOutlet var answerView: [UIImageView]!
    
    let rightAnswer = "1234" //正確的密碼
    var enterAnser = "" //輸入的密碼
    
    //更換圖片func
    func imageChange() {
        switch enterAnser.count {
        case 1:
            for i in 0...3{
                answerView[i].isHighlighted = true
                if i > 0{
                    answerView[i].isHighlighted = false
                }
            }
        case 2:
            for i in 0...3{
                answerView[i].isHighlighted = true
                if i > 1{
                    answerView[i].isHighlighted = false
                }
            }
        case 3:
            for i in 0...3{
                answerView[i].isHighlighted = true
                if i > 2{
                    answerView[i].isHighlighted = false
                }
            }
        case 4:
            for i in answerView{
                i.isHighlighted = false
                chankanswer()
                }
        default:
            for i in answerView{
                i.isHighlighted = true
        }
    }
    }
    
    //確認密碼，用彈跳出視窗顯示
    func chankanswer() {
        if rightAnswer == enterAnser{
            let controller = UIAlertController(title: "解鎖通知", message: "恭喜解鎖", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
        }else{
            let controller = UIAlertController(title: "解鎖通知", message: "密碼錯誤，請輸入正確密碼", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: reset)
        }
        
    }
    //密碼歸零
    func reset() {
        for i in answerView{
            i.isHighlighted = false
        }
        enterAnser = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //定義每個按鈕的數字
        for i in 0...9{
            passwordButton[i].setTitle("\(i)", for: .normal) //修改文字
            passwordButton[i].setTitleColor(UIColor.white, for: .normal) //修改顏色
            
        }
        
        
    }
    
    //按下數字按鍵
    @IBAction func enterAnser(_ sender: UIButton) {
        if enterAnser.count != 4{
            if let inputNumber = sender.currentTitle{
            enterAnser.append(inputNumber)
                print(inputNumber)
        }
        }
        imageChange()
    }
    //歸零
    @IBAction func numberAeset(_ sender: UIButton) {
        reset()
    }
}

