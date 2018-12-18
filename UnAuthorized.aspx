<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UnAuthorized.aspx.cs" Inherits="EFT_Proj.UnAuthorized" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="color: Red; padding: 20px">        
        <asp:Label Text="" ID="message" runat="server" />
    </div>
</asp:Content>
