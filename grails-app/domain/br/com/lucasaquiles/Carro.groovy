package br.com.lucasaquiles

class Carro {

	static belongsTo = [proprietario:Proprietario]
	String placa
	Boolean logged

    static constraints = {

    }
}
