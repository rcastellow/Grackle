

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create CommandAction</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CommandAction List</g:link></span>
        </div>
        <div class="body">
            <h1>Create CommandAction</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${commandActionInstance}">
            <div class="errors">
                <g:renderErrors bean="${commandActionInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:commandActionInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:commandActionInstance,field:'name')}"/>
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
