Sub GetDataFromFile()
    Dim FileToOpen As String
    Dim OpenBook As Workbook
    Dim MySheet As Worksheet
    Dim OpenSheet As Worksheet
    Dim TaxId As String
    Dim I As Integer
    Dim J As Integer
    Dim TargetLastRow As Long
    Dim LastRow As Long
    Dim sht As Worksheet

    Set MySheet = ActiveSheet
    LastRow = MySheet.Cells.Find("*", searchorder:=xlByRows, searchdirection:=xlPrevious).Row
    FileToOpen = Application.GetOpenFilename()
    If FileToOpen <> "False" Then
      Set OpenBook = Application.Workbooks.Open(FileToOpen)
        Set OpenSheet = OpenBook.ActiveSheet
        TargetLastRow = OpenSheet.Cells.Find("*", searchorder:=xlByRows, searchdirection:=xlPrevious).Row
        For I = 2 To LastRow
            TaxId = Trim(MySheet.Cells(I, 5).Value)
            For J = 2 To TargetLastRow
                If OpenSheet.Cells(J, 5).Value = TaxId Then
                MySheet.Cells(I, 8).Value = OpenSheet.Cells(J, 9).Value
                MySheet.Cells(I, 9).Value = OpenSheet.Cells(J, 7).Value
                MySheet.Cells(I, 10).Value = OpenSheet.Cells(J, 8).Value
                Exit For
                End If
            Next J
        Next I
       OpenBook.Close False
    Else
        MySheet.Cells(7, 18).Value = "Hiba a fájl betöltésekor."
    End If
    Application.ScreenUpdating = True
End Sub


Sub GetGrossFromFile()
    Dim FileToOpen As String
    Dim OpenBook As Workbook
    Dim MySheet As Worksheet
    Dim OpenSheet As Worksheet
    Dim Name As String
    Dim I As Integer
    Dim J As Integer
    Dim K As Integer
    Dim DateFrom As String
    Dim DateTo As String
    Dim DateBetween As String
    Dim TargetLastRow As Long
    Dim SZUM As Long
    Dim TargetRow As Integer
    Dim LastRow As Long
    Dim sht As Worksheet

    Set MySheet = ActiveSheet
    LastRow = MySheet.Cells.Find("*", searchorder:=xlByRows, searchdirection:=xlPrevious).Row
    FileToOpen = Application.GetOpenFilename()
    If FileToOpen <> "False" Then
      Set OpenBook = Application.Workbooks.Open(FileToOpen)
        Set OpenSheet = OpenBook.ActiveSheet
        TargetLastRow = OpenSheet.Cells.Find("*", searchorder:=xlByRows, searchdirection:=xlPrevious).Row
        For I = 2 To LastRow
            Name = Trim(MySheet.Cells(I, 2).Value)
            For J = 2 To TargetLastRow
                If Trim(OpenSheet.Cells(J, 2).Value) = Name Then
                TargetRow = J + 4
                SZUM = 0
                    DateFrom = Right(MySheet.Cells(I, 12).Value, 5)
                    DateTo = Right(MySheet.Cells(I, 13).Value, 5)
                For K = 1 To 62
                    DateBetween = Right(OpenSheet.Cells(1, K).Value, 5)
                    If DateBetween >= DateFrom And DateBetween <= DateTo Then
                    SZUM = SZUM + OpenSheet.Cells(TargetRow, K).Value
                    End If
                Next K
                
                MySheet.Cells(I, 16).Value = SZUM
                
                Exit For
                End If
            Next J
        Next I
        
       OpenBook.Close False
    Else
        MySheet.Cells(7, 18).Value = "Hiba a fájl betöltésekor."
    End If
    Application.ScreenUpdating = True
End Sub
