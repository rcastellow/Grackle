

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Task List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Task</g:link></span>
        </div>
        <div class="body">
            <h1>Task List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="arguments" title="Arguments" />
                        
                   	        <th>Command Action</th>
                   	    
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="distributionList" title="Distribution List" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${taskInstanceList}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean:taskInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'arguments')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'commandAction')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:taskInstance, field:'distributionList')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Task.count()}" />
            </div>
        </div>
    </body>
</html>
