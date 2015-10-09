<%@ page import="br.com.lucasaquiles.Proprietario" %>



<div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'carros', 'error')} ">
	<label for="carros">
		<g:message code="proprietario.carros.label" default="Carros" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${proprietarioInstance?.carros?}" var="c">
    <li><g:link controller="carro" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carro" action="create" params="['proprietario.id': proprietarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carro.label', default: 'Carro')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="proprietario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${proprietarioInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'numeroTelefone', 'error')} required">
	<label for="numeroTelefone">
		<g:message code="proprietario.numeroTelefone.label" default="Numero Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numeroTelefone" required="" value="${proprietarioInstance?.numeroTelefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: proprietarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="proprietario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${proprietarioInstance?.username}"/>

</div>

