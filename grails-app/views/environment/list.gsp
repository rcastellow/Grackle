

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Environment List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Environment</g:link></span>
        </div>
        <div class="body">
            <h1>Environment List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="password" title="Password" />
                        
                   	        <g:sortableColumn property="hostName" title="Host Name" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="username" title="Username" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${environmentInstanceList}" status="i" var="environmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${environmentInstance.id}">${fieldValue(bean:environmentInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:environmentInstance, field:'password')}</td>
                        
                            <td>${fieldValue(bean:environmentInstance, field:'hostName')}</td>
                        
                            <td>${fieldValue(bean:environmentInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:environmentInstance, field:'username')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Environment.count()}" />
            </div>
        </div>
    </body>
</html>
