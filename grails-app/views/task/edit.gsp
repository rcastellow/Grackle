

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Task</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Task List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Task</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Task</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${taskInstance}">
            <div class="errors">
                <g:renderErrors bean="${taskInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${taskInstance?.id}" />
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
                                    <label for="environments">Environments:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:taskInstance,field:'environments','errors')}">
                                    
<ul>
<g:each var="e" in="${taskInstance?.environments?}">
    <li><g:link controller="environment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="environment" params="['task.id':taskInstance?.id]" action="create">Add Environment</g:link>

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
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
