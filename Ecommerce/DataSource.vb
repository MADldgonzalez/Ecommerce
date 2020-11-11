Imports System.Data.SqlClient
Public Class DataSource
    Public Function spGetDt(ByVal spName As String, ByVal Parametros As List(Of SqlParameter)) As DataTable


        Dim dt As New DataTable

        Dim da As New SqlDataAdapter("sp" & spName, "Server=DBServer;Database=ECOMMERCE;User Id=UserProfile;Password=U53rPr0f1L3._") 'DBserver
        'Dim da As New SqlDataAdapter("sp" & spName, "Server=DBServer-DEV;Database=ECOMMERCE;User Id=Desarrollo_Web;Password=Des_Web") 'DBServer-Dev


        'Dim da As New SqlDataAdapter("sp" & spName, "Server=dbserver;Database=equs;User Id=sa;Password=P&55W0rd._")
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.Parameters.AddRange(Parametros.ToArray)
        da.SelectCommand.CommandText = "sp" & spName

        da.Fill(dt)
        Return dt


    End Function

    Public Function spGetDtToSerial(ByVal spName As String, ByVal Parametros As List(Of SqlParameter)) As String

        '  dt = Conexion.SelectSqlDataTable("Sp" & spName, Parametros.ToArray, "iyu/7saowTtBbG/BS89SLiQ3KhBy9ykn0ZnKi55YYWvvYSU4GTDewjMSj3YbnPpbMfk0wdxtYGL8hcWH+FNcMzwkTkc7wngR" )
        '        dt = Conexion.SelectSqlDataTable("Sp" & spName, Parametros.ToArray, "gByS5YFkTjs8Gs+15QGm0yNNbbFU+4iJxBrhG9bqXYQ/Xw3KI2vkMcTsEa8idUEUy80/9TK8utIEAD42+xVnJCwJT52qH9Bn" )
        '   dt = Conexion.SelectSqlDataTable("Sp" & spName, Parametros.ToArray, "gByS5YFkTjvxzbGJ4Zu50pR9i8SPaoTh1qCVewB/dnAgzNw4/DcO94f3wQKR+XavimZBD2OhRqo=" )

        Dim dt As DataTable = spGetDt(spName, Parametros)


        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        serializer.MaxJsonLength = Int32.MaxValue

        Dim rows As New List(Of Dictionary(Of String, Object))()

        Dim row As Dictionary(Of String, Object) = Nothing
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            For Each dc As DataColumn In dt.Columns
                ' If dc.ColumnName.Trim() = "TAGNAME" Then
                row.Add(dc.ColumnName.Trim(), dr(dc))
                'End If
            Next
            rows.Add(row)
        Next
        Return serializer.Serialize(rows)



    End Function
End Class
