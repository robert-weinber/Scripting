Sub asfa()
'If WorksheetFunction.CountA(ActiveSheet.UsedRange) = 0 And ActiveSheet.Shapes.Count = 0 Then
Dim WS_Count As Integer
Dim Next_row As Integer
Dim I As Integer
Dim J As Integer
Dim K As Integer
Dim elso As Integer
Dim utolso As Integer
WS_Count = ActiveWorkbook.Worksheets.Count
Next_row = 1

         ActiveSheet.Cells(Next_row, 1).Value = "Azonosító"
         ActiveSheet.Cells(Next_row, 2).Value = "Név"
         ActiveSheet.Cells(Next_row, 3).Value = "Dátum"
         ActiveSheet.Cells(Next_row, 4).Value = "Beosztás"
         ActiveSheet.Cells(Next_row, 5).Value = "Beosztott óra"
         ActiveSheet.Cells(Next_row, 6).Value = "Jelenlét nap"
         ActiveSheet.Cells(Next_row, 7).Value = "Jelenlét óra"
         ActiveSheet.Cells(Next_row, 8).Value = "Munkaszám"
         
         Next_row = Next_row + 1
         For I = 1 To WS_Count
            If ActiveWorkbook.Worksheets(I).Range("A1") = "adóazonosító" Then
            
            J = 0
         For J = 1 To 50
         
         If ActiveWorkbook.Worksheets(I).Cells(J, 2).Value = "mûszak" Then
         
elso = J + 1
End If
If ActiveWorkbook.Worksheets(I).Cells(J, 1).Value = "Ledolgozott óra" Then
utolso = J - 1

End If
         Next J
         J = 0

         
        For J = 1 To utolso - elso + 1
        
            ActiveSheet.Cells(Next_row, 1).Value = ActiveWorkbook.Worksheets(I).Range("B1")
            ActiveSheet.Cells(Next_row, 2).Value = ActiveWorkbook.Worksheets(I).Range("B2")
            ActiveSheet.Cells(Next_row, 3).Value = ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 1).Value
            ' Ha fehér, X különben P
            If ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 1).Interior.ColorIndex = -4142 Then
            ActiveSheet.Cells(Next_row, 4).Value = "X"
            Else: ActiveSheet.Cells(Next_row, 4).Value = "P"
            End If
            
            
            If ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 4).Value = "" Then
            ActiveSheet.Cells(Next_row, 5).Value = 0
            Else: ActiveSheet.Cells(Next_row, 5).Value = ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 4).Value
            End If
            
            If ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 3).Value = "" Then
            ActiveSheet.Cells(Next_row, 6).Value = ActiveSheet.Cells(Next_row, 4).Value
            Else: ActiveSheet.Cells(Next_row, 6).Value = ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 3).Value
            End If
            
            If ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 4).Value = "" Then
            ActiveSheet.Cells(Next_row, 7).Value = 0
            Else: ActiveSheet.Cells(Next_row, 7).Value = ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 4).Value
            End If
            ActiveSheet.Cells(Next_row, 8).Value = ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 9).Value
            Next_row = Next_row + 1
         Next J
         
            
            
            End If

         Next I
         
 '        Else: MsgBox "A fül nem üres"
'End If
End Sub
