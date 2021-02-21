//
//  ViewController.swift
//  Loteria
//
//  Created by Murilo Ribeiro de Oliveira on 21/02/21.
// App desenvolvido com base no curso: udemy.com/course/curso-completo-de-desenvolvimento-ios11swift4 por Eric Alves Brito
//
//
import UIKit


enum GameType : String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}


                infix operator >-<
                func >-< (total: Int, universe: Int)-> [Int]{
                    
                    var result: [Int] = []
                    
                    while result.count < total {
                        let randomNumer = Int(arc4random_uniform(UInt32(universe))+1)
                        
                        if !result.contains(randomNumer){
                            result.append(randomNumer)
                        
                        }
                            }
                    return result.sorted()
                }




class ViewController: UIViewController {

            @IBOutlet weak var lbGameType: UILabel!
            
            @IBOutlet weak var scGameType: UISegmentedControl!
            
            @IBOutlet var balls: [UIButton]!
    
    
                        @IBAction func generateGame() {
                            
                            switch scGameType.selectedSegmentIndex {
                            case 0:
                                
                                showNumbers(for: .megasena)
                                
                            default:
                                
                                showNumbers(for: .quina)
                            }
                        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showNumbers(for: .megasena)
    }
    
        
        func showNumbers(for type: GameType){
            lbGameType.text = type.rawValue
            var game : [Int] = []
            
            switch type {
            
            case .megasena:
                game = 6>-<60
                
                balls.last!.isHidden = false
                
            case .quina:
                game = 5>-<80
                balls.last!.isHidden = true
                
            }
            
            for (index, game) in game.enumerated() {
                balls[index].setTitle("\(game)", for: .normal)
            }
            
            
            
        }
    
    
    

}

