<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="lvchanglong" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Lecoincoin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - User -->
                <li class="nav-item active">
                    <a class="nav-link" href="/user">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg>
                        <span>users</span></a>
                </li>

                <!-- Nav Item - Annonces -->
                <li class="nav-item active">
                    <a class="nav-link" href="/annonce?max=100">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                            <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                        </svg>
                        <span>Annonces</span></a>
                </li>
            </ul>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <div class="container-fluid">
                        <div id="list-user" class="content scaffold-list" role="main">
                            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <div style="overflow-x: auto; overflow-y: auto; height: 100%; width: 100%;">
                                <table>
                                    <thead>
                                    <tr>

                                        <th class="sortable"><a href="/user/index?sort=password&amp;max=10&amp;order=asc">Password</a></th>

                                        <th class="sortable"><a href="/user/index?sort=username&amp;max=10&amp;order=asc">Username</a></th>

                                        <th class="sortable"><a href="/user/index?sort=passwordExpired&amp;max=10&amp;order=asc">Password Expired</a></th>

                                        <th class="sortable"><a href="/user/index?sort=accountLocked&amp;max=10&amp;order=asc">Account Locked</a></th>

                                        <th class="sortable"><a href="/user/index?sort=accountExpired&amp;max=10&amp;order=asc">Account Expired</a></th>

                                        <th class="sortable"><a href="/user/index?sort=enabled&amp;max=10&amp;order=asc">Enabled</a></th>

                                        <th class="sortable"><a href="/user/index?sort=annonces&amp;max=10&amp;order=asc">Annonces</a></th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <g:each status="i" in="${userList}" var="user">
                                            <tr>
                                                <td>
                                                    <g:link controller="user" action="show" id="${user.id}">${user.password}</g:link>
                                                </td>
                                                <td>${user.username}</td>
                                                <td>${user.passwordExpired}</td>
                                                <td>${user.accountLocked}</td>
                                                <td>${user.accountExpired}</td>
                                                <td>${user.enabled}</td>
                                                <td>
                                                    <g:each var="annonce" in="${user.annonces}">
                                                        <li>
                                                            <g:link controller="annonce" action="show" id="${annonce.id}">${annonce.title}</g:link>
                                                        </li>
                                                    </g:each>
                                                </td>
                                                <td>
                                                    <g:link controller="user" action="edit" id="${user.id}">Edit</g:link>
                                                </td>
                                                <td>
                                                    <g:form action="delete" id="${user.id}" method="DELETE">
                                                        <input class="delete" type="submit" name="_method" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                                    </g:form>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination">
                                <g:paginate total="${userCount ?: 0}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>