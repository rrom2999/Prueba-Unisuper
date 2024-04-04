<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormEmpleado.aspx.cs" Inherits="Unisuper.FormEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1> Formulario Empleados </h1>
    <asp:Label ID="lbl_dpi" runat="server" Text="DPI:" CssClass="btn"></asp:Label>
    <asp:TextBox ID="txt_dpi" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    <asp:Label ID="lbl_nombre" runat="server" Text="Nombre:"></asp:Label>
    <asp:TextBox ID="txt_nombre" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_lastnames" runat="server" Text="Apellidos: "></asp:Label>
    <asp:TextBox ID="txt_lastnames" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_coddept" runat="server" Text="Codigo de departamento:"></asp:Label>
    <asp:TextBox ID="txt_coddept" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    <asp:Button ID="btn_crear" runat="server" Text="Crear Empleado" CssClass="btn btn-primary" OnClick="btn_crear_Click" />
    <asp:Button ID="btn_editar" runat="server" Text="Editar Empleado" CssClass="btn btn-info" OnClick="btn_editar_Click" />
    <asp:Button ID="btn_actualizar" runat="server" Text="Actualizar tabla" CssClass="btn btn-secondary" OnClick="btn_actualizar_Click" />
    <asp:Label ID="lbl_mensaje" runat="server" CssClass="alert-info" Text=""></asp:Label>
    <asp:GridView ID="grid_empleados" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="dpi" OnSelectedIndexChanged="grid_empleados_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="btn_seleccionar" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" CssClass="btn btn-warning" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dpi" HeaderText="DPI" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
            <asp:BoundField DataField="cod_depto" HeaderText="Codigo Departamento" />
        </Columns>
    </asp:GridView>
</asp:Content>
