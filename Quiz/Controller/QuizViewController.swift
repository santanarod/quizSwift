//
//  QuizViewController.swift
//  Quiz
//
//  Created by Aluno on 12/09/22.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var pergunta: UILabel!
    @IBOutlet var respostas: [UIButton]!
    @IBOutlet weak var displayPontuacao: UILabel!
    
    var questoes = QuizManager.shared.retornaQuizes()
    var numeroQuestoes = QuizManager.shared.size()
    var sequencia = 0
    var pontuacao = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuiz()
    }
    
    @IBAction func selecionar(_ sender: UIButton) {
        if sender.titleLabel?.text == questoes[sequencia].solucao {
            pontuacao += 1
        }
        
        sequencia += 1
        loadQuiz()
    }
    
    func loadQuiz() {
        if sequencia > (numeroQuestoes - 1) {
            displayPontuacao.text = "\(pontuacao)"
            mostrarAlerta()
            
        } else {
            pergunta.text = questoes[sequencia].pergunta
            
            let posicao = retornaPosQuiz()
            respostas[posicao[0]].setTitle(questoes[sequencia].resposta1, for: .normal)
            respostas[posicao[1]].setTitle(questoes[sequencia].resposta2, for: .normal)
            respostas[posicao[2]].setTitle(questoes[sequencia].resposta3, for: .normal)
            displayPontuacao.text = "\(pontuacao)"
        }
    }
    
    func mostrarAlerta() {
        let alertController = UIAlertController(title: "Terminou", message: "Você fez um total de \(pontuacao) ponto(s)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            self.sequencia = 0
            self.pontuacao = 0
            self.loadQuiz()
        }
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    // Retorna posições aleatórias para as respostas da pergunta
    func retornaPosQuiz() -> [Int] {
        var posicao = [Int]()

        repeat {
            let numeroAleatorio = Int.random(in: 0...2)
            if !posicao.contains(numeroAleatorio) {
                posicao.append(numeroAleatorio)
            }
            
        } while posicao.count < 3
        
        return posicao
    }
}
