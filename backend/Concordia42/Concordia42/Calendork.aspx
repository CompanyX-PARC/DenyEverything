<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendork.aspx.cs" Inherits="Concordia42.Calendork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/jquery-1.10.2.js"></script>
    <script src="/Scripts/jquery-1.10.2.js"></script>
    <script src="/Scripts/moment.js"></script>
    <script src="/Scripts/fullcalendar.min.js"></script>
    <div id="calendar">

    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next,today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultView: 'month',
                editable: true,
                allDaySlot: false,
                selectable: true,
                slotMinutes: 15
            });
        })
</script>
</asp:Content>
