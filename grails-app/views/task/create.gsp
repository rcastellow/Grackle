

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Task</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Task List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Task</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:taskInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="arguments">Arguments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'arguments','errors')}">
                                    <input type="text" id="arguments" name="arguments" value="${fieldValue(bean:taskInstance,field:'arguments')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="commandAction">Command Action:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'commandAction','errors')}">
                                    <g:select optionKey="id" from="${CommandAction.list()}" name="commandAction.id" value="${taskInstance?.commandAction?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:taskInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distributionList">Distribution List:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'distributionList','errors')}">
                                    <input type="text" id="distributionList" name="distributionList" value="${fieldValue(bean:taskInstance,field:'distributionList')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priority">Priority:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'priority','errors')}">
                                    <input type="text" id="priority" name="priority" value="${fieldValue(bean:taskInstance,field:'priority')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="scriptPath">Script Path:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'scriptPath','errors')}">
                                    <input type="text" id="scriptPath" name="scriptPath" value="${fieldValue(bean:taskInstance,field:'scriptPath')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="variableList">Variable List:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'variableList','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
