<%@ page import="br.com.lucasaquiles.Parking" %>



<div class="fieldcontain ${hasErrors(bean: parkingInstance, field: 'carros', 'error')} ">
	<label for="carros">
		<g:message code="parking.carros.label" default="Carros" />
		
	</label>
	<g:select name="carros" from="${br.com.lucasaquiles.Carro.list()}" multiple="multiple" optionKey="id" size="5" value="${parkingInstance?.carros*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: parkingInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="parking.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${parkingInstance?.nome}"/>

</div>

