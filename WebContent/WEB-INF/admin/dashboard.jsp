<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agenda Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

    <!-- FullCalendar.io -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.0/fullcalendar.min.css" rel="stylesheet">
</head>

<body>

<div class="container-fluid" id="dashboard">

    <div class="half">
        <h1>Calendrier salle Hamilton</h1>
        <div id="calendar-container"  class="flex-1">
            <div id="calendar"></div>
        </div>
    </div>


    <div class="half-2">
        <form action="" method="post" class="">
            <div class="col-xs-12"><h3>Réservation manuelle</h3></div>
            <div class="col-xs-12 col-md-12">
                <div class="form-group">
                    <label for="title">Objet de la réservation</label>
                    <input type="text" class=" form-control" id="title"
                           placeholder="Objet de la réservation">
                </div>
                <div class="form-group">
                    <label for="member">Membre</label>
                    <select class=" form-control" id="member" placeholder="Membre">
                        <option value="">--------</option>
                        <option value="1">lortola</option>
                        <option value="1">alebel</option>
                        <option value="1">hbernardi</option>
                        <option value="1">etc...</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="member">Salle</label>
                    <select class=" form-control" id="room" placeholder="Salle">
                        <option value="0">Sans préférence</option>
                        <option value="1">Salle 1</option>
                        <option value="2">Salle 2</option>
                        <option value="3">Salle 3</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="datepicker">Horaire</label>

                    <div class="ia-widget">
                        <select class=" form-control" id="select-widget">
                            <option>Le plus tôt possible</option>
                            <option>La semaine prochaine</option>
                            <option>Le mois prochain</option>
                            <option value="4">Choisir date/horaire</option>
                        </select>
                    </div>

                    <div class="hour-widget hidden">
                        <input class=" form-control flex-2" type="text" id="datepicker"
                               placeholder="JJ/MM/AAAA"/>
                        <select class=" form-control flex-1" placeholder="Heure">
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                        </select>
                        <select class=" form-control flex-1" placeholder="Minute">
                            <option>00</option>
                            <option>15</option>
                            <option>30</option>
                            <option>45</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-12">
                <div class="form-group">
                    <label for="duree">Durée</label>
                    <select class=" form-control" id="duree" placeholder="Durée">
                        <option value="30">0h30</option>
                        <option value="60">1h00</option>
                        <option value="90">1h30</option>
                        <option value="120">2h00</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="people">Nombre de participants</label>
                    <select class=" form-control" id="people"
                            placeholder="Nombre de participants">
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>~15</option>
                        <option>~20</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Besoins supplémentaires</label>
                    <div class="form-group">
                        <label><input type="checkbox" value="tv"> Télévision</label><br>
                        <label><input type="checkbox" value="whiteboard"> Tableau blanc</label><br>
                        <label><input type="checkbox" value="pc"> PC</label><br>
                        <label><input type="checkbox" value="ethernet"> Internet via
                            ethernet</label><br>
                    </div>
                </div>
                <div class="text-right">
                    <button type="submit" class="btn btn-lg btn-success">Enregistrer</button>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- jQuery -->
<script src='http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- FullCalendar.io -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.0/fullcalendar.min.js"></script>

<script>
    $(document).ready(function () {

        // For the example
        var day = new Date(Date.now());
        day.setHours(12);
        day.setMinutes(0);
        // End example

        moment.locale('fr');

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next',
                center: 'title',
                right: 'agendaWeek,listWeek,listDay'
            },
            businessHours: {
                dow: [1, 2, 3, 4, 5], // Monday - Friday
                start: '09:00',
                end: '20:00'
            },
            views: {
                agendaWeek: {buttonText: 'Agenda semaine'},
                listDay: {buttonText: 'Liste jour'},
                listWeek: {buttonText: 'Liste semaine'}
            },

            defaultView: 'agendaWeek',
            navLinks: true, // can click day/week names to navigate views
            weekends: false,
            locale: 'fr',
            defaultDate: Date.now(),
            weekNumberCalculation: 'ISO',
            minTime: "09:00:00",
            maxTime: "20:00:00",
            editable: false,
            height: "parent",
            events: [
                {
                    title: 'DUP',
                    start: moment(day).subtract(1, 'days').subtract(4, 'hours'),
                    end: moment(day).subtract(1, 'days').subtract(2, 'hours')
                },
                {
                    title: 'Long Event',
                    start: day,
                    end: moment(day).add(2, 'hours'),
                    member: "hbernardi"
                },
                {
                    id: 999,
                    title: 'Sprint planning meeting',
                    start: '2017-03-29T16:00:00',
                    end: '2017-03-29T18:00:00',
                    member: "lortola"
                },
                {
                    title: 'Meeting',
                    start: '2017-03-30T10:30:00',
                    end: '2017-03-30T12:30:00',
                    member: "alebel"
                }
            ],
            eventRender: function (event, element) {
                if (event.member) {
                    element.children(".fc-content").append("<div><small>" + event.member + "</small></div>");
                    element.children(".fc-widget-content").last().append(" <small>" + event.member + "</small>");
                }
            }
        });
    });
</script>

</body>
</html>
