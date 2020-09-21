$(document).ready(function(){

    $("#btnOrganization").on("click", function (e) {
        $.ajax({
            type: "POST",
            url: $('#GetOrganizationData').val(),
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess_getOrgData,
            error: OnErrorCall_getOrgData
        });        

        function OnSuccess_getOrgData(repo) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Name');
            data.addColumn('string', 'Manager');
            data.addColumn('string', 'ToolTip');

            var response = repo.orgData;
            for (var i = 0; i < response.length; i++) {
                var row = new Array();
                var empName = response[i].Employee;
                var mgrName = response[i].Manager;
                var empID = response[i].empID;
                var mgrID = response[i].mgrID;
                var designation = response[i].designation;

                data.addRows([[{
                    v: empID,
                    f: empName
                }, mgrID, designation]]);
            }

            var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
            chart.draw(data, { allowHtml: true });
        }

        function OnErrorCall_getOrgData() {
            console.log("Whoops something went wrong :( ");
        }
        e.preventDefault();
    });
});

google.charts.load('current', { packages: ["orgchart"] });
google.charts.setOnLoadCallback(OnSuccess_getOrgData);