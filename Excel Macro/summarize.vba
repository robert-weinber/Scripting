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

         ActiveSheet.Cells(Next_row, 1).Value = "Azonos�t�"
         ActiveSheet.Cells(Next_row, 2).Value = "N�v"
         ActiveSheet.Cells(Next_row, 3).Value = "D�tum"
         ActiveSheet.Cells(Next_row, 4).Value = "Beoszt�s"
         ActiveSheet.Cells(Next_row, 5).Value = "Beosztott �ra"
         ActiveSheet.Cells(Next_row, 6).Value = "Jelenl�t nap"
         ActiveSheet.Cells(Next_row, 7).Value = "Jelenl�t �ra"
         ActiveSheet.Cells(Next_row, 8).Value = "Munkasz�m"
         
         Next_row = Next_row + 1
         For I = 1 To WS_Count
            If ActiveWorkbook.Worksheets(I).Range("A1") = "ad�azonos�t�" Then
            
            J = 0
         For J = 1 To 50
         
         If ActiveWorkbook.Worksheets(I).Cells(J, 2).Value = "m�szak" Then
         
elso = J + 1
End If
If ActiveWorkbook.Worksheets(I).Cells(J, 1).Value = "Ledolgozott �ra" Then
utolso = J - 1

End If
         Next J
         J = 0

         
        For J = 1 To utolso - elso + 1
        
            ActiveSheet.Cells(Next_row, 1).Value = ActiveWorkbook.Worksheets(I).Range("B1")
            ActiveSheet.Cells(Next_row, 2).Value = ActiveWorkbook.Worksheets(I).Range("B2")
            ActiveSheet.Cells(Next_row, 3).Value = ActiveWorkbook.Worksheets(I).Cells(J + elso - 1, 1).Value
            ' Ha feh�r, X k�l�nben P
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
         
 '        Else: MsgBox "A f�l nem �res"
'End If
End Sub
