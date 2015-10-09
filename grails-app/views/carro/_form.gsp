<%@ page import="br.com.lucasaquiles.Carro" %>



<div class="fieldcontain ${hasErrors(bean: carroInstance, field: 'logged', 'error')} ">
	<label for="logged">
		<g:message code="carro.logged.label" default="Logged" />
		
	</label>
	<g:checkBox name="logged" value="${carroInstance?.logged}" />

</div>

<div class="fieldcontain ${hasErrors(bean: carroInstance, field: 'placa', 'error')} required">
	<label for="placa">
		<g:message code="carro.placa.label" default="Placa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="placa" required="" value="${carroInstance?.placa}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carroInstance, field: 'proprietario', 'error')} required">
	<label for="proprietario">
		<g:message code="carro.proprietario.label" default="Proprietario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proprietario" name="proprietario.id" from="${br.com.lucasaquiles.Proprietario.list()}" optionKey="id" required="" value="${carroInstance?.proprietario?.id}" class="many-to-one"/>

</div>

