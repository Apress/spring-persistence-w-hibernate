

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title>Edit Exhibition</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Exhibition List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Exhibition</g:link></span>
        </div>
        <div class="formline" style="margin-top: 40px">

                <div class="dialog">
        <div class="clear">
            <h1>Edit Exhibition</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${exhibition}">
            <div class="errors">
                <g:renderErrors bean="${exhibition}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${exhibition?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exhibition,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:exhibition,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exhibition,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:exhibition, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="exhibitionArtwork">Exhibition Artwork:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:exhibition,field:'exhibitionArtwork','errors')}">
                                    
<ul>
<g:each var="e" in="${exhibition?.exhibitionArtwork?}">
    <li><g:link controller="artEntity" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="artEntity" params="['exhibition.id':exhibition?.id]" action="create">Add ArtEntity</g:link>

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
