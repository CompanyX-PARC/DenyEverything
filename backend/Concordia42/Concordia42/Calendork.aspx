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
                minTime: "08:00:00", // effects week and day view
                maxTime: "17:00:00",
                contentHeight: 'auto', // calendar will grow auto-magically
                weekends: false, // will hide Saturdays and Sundays
                businessHours:  // true, display business hours
                {
                    start: '08:00',
                    end: '17:00',
                    dow: [1, 2, 3, 4, 5],
                },
                editable: true,
                fixedWeekCount: false, // # of weeks displayed depends on the month
                defaultView: 'agendaDay',
                editable: true,
                allDaySlot: false,
                selectable: true,
                slotMinutes: 15,
                events: '/api/Calendar'
            });
        })
</script>
</asp:Content>
