//
//  Questoes.swift
//  Quiz
//
//  Created by Aluno on 10/09/22.
//

import Foundation

class QuizManager {
    var lista = [Quiz]()
    static let shared = QuizManager()

    init() {
        
        lista.append(Quiz(pergunta: "É possível chorar debaixo d'água?", resposta1: "Sim, porém não será possível ver as lágrimas", resposta2: "Não, pois causaria um afogamento", resposta3: "Depende, desde que seja em água doce", solucao: "Sim, porém não será possível ver as lágrimas"))
        lista.append(Quiz(pergunta: "Se todas as pessoas do mundo pularem ao mesmo tempo, a Terra se moverá?", resposta1: "Não, os saltos se cancelariam", resposta2: "Sim, aconteceria um pequeno deslocamento", resposta3: "Talvez, não é possível obter uma estimativa desse evento", solucao: "Não, os saltos se cancelariam"))
        lista.append(Quiz(pergunta: "Os peixes ficam com sede?", resposta1: "Sim, os peixes têm sede! Tal como nós", resposta2: "Não, os peixes dispõem de células especiais", resposta3: "Depende, apenas os peixes de água doce sentem sede", solucao: "Sim, os peixes têm sede! Tal como nós"))
        lista.append(Quiz(pergunta: "Se alguém possui um pedaço de terra, ele é dono dessa propriedade até o centro da Terra?", resposta1: "Não, o direito de utilização de propriedade é limitado", resposta2: "Depende, a exploração desses espaços exige autorização", resposta3: "Sim, o proprietário possui desde o céu até o inferno", solucao: "Não, o direito de utilização de propriedade é limitado"))
        lista.append(Quiz(pergunta: "Se ninguém compra um ingresso para um filme, o cinema ainda o exibe?", resposta1: "Depende do cinema", resposta2: "Sim, os cinemas são obrigados a fazer a exibição", resposta3: "Não, as salas sem expectadores são fechadas", solucao: "Depende do cinema"))
        lista.append(Quiz(pergunta: "Os pinguins têm joelhos?", resposta1: "Sim, os pinguins têm joelhos", resposta2: "Depende, nem todas as especíes possuem joelhos", resposta3: "Não, os pinguins possuem encurtamento das pernas", solucao: "Sim, os pinguins têm joelhos"))
        lista.append(Quiz(pergunta: "Se você roubou uma caneta de um banco, é um assalto a banco?", resposta1: "Depende, desde que a caneta tenha sido comprada pelo banco", resposta2: "Sim, o termo 'assalto a banco' caracteriza todo tipo de roubo", resposta3: "Não, roubo de caneta não é passível de ação penal", solucao: "Depende, desde que a caneta tenha sido comprada pelo banco"))
    }
    
    func size() -> Int {
        return lista.count
    }
    
    func addQuestao(pergunta: String, _ r1: String, _ r2: String, _ r3: String, _ solucao: String) {
        lista.append(Quiz(pergunta: pergunta, resposta1: r1, resposta2: r2, resposta3: r3, solucao: solucao))
    }
    
    func removeQuiz(_ pos: Int) {
        lista.remove(at: pos)
    }
    
    func retornaPergunta(_ pos: Int) -> String {
        return lista[pos].pergunta
    }
    
    func retornaQuiz(_ pos: Int) -> Quiz {
        return lista[pos]
    }
    
    func atualizaQuiz(_ pos: Int, pergunta: String, _ r1: String, _ r2: String, _ r3: String, _ solucao: String) {
        lista[pos].pergunta = pergunta
        lista[pos].resposta1 = r1
        lista[pos].resposta2 = r2
        lista[pos].resposta3 = r3
        lista[pos].solucao = solucao
    }
    
    func retornaQuizes() -> [Quiz] {
        return lista
    }
    
}
