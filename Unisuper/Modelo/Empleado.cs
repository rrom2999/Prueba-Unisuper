using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace Modelo
{
    public class Empleado
    {
        ConexionBD conectar;

        private DataTable grid_empleados()
        {
            DataTable tabla = new DataTable();
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("SELECT dpi, nombre, apellidos, cod_depto FROM empleado;");
            MySqlDataAdapter query = new MySqlDataAdapter(consulta, conectar.conectar);
            query.Fill(tabla);
            conectar.CerrarConexion();
            return tabla;
        }

        public void grid_empleados(GridView grid)
        {
            grid.DataSource = grid_empleados();
            grid.DataBind();
        }

        public int crear(int dpi, string nombre, string apellidos, int cod_depto )
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES({0},'{1}','{2}',{3});", dpi, nombre, apellidos, cod_depto);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();

            conectar.CerrarConexion();
            return no;
        }

        public int editar(int dpi, string nombre, string apellidos, int cod_depto)
        {
            int no = 0;
            conectar = new ConexionBD();
            conectar.AbrirConexion();
            string consulta = string.Format("UPDATE empleado SET nombre = '{1}', apellidos = '{2}', cod_depto = '{3}' WHERE dpi = {0};", dpi, nombre, apellidos, cod_depto);
            MySqlCommand query = new MySqlCommand(consulta, conectar.conectar);
            query.Connection = conectar.conectar;
            no = query.ExecuteNonQuery();

            conectar.CerrarConexion();
            return no;
        }
    }
}
