<%@ Page Language="C#" AutoEventWireup="true" Title="Görev ve Proje Yönetimi" CodeBehind="WorkflowManagement.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.WorkflowManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>

<form id="form1" runat="server">
  <div class="container">
        <h2 class="my-4"><span style="color: rgb(38, 96, 247);">İş Akışı ve Görev Yönetim</span></h2>
        <section></section>
        <section></section>
        <section class="text-center">
            <div class="row">
                <div class="col text-end">
                    <h2 class="text-start section-header"><span style="color: rgb(239, 48, 197);">Mevcut Görevlerin Son Durumları</span></h2>
                    <input runat="server" id ="SearchInputDepartment" type="search" placeholder="Departmana Göre Ara" style="background-color: white;margin-bottom: 10px;"/>
                    <div style="text-align: center;">
                        <asp:GridView ID="GridViewMevcutGorevler" runat="server" CssClass="table">
                            <Columns>
                                <asp:BoundField DataField="GorevAdi" HeaderText="Görev Adı" />
                                <asp:BoundField DataField="Adim" HeaderText="Adım" />
                                <asp:BoundField DataField="Departman" HeaderText="Departman" />
                                <asp:BoundField DataField="Durum" HeaderText="Durum" />
                                <asp:BoundField DataField="BaslangicTarihi" HeaderText="Başlangıç Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="TamamlanmaTarihi" HeaderText="Tamamlanma Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <h2 class="section-header"><span style="color: rgb(247, 41, 66);">Devam Eden Görev Güncelleme</span></h2>
            <label class="form-label" for="workflowId">Devam etmek için iş akışı ismini seçiniz</label>

               <div style="text-align: center;">
                    <asp:DropDownList ID="DropDownListWorkflow" runat="server" 
                        CssClass="form-control" 
                        style="width: 100%; height: 50.6px; background-color: white; border: 1px solid #ced4da;">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label" for="DropDownListWorkflowStep">Adım</label>
                    <asp:DropDownList ID="DropDownListWorkflowStep" runat="server" 
                        CssClass="form-control" 
                        style="width: 100%; height: 50.6px; background-color: white; border: 1px solid #ced4da;">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label" for="workflowStatus">Durum</label>
                    <select class="form-control" id="workflowStatus" style="text-align: center;">
                        <option value="Devam Ediyor">Devam Ediyor</option>
                        <option value="Tamamlandı">Tamamlandı</option>
                        <option value="Bekliyor">Bekliyor</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="workflowStartDate">Başlangıç Tarihi</label>
                    <input runat="server" class="form-control form-control" type="date" id="WorkflowStartDate" style="text-align: center;"/></div>
                <div class="form-group"><label class="form-label" for="workflowEndDate">Tamamlanma Tarihi</label>
                    <input runat="server" class="form-control form-control" type="date" id="WorkflowEndDate" style="text-align: center;"/>
                    <div class="row">
                        <div class="col" style="text-align: center;">
                            <button runat="server" class="btn btn-warning fs-4 text-center" type="submit" style="background: rgb(255,186,7);color: rgb(255,255,255);margin-top: 10px;">Görev Güncelle</button></div>
                    </div>
                </div>
        </section>
        <div class="col" style="text-align: right;">
            <h2 class="text-start section-header"><span style="color: rgb(125, 132, 100);">Görev Listesi</span></h2>
            <input runat="server" id="SearchInputGorevAra" class="form-control-sm" type="search" placeholder="Görev ara" style="background-color: white;width: 250px;text-align: center;font-size: 20px;"/>
            <div style="text-align: center;">

                <asp:GridView ID="GridViewGorevListesi" runat="server" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="Baslik" HeaderText="Başlık" />
                    <asp:BoundField DataField="IliskiliDepartman" HeaderText="İlişkili Departman" />
                    <asp:BoundField DataField="Durum" HeaderText="Durum" />
                    <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" />
                    <asp:BoundField DataField="Adimlar" HeaderText="Adımlar" />
                </Columns>
            </asp:GridView>
            </div>

        </div>
        <section></section>
            <h2 class="text-start section-header"><span style="color: rgb(245, 140, 16);">Görev Ekle</span></h2>
            <div class="text-start form-group"><label class="form-label" for="taskTitle">Görev Başlığı</label>
                <input runat="server" class="form-control form-control" type="text" id="taskTitle" placeholder="Görev Adı" style="text-align: center;"/></div>

            <div class="text-start form-group"><label class="form-label" for="taskDescription">Açıklama</label>
                <textarea class="form-control form-control" id="taskDescription" placeholder="Görev Açıklaması" style="height: 80.6px;text-align: center;"></textarea></div>
            
            <div class="text-start form-group"><label class="form-label" for="taskStep">Adımlar</label>
                <textarea class="form-control form-control" id="taskSteps" placeholder="İzlenecek Adımlar(Satır Satır Giriniz Shift+Enter özelliğini kullanarak.)" style="height: 80.6px;text-align: center;"></textarea></div>
            
            <div class="text-start form-group"><label class="form-label" for="taskStartDate">Başlangıç Tarihi</label>
                <input runat="server" class="form-control form-control" type="date" id="taskStartDate"/></div>
            
            <div class="text-center form-group"><label class="form-label" for="taskAssignee">Sorumlu Ekip</label>
                <asp:DropDownList ID="DropDownListResponsibleDepartment" runat="server" 
                    CssClass="form-control" 
                    style="width: 100%; height: 50.6px; background-color: white; border: 1px solid #ced4da;">
                </asp:DropDownList>
            </div><button runat="server" class="btn btn-success btn-lg" style="margin-bottom: 10px;" type="submit">Görev Ekle</button>
    </div>
    </form>
</asp:Content>