

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Task</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Task List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Task</g:link></span>
        </div>
        <div class="body">
            <h1>Show Task</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Arguments:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'arguments')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Command Action:</td>
                            
                            <td valign="top" class="value"><g:link controller="commandAction" action="show" id="${taskInstance?.commandAction?.id}">${taskInstance?.commandAction?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Distribution List:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'distributionList')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Environments:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="e" in="${taskInstance.environments}">
                                    <li><g:link controller="environment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Priority:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'priority')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Script Path:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'scriptPath')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Variable List:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:taskInstance, field:'variableList')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${taskInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
