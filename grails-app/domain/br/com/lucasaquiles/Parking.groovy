package br.com.lucasaquiles

class Parking {

String nome
static hasMany = [carros:Carro]
	
    static constraints = {
    }
}
