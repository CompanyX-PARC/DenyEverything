<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendork.aspx.cs" Inherits="Concordia42.Calendork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/jquery-1.10.2.js"></script>
    <script src="/Scripts/jquery-1.10.2.js"></script>
    <script src="/Scripts/moment.js"></script>
    <script src="/Scripts/fullcalendar.min.js"></script>

    <div id="calendar"></div>

    <div class="container">
        <div class="row">
            <div class="center-block" id="currentTime"></div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            // the next two lines handle the current time and date
            var now = moment().format("dddd, MMMM Do YYYY, h:mm:ss a");
            document.getElementById("currentTime").innerHTML = now;
            
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            // the following function IS the calendar
            // quick note - IT'S RESPONSIVE!!!
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultView: 'month',
                slotMinutes: 15,
                minTime: "08:00:00", // effects week and day view
                maxTime: "17:00:00",
                contentHeight: 'auto', // calendar will grow auto-magically
                weekends: false, // will hide Saturdays and Sundays
                businessHours:  // true, display business hours
                {
                    start: '08:00',
                    end: '17:00',
                    dow: [1,2,3,4,5],
                },
                editable: true,
                fixedWeekCount: false, // # of weeks displayed depends on the month
                eventLimit: true, // for all non-agenda views; default 5 events
                views: {
                    agenda: {
                        eventLimit: 6 // adjust to 6 only for agendaWeek/agendaDay
                    }
                },
                events: [
                    {
                        title: 'CSC 191 Lecture',
                        start: '2015-05-21T09:00:00',
                        end: '2015-05-21T10:15:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 191 Team Meeting',
                        start: '2015-05-21T10:15:00',
                        end: '2015-05-21T10:45:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 191 Programming',
                        start: '2015-05-21T10:45:00',
                        end: '2015-05-21T12:00:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 20 Lecture',
                        start: '2015-05-21T12:00:00',
                        end: '2015-05-21T13:15:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 15 Lecture',
                        start: '2015-05-21T13:15:00',
                        end: '2015-05-21T14:30:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 60 Lecture',
                        start: '2015-05-21T14:30:00',
                        end: '2015-05-21T15:30:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 131 Lecture',
                        start: '2015-05-21T15:30:00',
                        end: '2015-05-21T16:00:00',
                        constraint: 'businessHours'
                    },
                    {
                        title: 'CSC 190 Lecture',
                        start: '2015-05-21T09:00:00',
                        end: '2015-05-21T10:15:00',
                        constraint: 'businessHours'
                    }
                ],
                events: "/api/Calendar/"
            })
        })
    </script>
</asp:Content>
