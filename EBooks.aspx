﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EBooks.aspx.cs" Inherits="ReaderZ_LMS.EBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <section class="section mt-5" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading mb-4">
                        <h1 class="font-weight-bold">Trending E-Books</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2  mt-3 mb-4 pb-1">
                    <asp:DropDownList ID="ddLangauge" runat="server" CssClass="h-100 w-100 p-2" AutoPostBack="True" OnSelectedIndexChanged="ddLangauge_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-10 mt-3 mb-4 text-right">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control w-50 d-inline border-secondary"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="ml-2 d-inline btn btn-primary mb-1" Text="Search Book" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                        <div>
                            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                                <ItemTemplate>
                                    <div class="item pb-5 pr-5">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li><a href="EBooks_Details.aspx?ID=<%# Eval("ID") %>" target="_blank"><i class="fa fa-eye"></i></a></li>
                                                    <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                                    <li><a href="single-product.html"><i class="fa fa-shopping-cart"></i></a></li>
                                                </ul>
                                            </div>
                                            <asp:Image ID="img" runat="server" Height="370px" Width="350px" ImageUrl='<%# Eval("Cover_Photo") %>' />
                                        </div>
                                        <div class="down-content">
                                            <h4>
                                                <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("EBook_Name") %>' Style="font-weight: bold; font-size: 25px; color: black"></asp:Label>
                                            </h4>
                                            <span>By <asp:Literal ID="lblAuthorName" runat="server" Text='<%# Eval("Author_Name") %>'></asp:Literal></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="margin-bottom: -7%; margin-top: 3%">
                <center>
                    <table>
                        <tr>
                            <td class="p-4">
                                <asp:Button ID="btnPrev" runat="server" Text="Previous Page" OnClick="btnPrev_Click" />
                            </td>
                            <td class="p-4">
                                <asp:Button ID="btnNext" runat="server" Text="Next Page" OnClick="btnNext_Click" style="height: 28px" />
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
        </div>
    </section>
</asp:Content>

