

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title>ArtData List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ArtData</g:link></span>
        </div>
        <div class="formline" style="margin-top: 40px">

                <div class="dialog">
        <div class="clear">
            <h1>ArtData List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Art Entity</th>
                   	    
                   	        <g:sortableColumn property="contentType" title="Content Type" />
                        
                   	        <g:sortableColumn property="picture" title="Picture" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artDataList}" status="i" var="artData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${artData.id}">${fieldValue(bean:artData, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:artData, field:'artEntity')}</td>
                        
                            <td>${fieldValue(bean:artData, field:'contentType')}</td>
                        
                            <td>${fieldValue(bean:artData, field:'picture')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ArtData.count()}" />
            </div>
        </div>
    </body>
</html>
