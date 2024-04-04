using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Unisuper
{
    public partial class FormEmpleado : System.Web.UI.Page
    {
        Empleado empleado;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                empleado = new Empleado();
                empleado.grid_empleados(grid_empleados);
            }
        }

        protected void btn_crear_Click(object sender, EventArgs e)
        {
            empleado = new Empleado();
            if(empleado.crear(Convert.ToInt32(txt_dpi.Text), txt_nombre.Text, txt_lastnames.Text, Convert.ToInt32(txt_coddept.Text)) > 0)
            {
                lbl_mensaje.Text = "Ingreso Exitoso...";
                empleado.grid_empleados(grid_empleados);
            }
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            empleado = new Empleado();
            empleado.grid_empleados(grid_empleados);
        }

        protected void grid_empleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_dpi.Text = grid_empleados.SelectedRow.Cells[1].Text;
            txt_nombre.Text = grid_empleados.SelectedRow.Cells[2].Text;
            txt_lastnames.Text = grid_empleados.SelectedRow.Cells[3].Text;
            txt_coddept.Text = grid_empleados.SelectedRow.Cells[4].Text;

        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            empleado = new Empleado();
            if (empleado.editar(Convert.ToInt32(txt_dpi.Text), txt_nombre.Text, txt_lastnames.Text, Convert.ToInt32(txt_coddept.Text)) > 0)
            {
                lbl_mensaje.Text = "Editado Exitoso...";
                empleado.grid_empleados(grid_empleados);
            }
        }
    }
}