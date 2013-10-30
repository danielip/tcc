<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastrarAlertas.aspx.cs" Inherits="TCC_Gestao_Inovacao.Telas.CadastrarAlertas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Cadastro de alertas para envio de e-mail automático"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SequenciaAlerta" DataSourceID="Alerta" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="DescricaoAlerta" HeaderText="Descrição" SortExpression="DescricaoAlerta"></asp:BoundField>
            <asp:BoundField DataField="TituloEmail" HeaderText="Titulo E-mail" SortExpression="TituloEmail"></asp:BoundField>
            <asp:BoundField DataField="Destinatarios" HeaderText="Destinatários" SortExpression="Destinatarios"></asp:BoundField>
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
    <asp:DetailsView ID="DetailsView1" runat="server" Height="123px" Width="449px" AutoGenerateRows="False" DataKeyNames="SequenciaAlerta" DataSourceID="Detalhes" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="DescricaoAlerta" HeaderText="Descrição" SortExpression="DescricaoAlerta"></asp:BoundField>
            <asp:BoundField DataField="TituloEmail" HeaderText="Titulo Email" SortExpression="TituloEmail"></asp:BoundField>
            <asp:BoundField DataField="RegraSelect" HeaderText="Regra" SortExpression="RegraSelect"></asp:BoundField>
            <asp:BoundField DataField="Destinatarios" HeaderText="Destinatarios" SortExpression="Destinatarios"></asp:BoundField>
            <asp:BoundField DataField="FrequenciaEnvio" HeaderText="Frequencia Envio" SortExpression="FrequenciaEnvio"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource runat="server" ID="Detalhes" ConnectionString='<%$ ConnectionStrings:DwInovacaoConnectionString %>' DeleteCommand="DELETE FROM [AlertasEmail] WHERE [SequenciaAlerta] = @SequenciaAlerta" InsertCommand="INSERT INTO [AlertasEmail] ([DescricaoAlerta], [TituloEmail], [RegraSelect], [Destinatarios], [FrequenciaEnvio]) VALUES (@DescricaoAlerta, @TituloEmail, @RegraSelect, @Destinatarios, @FrequenciaEnvio)" SelectCommand="SELECT * FROM [AlertasEmail] WHERE ([SequenciaAlerta] = @SequenciaAlerta)" UpdateCommand="UPDATE [AlertasEmail] SET [DescricaoAlerta] = @DescricaoAlerta, [TituloEmail] = @TituloEmail, [RegraSelect] = @RegraSelect, [Destinatarios] = @Destinatarios, [FrequenciaEnvio] = @FrequenciaEnvio WHERE [SequenciaAlerta] = @SequenciaAlerta">
        <DeleteParameters>
            <asp:Parameter Name="SequenciaAlerta" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DescricaoAlerta" Type="String"></asp:Parameter>
            <asp:Parameter Name="TituloEmail" Type="String"></asp:Parameter>
            <asp:Parameter Name="RegraSelect" Type="String"></asp:Parameter>
            <asp:Parameter Name="Destinatarios" Type="String"></asp:Parameter>
            <asp:Parameter Name="FrequenciaEnvio" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="SequenciaAlerta" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DescricaoAlerta" Type="String"></asp:Parameter>
            <asp:Parameter Name="TituloEmail" Type="String"></asp:Parameter>
            <asp:Parameter Name="RegraSelect" Type="String"></asp:Parameter>
            <asp:Parameter Name="Destinatarios" Type="String"></asp:Parameter>
            <asp:Parameter Name="FrequenciaEnvio" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="SequenciaAlerta" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="Alerta" ConnectionString='<%$ ConnectionStrings:DwInovacaoConnectionString %>' DeleteCommand="DELETE FROM [AlertasEmail] WHERE [SequenciaAlerta] = @SequenciaAlerta" InsertCommand="INSERT INTO [AlertasEmail] ([DescricaoAlerta], [TituloEmail], [RegraSelect], [Destinatarios], [FrequenciaEnvio]) VALUES (@DescricaoAlerta, @TituloEmail, @RegraSelect, @Destinatarios, @FrequenciaEnvio)" SelectCommand="SELECT * FROM [AlertasEmail]" UpdateCommand="UPDATE [AlertasEmail] SET [DescricaoAlerta] = @DescricaoAlerta, [TituloEmail] = @TituloEmail, [RegraSelect] = @RegraSelect, [Destinatarios] = @Destinatarios, [FrequenciaEnvio] = @FrequenciaEnvio WHERE [SequenciaAlerta] = @SequenciaAlerta">
        <DeleteParameters>
            <asp:Parameter Name="SequenciaAlerta" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DescricaoAlerta" Type="String"></asp:Parameter>
            <asp:Parameter Name="TituloEmail" Type="String"></asp:Parameter>
            <asp:Parameter Name="RegraSelect" Type="String"></asp:Parameter>
            <asp:Parameter Name="Destinatarios" Type="String"></asp:Parameter>
            <asp:Parameter Name="FrequenciaEnvio" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DescricaoAlerta" Type="String"></asp:Parameter>
            <asp:Parameter Name="TituloEmail" Type="String"></asp:Parameter>
            <asp:Parameter Name="RegraSelect" Type="String"></asp:Parameter>
            <asp:Parameter Name="Destinatarios" Type="String"></asp:Parameter>
            <asp:Parameter Name="FrequenciaEnvio" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="SequenciaAlerta" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
