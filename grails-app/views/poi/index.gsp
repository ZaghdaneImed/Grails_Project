<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="purple">
                    <i class="material-icons">place</i>
                </div>

                <div class="card-content">
                    <h4 class="card-title">Lieux</h4>

                    <div class="toolbar">
                    <!--        Here you can write extra buttons/actions for the toolbar              -->
                        <g:link class="create" action="create">
                            <button id="addnew" class="btn btn-primary btn-round btn-fab btn-fab-mini"
                                    style="float: right;"><i class="material-icons">add</i></button>
                        </g:link>
                    </div>

                    <div class="material-datatables">
                        <table id="poisdatatables"
                               class="table table-striped table-no-bordered table-hover dataTable dtr-inline table-shopping"
                               cellspacing="0" width="100%" style="width: 100%;" role="grid"
                               aria-describedby="datatables_info">
                            <thead>
                            <tr>
                                <th class="text-center disabled-sorting"></th>
                                <th>Nom</th>
                                <th class='hidden-480 text-right'>Ville</th>
                                <th class="td-actions text-right disabled-sorting">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${poiList}" var="poi">
                                <tr>
                                    <td>
                                        <div class="img-container">
                                            <g:if test="${poi.images.size() != 0 && poi.images != null}">
                                            <img class="img img-responsive center-block" style=" height: 120px"
                                                         src="${grailsApplication.config.server.pathServer}/images/${poi.images[0].name}"/>
                                            </g:if>
                                            <g:else>
                                                <asset:image class="img img-responsive center-block" style=" height: 120px"
                                                             src="non_disponible.jpg"/>
                                            </g:else>
                                        </div>
                                    </td>
                                    <td class="td-name"><a href="/poi/show/${poi.id}">${poi.name}</a>
                                        <br>
                                        <small>${poi.groups.name}</small>
                                    </td>

                                    <td class='hidden-480 text-right'>TODO</td>
                                    <td class="td-actions text-right">
                                        <a href="/poi/show/${poi.id}"
                                           class='btn btn-simple btn-info'><i
                                                class='material-icons'>visibility</i></a>
                                        <a href="/poi/edit/${poi.id}"
                                           class='btn btn-simple btn-success'><i
                                                class='material-icons'>create</i></a>
                                        <g:form resource="${poi}" method="DELETE">
                                            <input class="delete btn btn-danger btn-fill" type="submit"
                                                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                                        </g:form></td>
                                </tr>
                            </g:each>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    $(document).ready(function () {
        $('#poisdatatables').DataTable({
            language: options
        });
    });
</g:javascript>
</body>
</html>