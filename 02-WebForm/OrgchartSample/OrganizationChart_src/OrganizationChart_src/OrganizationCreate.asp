<%@ Language=VBScript %>
<%response.buffer=true%>

<HTML>

<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<script language="javascript">
function fOpenChart()
{
document.OrgCreate.action ="OrganizationOpen.asp";
document.OrgCreate.submit();  
}
</script>

<form name="OrgCreate" method=post>
<BODY  bgcolor=708090 >
<BR>
<BR>
<BR>
<BR>

<center>
<FONT color=00FFFF  size=5 style="FONT-STYLE:ARIAL FONT-SIZE:20px">
<I><B>Organization Chart</B></I>
</FONT>

<BR>
<BR>
<BR>

<input type=button id=OpenOrgChart name=OpenOrgChart value="Generate Organization Chart" onclick="fOpenChart()">
</center>

<%
		dim strSQL,sconn,SQLConnect,SQLRecordSet
		Response.Buffer=true
		src=server.MapPath("dbOrganizationChart.mdb")
		sconn="provider=microsoft.jet.oledb.4.0;data source=" & src
		set SQLConnect=server.createobject("adodb.connection")
		SQLConnect.open sconn
		
%>

<%

Dim VDE,VDM,strSQLDGH,strSQLDDH,strSQLSH,strSQLDE,strSQLDM

VDE="DE"
VDM="DM"

	strSelDGH="DGH" 
	
	'STARTING FROM TOP MANAGEMENT LEVEL
	'START AND END LEVEL CAN BE DECIDED BY THE USER
	
	strSQLDGH="select distinct(DGH) from tblOrganizationChart where dgh='" & strSelDGH & "'"
	strSQLDDH="select distinct(DDH),DGH from tblOrganizationChart where dgh='" & strSelDGH & "'"
	strSQLSH="select distinct(SH),DGH,DDH from tblOrganizationChart where dgh='" & strSelDGH & "' order by DDH"
	
	strSQLDE="select * from tblOrganizationChart where ISODesignation='" & VDE & "' and dgh='" & strSelDGH & "' order by DDH,SH,cadre,EmpID"
	strSQLDM="select * from tblOrganizationChart where ISODesignation='" & VDM & "' and dgh='" & strSelDGH & "' order by DDH,SH,cadre,EmpID"

%>

<%
	Dim numOrderDGH
	numOrderDGH=0
		
	Dim ArrDGH()
	Dim ArrOrderDGH()
	Dim CntDGH		
	CntDGH=0
	
			Set SQLRecordSetDGH=Server.CreateObject("ADODB.RecordSet")
			SQLRecordSetDGH.CursorType=adOpenStatic  
			SQLRecordSetDGH.Open strSQLDGH,SQLConnect
	
			With SQLRecordSetDGH
				Do while not .EOF 
				CntDGH=CntDGH+1
				strDGH=trim(.Fields("DGH")) 
				numOrderDGH=numOrderDGH + 1
				Redim Preserve ArrDGH(CntDGH)
				Redim Preserve ArrOrderDGH(CntDGH)
				ArrDGH(CntDGH)=strDGH
				ArrOrderDGH(CntDGH)=numOrderDGH
				.MoveNext	
				loop
			End With
	
			SQLRecordSetDGH.Close 
			Set SQLRecordSetDGH=Nothing
	
				
	Set SQLRecordSetDDH=Server.CreateObject("ADODB.RecordSet")
	SQLRecordSetDDH.CursorType=adOpenStatic  
	SQLRecordSetDDH.Open strSQLDDH,SQLConnect

	Dim numOrderDDH
	numOrderDDH=0
	
	Dim ArrDDH()
	Dim ArrOrderDDH()
	Dim ArrDGHEndGrp()
	Dim CntDDH		
	CntDDH=0
			
	With SQLRecordSetDDH
		Do while not .EOF 
		CntDDH=CntDDH+1
		DDHDGH=trim(.Fields("DGH"))
			For G=LBound(ArrDGH) to UBound(ArrDGH)
				IF (trim(ArrDGH(G))=trim(DDHDGH)) then
				Redim Preserve ArrDGHEndGrp(G)
					ArrDGHEndGrp(G)=CntDDH
				End IF 		
			Next
		strDDH=trim(.Fields("DDH")) 
		numOrderDDH=numOrderDDH + 1
		Redim Preserve ArrDDH(CntDDH)
		Redim Preserve ArrOrderDDH(CntDDH)
		ArrDDH(CntDDH)=strDDH
		ArrOrderDDH(CntDDH)=numOrderDDH
		.MoveNext	
		loop
	End With
	
	SQLRecordSetDDH.Close 
	Set SQLRecordSetDDH=Nothing

	
	Set SQLRecordSetSH=Server.CreateObject("ADODB.RecordSet")
	
	SQLRecordSetSH.CursorType=adOpenStatic  
	SQLRecordSetSH.Open strSQLSH,SQLConnect

	Dim numOrderSH
	numOrderSH=0
	
	Dim ArrSH()
	Dim ArrOrderSH()
	Dim ArrDDHEndGrp()
	Dim CntSH		
	CntSH=0
	Dim strSHDataFlg
	strSHDataFlg="Failed"
	
	With SQLRecordSetSH
		Do while not .EOF 
		CntSH=CntSH+1
		SHDDH=trim(.Fields("DDH"))
			For G=LBound(ArrDDH) to UBound(ArrDDH)
				IF (trim(ArrDDH(G))=trim(SHDDH)) then
				Redim Preserve ArrDDHEndGrp(G)
					ArrDDHEndGrp(G)=CntSH
				End IF 		
			Next
		strSH=trim(.Fields("SH")) 
		numOrderSH=numOrderSH + 1
		Redim Preserve ArrSH(CntSH)
		Redim Preserve ArrOrderSH(CntSH)
		ArrSH(CntSH)=strSH
		ArrOrderSH(CntSH)=numOrderSH
		strSHDataFlg="Success"
		.MoveNext	
		loop
	End With
	
	SQLRecordSetSH.Close 
	Set SQLRecordSetSH=Nothing
	
			
	Set SQLRecordSetDE=Server.CreateObject("ADODB.RecordSet")
	
	SQLRecordSetDE.CursorType=adOpenStatic  
	SQLRecordSetDE.Open strSQLDE,SQLConnect

	Dim numOrderDE
	numOrderDE=0
	
	Dim ArrDE()
	Dim ArrOrderDE()
	Dim ArrDESHEndGrp()
	Dim CntDE		
	CntDE=0
	Dim ArrDESHSuccess()
	Dim CntDESHSuccess
	CntDESHSuccess=0
	
	With SQLRecordSetDE
		Do while not .EOF 
		CntDE=CntDE+1
		DESH=trim(.Fields("SH"))
			For G=LBound(ArrSH) to UBound(ArrSH)
				IF (trim(ArrSH(G))=trim(DESH)) then
				Redim Preserve ArrDESHEndGrp(G)
					ArrDESHEndGrp(G)=CntDE
				Redim Preserve ArrDESHSuccess(CntDESHSuccess)
				ArrDESHSuccess(CntDESHSuccess)=G
				CntDESHSuccess=CntDESHSuccess + 1	
				End IF 		
			Next
		strDE=trim(.Fields("EmpID")) 
		numOrderDE=numOrderDE + 1
		Redim Preserve ArrDE(CntDE)
		Redim Preserve ArrOrderDE(CntDE)
		ArrDE(CntDE)=strDE
		ArrOrderDE(CntDE)=numOrderDE
		.MoveNext	
		loop
	End With
	
	SQLRecordSetDE.Close 
	Set SQLRecordSetDE=Nothing
	

		
	Set SQLRecordSetDM=Server.CreateObject("ADODB.RecordSet")
	
	SQLRecordSetDM.CursorType=adOpenStatic  
	SQLRecordSetDM.Open strSQLDM,SQLConnect

	Dim numOrderDM
	numOrderDM=0
	
	Dim ArrDM()
	Dim ArrOrderDM()
	Dim ArrDMSHEndGrp()
	Dim CntDM		
	CntDM=0
	Dim ArrDMSHSuccess()
	Dim CntDMSHSuccess
	CntDMSHSuccess=0
	
	With SQLRecordSetDM
		Do while not .EOF 
		CntDM=CntDM+1
		DMSH=trim(.Fields("SH"))
			For G=LBound(ArrSH) to UBound(ArrSH)
				IF (trim(ArrSH(G))=trim(DMSH)) then
				Redim Preserve ArrDMSHEndGrp(G)
					ArrDMSHEndGrp(G)=CntDM
				Redim Preserve ArrDMSHSuccess(CntDMSHSuccess)
					ArrDMSHSuccess(CntDMSHSuccess)=G
					CntDMSHSuccess=CntDMSHSuccess+1	
				End IF
			Next
			
		strDM=trim(.Fields("EmpID")) 
		numOrderDM=numOrderDM + 1
		Redim Preserve ArrDM(CntDM)
		Redim Preserve ArrOrderDM(CntDM)
		ArrDM(CntDM)=strDM
		ArrOrderDM(CntDM)=numOrderDM
		.MoveNext	
		loop
	End With
		
	SQLRecordSetDM.Close 
	Set SQLRecordSetDM=Nothing
	
	
%>


<%
Dim INPosition
Dim ArrSHPosition(),ArrDDHPosition(),ArrDGHPosition()
INPosition=1
%>

<%
Dim SHX
For T=1 to CntSH
	Redim Preserve ArrSHPosition(T)
	SHX=ArrOrderSH(T)
	ArrSHPosition(T)=(3 * (SHX))- 1 
%>	
<input type=hidden name=SrSHList id=SrSHList value="<%=ArrSH(T)%>"> 
<input type=hidden name=SrSHOrder id=SrSHOrder value="<%=ArrOrderSH(T)%>"> 
<input type=hidden name=SrSHPosition id=SrSHPosition value="<%=ArrSHPosition(T)%>">
<%
Next
%>

<%
For T=1 to CntDDH
	IF T=1 then
	%>
	<input type=hidden name=SrDDHStartPt id=SrDDHStartPt value="<%=INPosition%>"> 
	<%
	Else
	%>
	<input type=hidden name=SrDDHStartPt id=SrDDHStartPt value="<%=ArrDDHEndGRp(T-1)+1%>"> 
	<%
	End If

	Redim Preserve ArrDDHPosition(T)

	If T=1 then
	ArrDDHPosition(T)=(ArrSHPosition(INPosition)+ArrSHPosition(ArrDDHEndGrp(T)))/2
	else
	ArrDDHPosition(T)=(ArrSHPosition(ArrDDHEndGrp(T-1)+1)+ArrSHPosition(ArrDDHEndGrp(T)))/2
	end if
	
%>
<input type=hidden name=SrDDHList id=SrDDHList value="<%=ArrDDH(T)%>"> 
<input type=hidden name=SrDDHOrder id=SrDDHOrder value="<%=ArrOrderDDH(T)%>"> 
<input type=hidden name=SrDDHEndPt id=SrDDHEndPt value="<%=ArrDDHEndGrp(T)%>"> 
<input type=hidden name=SrDDHPosition id=SrDDHPosition value="<%=ArrDDHPosition(T)%>"> 
<%
Next
%>

<%
For T=1 to CntDGH
	IF T=1 then
	%>
	<input type=hidden name=SrDGHStartPt id=SrDGHStartPt value="<%=INPosition%>"> 
	<%
	Else
	%>
	<input type=hidden name=SrDGHStartPt id=SrDGHStartPt value="<%=ArrDGHEndGRp(T-1)+1%>"> 
	<%
	End If
	Redim Preserve ArrDGHPosition(T)
	ArrDGHPosition(T)=(ArrDDHPosition(ArrDGHEndGrp(T-1)+1)+ArrDDHPosition(ArrDGHEndGrp(T)))/2
%>	
<input type=hidden name=SrDGHList id=SrDGHList value="<%=ArrDGH(T)%>"> 
<input type=hidden name=SrDGHOrder id=SrDGHOrder value="<%=ArrOrderDGH(T)%>"> 
<input type=hidden name=SrDGHEndPt id=SrDGHEndPt value="<%=ArrDGHEndGrp(T)%>"> 
<input type=hidden name=SrDGHPosition id=SrDGHPosition value="<%=ArrDGHPosition(T)%>"> 
<%
Next
%>

<%
For T=1 to CntDE
Redim Preserve ArrDEPosition(T)
ArrDEPosition(T)=ArrOrderDE(T) 
%>
<input type=hidden name=SrDEList id=SrDEList value="<%=ArrDE(T)%>"> 
<input type=hidden name=SrDEOrder id=SrDEOrder value="<%=ArrOrderDE(T)%>"> 
<input type=hidden name=SrDEPosition id=SrDEPosition value="<%=ArrDEPosition(T)%>">
<%
Next
%>

<%
For k=LBound(ArrDESHEndGrp) to UBound(ArrDESHEndGrp)
	IF k=LBound(ArrDESHEndGrp) then
%>
	<input type=hidden name=SrDEStartPt id=SrDEStartPt value="<%=INPosition%>"> 
<%
	Else
%>
	<input type=hidden name=SrDEStartPt id=SrDEStartPt value="<%=ArrDESHEndGrp(k-1)+1%>"> 
<%
	End if
%>	
<input type=hidden name=SrDEEndPt id=SrDEEndPt value="<%=ArrDESHEndGrp(k)%>">
<%
Next 
%>

<%
For T=1 to CntDM
Redim Preserve ArrDMPosition(T)
ArrDMPosition(T)=ArrOrderDM(T) 
%>
<input type=hidden name=SrDMList id=SrDMList value="<%=ArrDM(T)%>"> 
<input type=hidden name=SrDMOrder id=SrDMOrder value="<%=ArrOrderDM(T)%>"> 
<input type=hidden name=SrDMPosition id=SrDMPosition value="<%=ArrDMPosition(T)%>">
<%
Next
%>

<%
For k=LBound(ArrDMSHEndGrp) to UBound(ArrDMSHEndGrp)
	IF k=LBound(ArrDMSHEndGrp) then
%>
	<input type=hidden name=SrDMStartPt id=SrDMStartPt value="<%=INPosition%>"> 
<%
	Else
%>
	<input type=hidden name=SrDMStartPt id=SrDMStartPt value="<%=ArrDMSHEndGrp(k-1)+1%>"> 
<%
	End if
%>	
<input type=hidden name=SrDMEndPt id=SrDMEndPt value="<%=ArrDMSHEndGrp(k)%>">
<%
Next 
%>

</BODY>
</Form>
</HTML>
