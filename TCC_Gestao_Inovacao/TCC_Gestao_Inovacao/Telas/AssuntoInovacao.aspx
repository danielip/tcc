<%@ Page Title="Cadastrar/editar assuntos de inovação" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AssuntoInovacao.aspx.cs" Inherits="TCC_Gestao_Inovacao.Telas.AssuntoInovacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        .auto-style9
        {
            height: 52px;
        }

        .auto-style11
        {
            height: 52px;
            width: 585px;
        }

        .auto-style13
        {
            width: 386px;
        }

        .auto-style15
        {
            width: 605px;
        }
        .auto-style16
        {
            height: 15px;
        }
        .auto-style17
        {
            height: 43px;
        }
        .auto-style19
        {
            width: 645px;
        }
        .auto-style20
        {
            width: 551px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="233px">
        <asp:Label ID="Label5" runat="server" Text="Cadastro de assuntos de inovação" Font-Bold="True"></asp:Label>
        <br />
        <table>
            <tr>
                <td nowrap="nowrap" class="auto-style16">
                    <asp:Label ID="Label2" runat="server" Text="Nome do assunto"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txbNome" runat="server" Width="443px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txbNome" ErrorMessage="Informe o nome"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label1" runat="server" Text="Descrição"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txbDescricao" runat="server" MaxLength="1000" Rows="3" Width="444px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Produto"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="ddlProduto" runat="server" AutoPostBack="True" DataSourceID="Produto" DataTextField="NomeProduto" DataValueField="SequenciaProduto">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Produto" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString %>" SelectCommand="SELECT * FROM [Produtos]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfvProduto" runat="server" ControlToValidate="ddlProduto" ErrorMessage="Informe o produto"></asp:RequiredFieldValidator>
                </td>
                <td nowrap="nowrap" class="auto-style9">
                    <asp:Label ID="Label4" runat="server" Text="Versão Liberação"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="ddlVersao" runat="server" AutoPostBack="True" DataSourceID="Versao" DataTextField="DescricaoVersao" DataValueField="SequenciaVersao">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Versao" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString %>" SelectCommand="SELECT [SequenciaVersao], [DescricaoVersao] FROM [VersaoLiberacao] WHERE ([Produto] = @Produto)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProduto" DefaultValue="2" Name="Produto" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlVersao" ErrorMessage="Informe a versão"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Height="328px">
        <asp:Label ID="lblTarefasRelacionadas" runat="server" Text="Tarefas relacionadas ao assunto de inovação" Font-Bold="True" Visible="false"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="NumeroTarefa" DataSourceID="Grid2" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False" Width="629px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="NumeroTarefa" HeaderText="Numero" ReadOnly="True" SortExpression="NumeroTarefa" />
                <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                <asp:BoundField DataField="VersaoOrigem" HeaderText="Versao Origem" SortExpression="VersaoOrigem" />
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
        <asp:SqlDataSource runat="server" ID="Grid2" ConnectionString='<%$ ConnectionStrings:DwInovacaoConnectionString %>' SelectCommand="SELECT t.NumeroTarefa, t.Titulo, t.Cliente, t.VersaoOrigem FROM AssuntosInovacao AS a INNER JOIN AssuntoTarefa AS aa ON aa.SequenciaAssunto = a.SequenciaAssunto INNER JOIN Tarefa AS t ON t.NumeroTarefa = aa.SequenciaTarefa WHERE (a.SequenciaAssunto = @sequenciaassunto)">
            <SelectParameters>
                <asp:SessionParameter SessionField="assuntoSelecionado" Name="sequenciaassunto"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="692px">
        <asp:Label ID="Label6" runat="server" Text="Relacionar tarefas ao assunto de inovação" Font-Bold="True"></asp:Label>
        <br />
        Filtros<br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Número"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txbNumeroTarefa" runat="server" Height="16px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Cliente"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txbCliente" runat="server" Width="341px" Height="16px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="auto-style15">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="0" DataSourceID="Tarefas" ForeColor="#333333" GridLines="None" EmptyDataText="Nenhum registro encontrado" Width="673px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <input id="chkAll" onclick="javascript: SelecionaTodosChecks(this);" runat="server" type="checkbox" />
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NumeroTarefa" HeaderText="Numero" SortExpression="NumeroTarefa" />
                            <asp:BoundField DataField="Natureza" HeaderText="Natureza" SortExpression="Natureza" />
                            <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                            <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                            <asp:BoundField DataField="VersaoOrigem" HeaderText="Versao Origem" SortExpression="VersaoOrigem" />
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
                    <asp:SqlDataSource ID="Tarefas" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString %>" SelectCommand="SELECT NumeroTarefa, Natureza, Titulo, Cliente, VersaoOrigem FROM Tarefa WHERE (Produto = @Produto) AND (Natureza = @natureza)  ORDER BY NumeroTarefa DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProduto" DefaultValue="2" Name="Produto" PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter DefaultValue="Implementação" Name="natureza" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <asp:Panel runat="server">
            <table>
                <tr>
                    <td class="auto-style20" style="text-align: right">
                        <asp:Button ID="Button1" runat="server" Text="Salvar" ValidateRequestMode="Enabled" OnClick="btnSalvar_Click" />
                    </td>
                     <td style="text-align: right">
                        <asp:Button ID="Button2" runat="server" Text="Cancelar" ValidateRequestMode="Enabled" OnClick="Button2_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="auto-style19">
                        <asp:Label ID="msg" runat="server" Text="" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

