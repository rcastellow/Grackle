

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>CommandAction List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New CommandAction</g:link></span>
        </div>
        <div class="body">
            <h1>CommandAction List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="distributionList" title="Distribution List" />
                        
                   	        <g:sortableColumn property="priority" title="Priority" />
                        
                   	        <th>Project</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${commandActionInstanceList}" status="i" var="commandActionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${commandActionInstance.id}">${fieldValue(bean:commandActionInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:commandActionInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:commandActionInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:commandActionInstance, field:'distributionList')}</td>
                        
                            <td>${fieldValue(bean:commandActionInstance, field:'priority')}</td>
                        
                            <td>${fieldValue(bean:commandActionInstance, field:'project')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${CommandAction.count()}" />
            </div>
        </div>
    </body>
</html>
