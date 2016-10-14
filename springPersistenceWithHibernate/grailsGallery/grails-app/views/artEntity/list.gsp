

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title>ArtEntity List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ArtEntity</g:link></span>
        </div>
      <div class="formline" style="margin-top: 40px">

                <div class="dialog">
        <div class="clear">
            <h1>ArtEntity List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <g:sortableColumn property="subTitle" title="Sub Title" />
                        
                   	        <g:sortableColumn property="uploadedDate" title="Uploaded Date" />
                        
                   	        <g:sortableColumn property="displayDate" title="Display Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artEntityList}" status="i" var="artEntity">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${artEntity.id}">${fieldValue(bean:artEntity, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:artEntity, field:'name')}</td>
                        
                            <td>${fieldValue(bean:artEntity, field:'title')}</td>
                        
                            <td>${fieldValue(bean:artEntity, field:'subTitle')}</td>
                        
                            <td>${fieldValue(bean:artEntity, field:'uploadedDate')}</td>
                        
                            <td>${fieldValue(bean:artEntity, field:'displayDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ArtEntity.count()}" />
            </div>
        </div>
    </body>
</html>
