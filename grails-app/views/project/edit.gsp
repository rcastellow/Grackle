

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Project</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Project List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Project</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Project</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${projectInstance}">
            <div class="errors">
                <g:renderErrors bean="${projectInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${projectInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:projectInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="commandActions">Command Actions:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectInstance,field:'commandActions','errors')}">
                                    
<ul>
<g:each var="c" in="${projectInstance?.commandActions?}">
    <li><g:link controller="commandAction" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="commandAction" params="['project.id':projectInstance?.id]" action="create">Add CommandAction</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:projectInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="distributionList">Distribution List:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectInstance,field:'distributionList','errors')}">
                                    <input type="text" id="distributionList" name="distributionList" value="${fieldValue(bean:projectInstance,field:'distributionList')}"/>
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
