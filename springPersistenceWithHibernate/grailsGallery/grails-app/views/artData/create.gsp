

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title>Create ArtData</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ArtData List</g:link></span>
        </div>
     <div class="formline" style="margin-top: 40px">

                <div class="dialog">
        <div class="clear">
            <h1>Create ArtData</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${artData}">
            <div class="errors">
                <g:renderErrors bean="${artData}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artEntity">Art Entity:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artData,field:'artEntity','errors')}">
                                    <g:select optionKey="id" from="${ArtEntity.list()}" name="artEntity.id" value="${artData?.artEntity?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contentType">Content Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artData,field:'contentType','errors')}">
                                    <input type="text" id="contentType" name="contentType" value="${fieldValue(bean:artData,field:'contentType')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="picture">Picture:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:artData,field:'picture','errors')}">
                                    <input type="file" id="picture" name="picture" />
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
