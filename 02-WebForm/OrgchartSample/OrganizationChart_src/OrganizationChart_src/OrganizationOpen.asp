<%@ Language=VBScript %>
<%response.buffer=true%>
<HTML>

<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>

<%
CLDGHList=trim(Request.Form("SrDGHList"))
CLDGHOrder=trim(Request.Form("SrDGHOrder"))
CLDGHStartPt=trim(Request.Form("SrDGHStartPt"))
CLDGHEndPt=trim(Request.Form("SrDGHEndPt"))
CLDGHPosition=trim(Request.Form("SrDGHPosition"))
%>


<%
CLDDHList=trim(Request.Form("SrDDHList"))
CLDDHOrder=trim(Request.Form("SrDDHOrder"))
CLDDHStartPt=trim(Request.Form("SrDDHStartPt"))
CLDDHEndPt=trim(Request.Form("SrDDHEndPt"))
CLDDHPosition=trim(Request.Form("SrDDHPosition"))
%>

<%
CLSHList=trim(Request.Form("SrSHList"))
CLSHOrder=trim(Request.Form("SrSHOrder"))
CLSHPosition=trim(Request.Form("SrSHPosition"))
%>

<%
CLDEList=trim(Request.Form("SrDEList"))
CLDEPosition=trim(Request.Form("SrDEPosition"))
CLDEOrder=trim(Request.Form("SrDEOrder"))
CLDEStartPt=trim(Request.Form("SrDEStartPt"))
CLDEEndPt=trim(Request.Form("SrDEEndPt"))
%>


<%
CLDMList=trim(Request.Form("SrDMList"))
CLDMPosition=trim(Request.Form("SrDMPosition"))
CLDMOrder=trim(Request.Form("SrDMOrder"))
CLDMStartPt=trim(Request.Form("SrDMStartPt"))
CLDMEndPt=trim(Request.Form("SrDMEndPt"))
%>

<%
strExTemplatePath=Server.MapPath("OrgChartLans.xlt")
%>


<script language="vbscript">

Function OpenChart()

Dim strExcelPath 
Dim strMaclevel

strExcelPath=trim(document.OpenOrgChart.ExFile.value)
 
'strExcelPath="HTTP:\\localhost\OrgChart\OrgChartLans.xlt"

Set xlApp =CreateObject("Excel.Application")
Set xlBook=xlApp.WorkBooks.Add(strExcelPath)
Set xlSheet=xlBook.WorkSheets("OrgChart")

Dim DDHRow,SHRow,DDHCol,DGHCol

DGHPS=2
DDHPS=3
SHPS=4

ValDGHList=document.OpenOrgChart.INDGHList.value
ValDGHStartPt=document.OpenOrgChart.INDGHStartPt.value 
ValDGHEndPnt=document.OpenOrgChart.INDGHEndPt.value 
ValDGHPosition=document.OpenOrgChart.INDGHPosition.value
ArrDGHStartPnt=Split(ValDGHStartPt,",")
ArrDGHEndPnt=Split(ValDGHEndPnt,",")
ArrDGHList=Split(ValDGHList,",")
ArrDGHPos=Split(ValDGHPosition,",")

RowESpace=0
DGHRow=(DGHPS-1)
DDHRow=(DDHPS-1)
SHRow=(SHPS-1)	

Dim strDGH1
Dim ArrstrDGH1()
strDGH1=""

For i=LBound(ArrDGHList) to UBound(ArrDGHLIst)
	strDGH1=""
	DGHCol=cint(trim(ArrDGHPos(i)))
	strDGH1=trim(strDGH1) & trim(ArrDGHList(i))
	Redim Preserve ArrstrDGH1(i)
		IF not(len(strDGH1)=0)then
		ArrstrDGH1(i)=strDGH1
		else
		ArrstrDGH1(i)=0
		End if 
Next
strMaclevel="DGH"
xlApp.Run "MacroDrawBox",UBound(ArrDGHLIst),ArrstrDGH1,ArrDGHPos,DGHRow,strMaclevel

Dim strDDH1
Dim ArrstrDDH1()
strDDH1=""

ValDDHList=document.OpenOrgChart.INDDHList.value
ArrDDHList=Split(ValDDHList,",")
ValDDHPosition=document.OpenOrgChart.INDDHPosition.value
ArrDDHPos=Split(ValDDHPosition,",")

For i=LBound(ArrDDHList) to UBound(ArrDDHLIst)
	strDDH1=""
	DDHCol=cint(trim(ArrDDHPos(i))) 
	strDDH1=strDDH1 & ArrDDHList(i)
	Redim Preserve ArrstrDDH1(i)
	ArrstrDDH1(i)=strDDH1
Next

strMaclevel="DDH"	
xlApp.Run "MacroDrawBox",UBound(ArrDDHLIst),ArrstrDDH1,ArrDDHPos,DDHRow,strMaclevel
strConLevel="DGH"
xlApp.Run "mConnectors",UBound(ArrDGHLIst),ArrDGHStartPnt,ArrDGHEndPnt,strConLevel	

Dim strSH1,MacEDRow
Dim ArrstrSH1(),ArrstrDE(),ArrstrDM(),ArrDECol(),ArrDMCol(),ArrStartPtDE(), ArrEndPtDE()

strSH1=""
SHCol=0

ValSHList=document.OpenOrgChart.INSHList.value
ArrSHList=Split(ValSHList,",")

ValSHPosition=document.OpenOrgChart.INSHPosition.value
ArrSHPos=Split(ValSHPosition,",")

ValDEList=document.OpenOrgChart.INDEList.value 
ValDMList=document.OpenOrgChart.INDMList.value
ArrDMList=Split(ValDMList,",")
ArrDEList=Split(ValDEList,",") 
 
ValDMEndPt=document.OpenOrgChart.INDMEndPt.value
ValDEEndPt=document.OpenOrgChart.INDEEndPt.value
ArrDMEndPt=Split(ValDMEndPt,",")
ArrDEEndPt=Split(ValDEEndPt,",")


For i=LBound(ArrSHList) to UBound(ArrSHLIst) 
	
	Dim SEmptyDE
	Dim SEmptyDM
	SEmptyDE=-1
	SEmptyDM=-1
	strSH1=""
	strSH2="" 

		SHCol=cint(ArrSHPos(i))
		Redim Preserve ArrDECol(i)
		Redim Preserve ArrDMCol(i)
		ArrDECol(i)=SHCol-1
		ArrDMCol(i)=SHCol+1
		
		strSH1=trim(strSH1) & trim(ArrSHList(i))
		Redim Preserve ArrstrSH1(i)
		ArrstrSH1(i)=strSH1
		
		Dim strDE,strDM,strGroupDE,strGroupDM
		strGroupDE=""
		strGroupDM=""
		strDE=""
		strDM=""
		Redim Preserve ArrstrDE(i)
		Redim Preserve ArrstrDM(i)
		DMRow=SHRow 
		DERow=SHRow 
		MacEDRow = DMRow
		
		
		IF i=(LBound(ArrSHList)) then
			
			For T=1 to ArrDEEndPt(i+1) 
				strDE=""
				strDE=trim(strDE) & trim(ArrDEList(T-1))	
				strGroupDE=strGroupDE & "\" & strDE
				DERow=DERow  + RowESpace
			Next
		
			Redim Preserve ArrStartPtDE(i)
			Redim Preserve ArrEndPtDE(i)
			ArrStartPtDE(i)=1
			ArrEndPtDE(i)=ArrDEEndPt(i+1) 
			ArrstrDE(i)=strGroupDE
													
			
			For T=1 to ArrDMEndPt(i+1)
				strDM=""
				strDM=trim(strDM) & trim(ArrDMList(T-1))	
				strGroupDM=strGroupDM & "\" & strDM
				DMRow=DMRow + RowESpace
			Next
		
			Redim Preserve ArrStartPtDM(i)
			Redim Preserve ArrEndPtDM(i)
			ArrStartPtDM(i)=1
			ArrEndPtDM(i)=ArrDMEndPt(i+1) 
			ArrstrDM(i)=strGroupDM
		
		ELSE
		
			
			For T=(ArrDEEndPt(i)+1) to ArrDEEndPt(i+1)
				strDE=""
				strDE=trim(strDE) & trim(ArrDEList(T-1))
				strGroupDE=strGroupDE & "\" & strDE
				DERow=DERow  +  RowESpace
			Next
			
			Redim Preserve ArrStartPtDE(i)
			Redim Preserve ArrEndPtDE(i)
			ArrStartPtDE(i)=ArrDEEndPt(i)+1
			ArrEndPtDE(i)=ArrDEEndPt(i+1)
			ArrstrDE(i)=strGroupDE
			
			
			For T=(ArrDMEndPt(i)+1) to ArrDMEndPt(i+1)
			strDM=""
			strDM=strDM & ArrDMList(T-1)	
			strGroupDM=strGroupDM & "\" & strDM
			DMRow=DMRow + RowESpace
			Next
						
			Redim Preserve ArrStartPtDM(i)
			Redim Preserve ArrEndPtDM(i)
			ArrStartPtDM(i)=ArrDMEndPt(i)+1
			ArrEndPtDM(i)=ArrDMEndPt(i+1)
			ArrstrDM(i)=strGroupDM
		END IF
Next

ValDDHStartPnt=document.OpenOrgChart.INDDHStartPt.value 
ValDDHEndPnt=document.OpenOrgChart.INDDHEndPt.value 


Dim ArrDDHStartPnt,ArrDDHEndPnt
ArrDDHStartPnt=Split(ValDDHStartPnt,",")
ArrDDHEndPnt=Split(ValDDHEndPnt,",")


ECount=UBound(ArrSHLIst)
strMaclevel="SH"		
xlApp.Run "MacroDrawBox",ECount,ArrstrSH1,ArrSHPos,SHRow,strMaclevel
strConLevel="DDH"
xlApp.Run "mConnectors",UBound(ArrDDHLIst),ArrDDHStartPnt,ArrDDHEndPnt,strConLevel	

xlApp.Run "MacroDrawBoxED",ECount,ArrstrDE,ArrstrDM,MacEDRow,ArrDECol,ArrDMCol
xlApp.Run "mConnectorsED",ECount
xlApp.Run "mConnectorSubED",ECount,ArrStartPtDE, ArrEndPtDE, ArrStartPtDM, ArrEndPtDM

xlApp.visible=true

Set xlApp=Nothing
Set xlBook=Nothing
Set xlSheet=Nothing

document.OpenOrgChart.action="OrganizationCreate.asp" 
document.OpenOrgChart.submit()   

End Function

</script>

<form name="OpenOrgChart" method="post">
<BODY onload="OpenChart()" BGCOLOR= 708090>

<input type=hidden name="INDGHList" id="INDGHList" value="<%=CLDGHList%>">
<input type=hidden name="INDGHOrder" id="INDGHOrder" value="<%=CLDGHOrder%>">
<input type=hidden name="INDGHStartPt" id="INDGHStartPt" value="<%=CLDGHStartPt%>">
<input type=hidden name="INDGHEndPt" id="INDGHEndPt" value="<%=CLDGHEndPt%>">
<input type=hidden name="INDGHPosition" id="INDGHPosition" value="<%=CLDGHPosition%>">

<input type=hidden name="INDDHList" id="INDDHList" value="<%=CLDDHList%>">
<input type=hidden name="INDDHOrder" id="INDDHOrder" value="<%=CLDDHOrder%>">
<input type=hidden name="INDDHStartPt" id="INDDHStartPt" value="<%=CLDDHStartPt%>">
<input type=hidden name="INDDHEndPt" id="INDDHEndPt" value="<%=CLDDHEndPt%>">
<input type=hidden name="INDDHPosition" id="INDDHPosition" value="<%=CLDDHPosition%>">

<input type=hidden name="INSHList" id="INSHList" value="<%=CLSHList%>">
<input type=hidden name="INSHOrder" id="INSHOrder" value="<%=CLSHOrder%>">
<input type=hidden name="INSHPosition" id="INSHPosition" value="<%=CLSHPosition%>">

<input type=hidden name="INDMList" id="INDMList" value="<%=CLDMList%>">
<input type=hidden name="INDMEndPt" id="INDMEndPt" value="<%=CLDMEndPt%>">

<input type=hidden name="INDEList" id="INDEList" value="<%=CLDEList%>">
<input type=hidden name="INDEEndPt" id="INDEEndPt" value="<%=CLDEEndPt%>">
<input type=hidden name="ExFile" id="ExFile" value="<%=strExTemplatePath%>">

</BODY>
</form>
</HTML>
