<%@ Page Title="Assuntos de inovação" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisualizarAssuntos.aspx.cs" Inherits="TCC_Gestao_Inovacao.Telas.VisualizarAssuntos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 257px;
        }
        .auto-style2
        {
            width: 190px;
        }
        .auto-style3
        {
            width: 142px;
        }
        .auto-style4
        {
            width: 124px;
        }
        .auto-style5
        {
            width: 268435968px;
        }
        .auto-style19
        {
            width: 645px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="142px" Width="749px">
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Filtros"></asp:Label>
        <table>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Produto"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlProduto" runat="server" DataSourceID="Produto" DataTextField="NomeProduto" DataValueField="SequenciaProduto"></asp:DropDownList>
                    <asp:SqlDataSource ID="Produto" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString %>" SelectCommand="SELECT * FROM [Produtos]"></asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Versão Liberação"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlVersao" runat="server" DataSourceID="Versao" DataTextField="DescricaoVersao" DataValueField="SequenciaVersao"></asp:DropDownList>
                    <asp:SqlDataSource ID="Versao" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString %>" SelectCommand="SELECT [SequenciaVersao], [DescricaoVersao] FROM [VersaoLiberacao] WHERE ([Produto] = @Produto)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProduto" Name="Produto" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Nome"></asp:Label>
                    &nbsp;Assunto:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server" Width="211px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="316px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SequenciaAssunto" DataSourceID="Grid" CellPadding="4" ForeColor="#333333" GridLines="None" Width="739px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="NomeAssunto" HeaderText="Nome" SortExpression="NomeAssunto" />
                <asp:BoundField DataField="DescricaoAssunto" HeaderText="Descrição" SortExpression="DescricaoAssunto" />
                <asp:BoundField DataField="Versao" HeaderText="Versao" SortExpression="Versao" />
                <asp:BoundField DataField="Produto" HeaderText="Produto" SortExpression="Produto" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="Grid" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString %>" SelectCommand="SELECT [NomeAssunto], [SequenciaAssunto], [DescricaoAssunto], [Versao], [Produto] FROM [AssuntosInovacao]" DeleteCommand="DELETE FROM [AssuntosInovacao] WHERE [SequenciaAssunto] = @SequenciaAssunto" InsertCommand="INSERT INTO [AssuntosInovacao] ([NomeAssunto], [DescricaoAssunto], [Versao], [Produto]) VALUES (@NomeAssunto, @DescricaoAssunto, @Versao, @Produto)" UpdateCommand="UPDATE [AssuntosInovacao] SET [NomeAssunto] = @NomeAssunto, [DescricaoAssunto] = @DescricaoAssunto, [Versao] = @Versao, [Produto] = @Produto WHERE [SequenciaAssunto] = @SequenciaAssunto">
            <DeleteParameters>
                <asp:Parameter Name="SequenciaAssunto" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NomeAssunto" Type="String" />
                <asp:Parameter Name="DescricaoAssunto" Type="String" />
                <asp:Parameter Name="Versao" Type="Int32" />
                <asp:Parameter Name="Produto" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NomeAssunto" Type="String" />
                <asp:Parameter Name="DescricaoAssunto" Type="String" />
                <asp:Parameter Name="Versao" Type="Int32" />
                <asp:Parameter Name="Produto" Type="Int32" />
                <asp:Parameter Name="SequenciaAssunto" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </asp:Panel>
    <asp:Panel runat="server" Width="737px" Height="16px">
        <table>
            <tr>
                <td class="auto-style19" style="text-align: right">
                    <asp:Button ID="btnNovo" runat="server" Text="Novo" OnClick="btnNovo_Click"/>
                </td>
                <td style="text-align: right">
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
        <asp:SqlDataSource runat="server" ID="Detalhes" ConnectionString='<%$ ConnectionStrings:DwInovacaoConnectionString %>' SelectCommand="SELECT a.DescricaoAssunto, a.NomeAssunto, a.Produto, a.Versao, t.Titulo, t.NumeroTarefa, t.Cliente FROM AssuntosInovacao AS a INNER JOIN AssuntoTarefa AS aa ON aa.SequenciaAssunto = a.SequenciaAssunto INNER JOIN Tarefa AS t ON t.NumeroTarefa = aa.SequenciaTarefa WHERE (a.SequenciaAssunto = @sequenciaassunto)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="sequenciaassunto"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

