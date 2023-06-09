<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="lvchanglong" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<a href="#edit-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
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
                <div id="edit-annonce" class="content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.annonce}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.annonce}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:form resource="${this.annonce}" method="POST" enctype="multipart/form-data">
                        <g:hiddenField name="version" value="${this.annonce?.version}" />
                        <fieldset class="form">
                            <div class="fieldcontain required">
                                <label for="title">Title
                                    <span class="required-indicator">*</span>
                                </label>
                                <input type="text" name="title" value="${annonce.title}" required="" maxlength="50" id="title">
                            </div>
                            <div class="fieldcontain required">
                            <label for="description">Description
                                <span class="required-indicator">*</span>
                            </label>
                            <input type="text" name="description" value="${annonce.description}" required="" id="description">
                            </div>
                            <div class="fieldcontain required">
                            <label for="price">Price
                                <span class="required-indicator">*</span>
                            </label>
                            <input type="number decimal" name="price" value="${annonce.price}" required="" step="0.01" min="0" max="10000" id="price">
                                <font color="red">Le point décimal du prix doit être rempli avec une virgule!</font>
                            </div>
                            <div class="fieldcontain">
                                <label for="illustrations">Illustrations</label>
                                <ul>
                                    <g:each var="illustration" in="${annonce.illustrations}">
                                        ${illustration.filename}:
                                        <img src="http://localhost:8081/assets/${illustration.filename}" alt="${illustration.filename}"/>
                                    </g:each>
                                    <li>add illustations:</li>
                                    <span class="button">
                                        <input type="file" name='image' required="true"/>
                                    </span>
                                </ul>
                            </div>
                            <div class="fieldcontain">
                                <label for="isActive">Is Active</label><input type="hidden" name="_isActive">
                                <input type="checkbox" name="isActive" checked="checked" id="isActive">
                            </div>
                            <div class="fieldcontain required">
                            <label for="author">Author
                                <span class="required-indicator">*</span>
                            </label>
                                <select name="author.id" required="" id="author">
                                    <option value="1">User(username:admin)</option>
                                    <option value="2">User(username:moderator)</option>
                                    <option value="3">User(username:client)</option>
                                    <option value="4" selected="selected">User(username:Alice)</option>
                                    <option value="5">User(username:Bobby)</option>
                                    <option value="6">User(username:Charly)</option>
                                    <option value="7">User(username:Denis)</option>
                                    <option value="8">User(username:Etienne)</option>
                                    <option value="9">User(username:cc)</option>
                                </select>
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
