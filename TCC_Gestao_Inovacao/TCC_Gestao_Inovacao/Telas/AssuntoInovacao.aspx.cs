using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCC_Gestao_Inovacao.DataSetDwInovacaoTableAdapters;

namespace TCC_Gestao_Inovacao.Telas
{
    public partial class AssuntoInovacao : System.Web.UI.Page
    {
        public int _idAssuntoSelecionado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            _idAssuntoSelecionado = !string.IsNullOrEmpty(Request.QueryString["assuntoSelecionado"]) ? int.Parse(Request.QueryString["assuntoSelecionado"]) : 0;
            if (!IsPostBack)
            {              
                //se não for um novo registro
                if (_idAssuntoSelecionado != 0)
                {
                    Session["assuntoSelecionado"] = _idAssuntoSelecionado;
                    CarregarDados(_idAssuntoSelecionado);
                }
            }
        }

        /// <summary>
        /// Busca os dados da base e carrega na tela para edição
        /// </summary>
        /// <param name="_idAssuntoSelecionado"></param>
        private void CarregarDados(int _idAssuntoSelecionado)
        {
            AssuntosInovacaoTableAdapter assuntoInovacao = new AssuntosInovacaoTableAdapter();
            TCC_Gestao_Inovacao.DataSetDwInovacao.AssuntosInovacaoDataTable tabela = assuntoInovacao.BuscarPorId(_idAssuntoSelecionado);
            TCC_Gestao_Inovacao.DataSetDwInovacao.AssuntosInovacaoRow linha = (TCC_Gestao_Inovacao.DataSetDwInovacao.AssuntosInovacaoRow)tabela.Rows[0];
            txbDescricao.Text = linha.DescricaoAssunto;
            txbNome.Text = linha.NomeAssunto;
            ddlProduto.SelectedValue = linha.Produto.ToString();
            ddlVersao.SelectedValue = linha.Versao.ToString();
            GridView2.Visible = true;
            lblTarefasRelacionadas.Visible = true;

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            AssuntosInovacaoTableAdapter assuntoInovacao = new AssuntosInovacaoTableAdapter();
            if (_idAssuntoSelecionado == 0)
            {
                if ((assuntoInovacao.VerificarExisteAssunto(txbNome.Text, int.Parse(ddlProduto.SelectedValue), int.Parse(ddlVersao.SelectedValue))) == 0)
                {
                    assuntoInovacao.Inserir(txbNome.Text, txbDescricao.Text, int.Parse(ddlVersao.SelectedValue), int.Parse(ddlProduto.SelectedValue));
                    int novoId = assuntoInovacao.BuscarUltimoAssuntoCriado().Value;
                    AdicionarTarefasSelecionadas(novoId);
                }
                else
                {
                    msg.Text = "Já existe um assunto de inovação cadastrado com a mesma versão, nome e produto";
                    msg.Visible = true;
                }
            }
            else
            {
                assuntoInovacao.Atualizar(txbNome.Text, txbDescricao.Text, int.Parse(ddlVersao.SelectedValue), int.Parse(ddlProduto.SelectedValue), _idAssuntoSelecionado);
                AdicionarTarefasSelecionadas(_idAssuntoSelecionado);
            }
            Session.Remove("assuntoSelecionado");
            Response.Redirect("VisualizarAssuntos.aspx");
        }

        /// <summary>
        /// Adiciona as tarefas foram selecionadas na grid
        /// </summary>
        private void AdicionarTarefasSelecionadas(int assunto)
        {
            AssuntoTarefaTableAdapter assuntoTarefa = new AssuntoTarefaTableAdapter();
            int linhasGrid = 0;
            while (linhasGrid < GridView1.Rows.Count)
            {
                GridViewRow linha = GridView1.Rows[linhasGrid];
                bool estaChecado = ((CheckBox)linha.FindControl("chkSelect")).Checked;
                if (estaChecado)
                {
                    assuntoTarefa.Inserir(assunto, int.Parse(linha.Cells[1].Text));
                }
                linhasGrid++;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("VisualizarAssuntos.aspx");
        }
    }
}