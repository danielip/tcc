<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroAssuntos.aspx.cs" Inherits="TCC_Gestao_Inovacao.Telas.CadastroAssuntos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                   <td>Produto
                        <asp:DropDownList ID="ddlProduto" runat="server" DataSourceID="ConexaoDw" DataTextField="DescricaoVersao" DataValueField="SequenciaVersao" AutoPostBack="True"></asp:DropDownList>
                    </td> 
                </tr>
                <tr>                    
                    <td>Versão
                        <asp:DropDownList ID="ddlVersao" runat="server" DataSourceID="ConexaoDw" DataTextField="DescricaoVersao" DataValueField="SequenciaVersao" AutoPostBack="True"></asp:DropDownList>
                    </td>
                </tr>
            </table>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ConexaoGrid" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="NomeAssunto" HeaderText="NomeAssunto" SortExpression="NomeAssunto" />
                    <asp:BoundField DataField="DescricaoAssunto" HeaderText="DescricaoAssunto" SortExpression="DescricaoAssunto" />
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
            
            <asp:SqlDataSource ID="ConexaoGrid" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString2 %>" SelectCommand="SELECT NomeAssunto, DescricaoAssunto, Versao, Produto FROM AssuntosInovacao"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="ConexaoDw" runat="server" ConnectionString="<%$ ConnectionStrings:DwInovacaoConnectionString2 %>" SelectCommand="SELECT [SequenciaVersao], [DescricaoVersao] FROM [VersaoLiberacao] WHERE ([Produto] = @Produto)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProduto" Name="Produto" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table style="vertical-align:middle">
                <tr>                   
                    <td>
                    <asp:Button ID="Button1" runat="server" Text="Novo"/>                 
                     </td>
                    <td>
                     <asp:Button ID="Button2" runat="server" Text="Editar" />
                    </td>
                </tr>                
            </table>
        </div>
    </form>
</body>
</html>
