

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title>Edit Tag</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Tag List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Tag</g:link></span>
        </div>
       <div class="formline" style="margin-top: 40px">

                <div class="dialog">
        <div class="clear">
            <h1>Edit Tag</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tag}">
            <div class="errors">
                <g:renderErrors bean="${tag}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${tag?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tag,field:'name','errors')}">
                                    <input type="text" maxlength="150" id="name" name="name" value="${fieldValue(bean:tag,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tag,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:tag, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artEntities">Art Entities:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tag,field:'artEntities','errors')}">
                                    
<ul>
<g:each var="a" in="${tag?.artEntities?}">
    <li><g:link controller="artEntity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="artEntity" params="['tag.id':tag?.id]" action="create">Add ArtEntity</g:link>

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
