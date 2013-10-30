using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TCC_Gestao_Inovacao.Telas
{
    public partial class VisualizarAssuntos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            Redirecionar();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Redirecionar();
        }

        private void Redirecionar()
        {
            string idAssunto = GridView1.SelectedValue != null ? GridView1.SelectedValue.ToString() : "0";
            Response.Redirect("AssuntoInovacao.aspx?assuntoSelecionado=" + idAssunto);
        }
    }
}