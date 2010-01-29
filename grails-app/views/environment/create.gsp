

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Environment</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Environment List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Environment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${environmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${environmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:environmentInstance,field:'password','errors')}">
                                    <input type="text" maxlength="15" id="password" name="password" value="${fieldValue(bean:environmentInstance,field:'password')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hostName">Host Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:environmentInstance,field:'hostName','errors')}">
                                    <input type="text" id="hostName" name="hostName" value="${fieldValue(bean:environmentInstance,field:'hostName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:environmentInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:environmentInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:environmentInstance,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:environmentInstance,field:'username')}"/>
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
