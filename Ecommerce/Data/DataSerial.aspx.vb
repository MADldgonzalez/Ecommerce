Imports System.Data.SqlClient

Public Class DataSerial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Form("__EVENTARGUMENT") = "CallSP" Then CallSP()
        '   If Request.Form("__EVENTARGUMENT") = "CallSP2" Then CallSP2()

        'If Request.querystring("__EVENTARGUMENT") = "foto" Then CallFoto()

        Dim h As String = Request.Form.Count
        Dim h2 As String = Request.QueryString.Count
    End Sub

    Sub CallSP()
        Dim listPara As List(Of param)


        Dim js As New System.Web.Script.Serialization.JavaScriptSerializer
        js.MaxJsonLength = Int32.MaxValue


        If Request.Form("param") Is Nothing = False Then
            listPara = js.Deserialize(Of List(Of param))(Request.Form("param"))
        Else
            listPara = New List(Of param)

        End If

        Dim paramcollection As New List(Of SqlParameter)

        For Each item As param In listPara

            paramcollection.Add(New SqlParameter("@" & item.ParaName, item.ParaValue))

        Next

        ' Response.ContentType = ("application/json")

        If Request.QueryString("Allow-Origin") = "1" Then Response.AddHeader("Access-Control-Allow-Origin", "*")


        Response.ContentType = ("application/json")
        Try
            Response.Write(spGetDt(Request.Form("spCall"), paramcollection))

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try

        Response.End()


        '  Response.Write(    spGetDt(Request.Form("spCall"), paramcollection)  )

        '      Response.End()


    End Sub

    Public Function spGetDt(ByVal spName As String, ByVal Parametros As List(Of SqlParameter)) As String

        Dim data As New DataSource
        Return data.spGetDtToSerial(spName, Parametros)

    End Function

End Class

Public Class param
    Dim _ParaName As String
    Dim _ParaValue As String


    Public Property ParaValue() As String

        Get
            Return Me._ParaValue
        End Get
        Set(ByVal value As String)
            Me._ParaValue = value
        End Set
    End Property

    Public Property ParaName() As String

        Get
            Return Me._ParaName
        End Get
        Set(ByVal value As String)
            Me._ParaName = value
        End Set
    End Property

End Class