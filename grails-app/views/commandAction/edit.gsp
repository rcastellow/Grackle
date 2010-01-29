

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit CommandAction</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CommandAction List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New CommandAction</g:link></span>
        </div>
        <div class="body">
            <h1>Edit CommandAction</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commandActionInstance}">
            <div class="errors">
                <g:renderErrors bean="${commandActionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${commandActionInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:commandActionInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="commandActions">Command Actions:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'commandActions','errors')}">
                                    
<ul>
<g:each var="c" in="${commandActionInstance?.commandActions?}">
    <li><g:link controller="commandAction" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="commandAction" params="['commandAction.id':commandActionInstance?.id]" action="create">Add CommandAction</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:commandActionInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distributionList">Distribution List:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'distributionList','errors')}">
                                    <input type="text" id="distributionList" name="distributionList" value="${fieldValue(bean:commandActionInstance,field:'distributionList')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priority">Priority:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'priority','errors')}">
                                    <input type="text" id="priority" name="priority" value="${fieldValue(bean:commandActionInstance,field:'priority')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project">Project:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'project','errors')}">
                                    <g:select optionKey="id" from="${Project.list()}" name="project.id" value="${commandActionInstance?.project?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tasks">Tasks:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'tasks','errors')}">
                                    
<ul>
<g:each var="t" in="${commandActionInstance?.tasks?}">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="task" params="['commandAction.id':commandActionInstance?.id]" action="create">Add Task</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="variableList">Variable List:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'variableList','errors')}">
                                    <input type="text" id="variableList" name="variableList" value="${fieldValue(bean:commandActionInstance,field:'variableList')}"/>
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
