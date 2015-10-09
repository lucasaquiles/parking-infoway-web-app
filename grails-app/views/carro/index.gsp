
<%@ page import="br.com.lucasaquiles.Carro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carro.label', default: 'Carro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-carro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-carro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="logged" title="${message(code: 'carro.logged.label', default: 'Logged')}" />
					
						<g:sortableColumn property="placa" title="${message(code: 'carro.placa.label', default: 'Placa')}" />
					
						<th><g:message code="carro.proprietario.label" default="Proprietario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carroInstanceList}" status="i" var="carroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carroInstance.id}">${fieldValue(bean: carroInstance, field: "logged")}</g:link></td>
					
						<td>${fieldValue(bean: carroInstance, field: "placa")}</td>
					
						<td>${fieldValue(bean: carroInstance, field: "proprietario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
