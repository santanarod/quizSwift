//
//  AddQuestionTableViewController.swift
//  Quiz
//
//  Created by Aluno on 10/09/22.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var btSalvar: UIButton!
    @IBOutlet weak var pergunta: UITextField!
    @IBOutlet weak var alternativa_1: UITextField!
    @IBOutlet weak var alternativa_2: UITextField!
    @IBOutlet weak var alternativa_3: UITextField!
        
    var itemSelecionado: Int?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pergunta.delegate = self
        alternativa_1.delegate = self
        alternativa_2.delegate = self
        alternativa_3.delegate = self

        btSalvar.isEnabled = false
        
        if itemSelecionado != nil {
            preencherCampos()
        }
    }
    
    @IBAction func salvar(_ sender: UIButton) {
        if btSalvar.titleLabel?.text == "Editar" {
            QuizManager.shared.atualizaQuiz(itemSelecionado!, pergunta: pergunta.text!, alternativa_1.text!, alternativa_2.text!, alternativa_3.text!, alternativa_1.text!)
                self.navigationController?.popViewController(animated: true)

        } else {
            QuizManager.shared.addQuestao(pergunta: pergunta.text!, alternativa_1.text!, alternativa_2.text!, alternativa_3.text!, alternativa_1.text!)
                self.navigationController?.popViewController(animated: true)
        }
    }
    
    // Preenche os TextFields quando a pergunta é selecionada na tableView, permitindo que o usuário realize a edição dos campos
    func preencherCampos() {
        let itemSelecionado = QuizManager.shared.retornaQuiz(itemSelecionado!)
        pergunta.text = itemSelecionado.pergunta
        alternativa_1.text = itemSelecionado.resposta1
        alternativa_2.text = itemSelecionado.resposta2
        alternativa_3.text = itemSelecionado.resposta3
        
        btSalvar.setTitle("Editar", for: .normal)
    }
    
    // Habilita o botão salvar apenas quando todos os TextFields estão preenchidos
    func ativarButton() -> Bool {
        if pergunta.text?.trimmingCharacters(in: .whitespaces).isEmpty == false,
           alternativa_1.text?.trimmingCharacters(in: .whitespaces).isEmpty == false,
           alternativa_2.text?.trimmingCharacters(in: .whitespaces).isEmpty == false,
           alternativa_3.text?.trimmingCharacters(in: .whitespaces).isEmpty == false {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func inserirPergunta(_ sender: UITextField) {
        btSalvar.isEnabled = ativarButton()
    }
    
    @IBAction func inserirAlternativa_1(_ sender: UITextField) {
        btSalvar.isEnabled = ativarButton()
    }
    
    @IBAction func inserirAlternativa_2(_ sender: UITextField) {
        btSalvar.isEnabled = ativarButton()
    }
    
    @IBAction func inserirAlternativa_3(_ sender: UITextField) {
        btSalvar.isEnabled = ativarButton()
    }
}
