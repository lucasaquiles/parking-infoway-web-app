package br.com.lucasaquiles

class Proprietario {

	String nome;
	String username;
	String numeroTelefone
	static hasMany = [carros:Carro]

    static constraints = {
    }
}
