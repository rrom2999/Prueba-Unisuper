<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Unisuper._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Manejo de Empleados</h1>
        <p class="lead">La base de datos es la misma utilizada en la sección 2 de la prueba.</p>
        <p class="lead">Tabla "empleado": dpi, nombre, apellidos, cod_depto</p>
        <p class="lead">Tabla "departamento": codigo_departamento, nombre_depto, presupuesto</p>
        <p class="lead">&nbsp;</p>
        <p class="lead">- Para Crear empleado debera llenar los 4 datos del formulario y hacer clic en el boton &#39;Crear Empleado&#39;</p>
        <p class="lead">- Para Editar los datos de un empleado, deberá primero seleccionar el empleado de la tabla utilizando el boton amarillo &#39;Seleccionar&#39;, esto copiará todos los datos en el formulario de arriba. Edite en el formulario el campo deseado y haga clic en el boton &#39;Editar Empleado&#39;. La edición se realiza con el dpi, es decir que para editar, el dpi debe ser igual.</p>
    </div>

    <div class="row">
    </div>

</asp:Content>
