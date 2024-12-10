<% 
Class timed_password_generator

    'Setting parameters'
    Dim path_of_file
    Dim update_time

    'my values'
    Dim path
    Dim password
    Dim current_timestamp 

    ' Initialization and destruction'
	sub class_initialize()
        path_of_file = "" '<-- Set param
        update_time = 1 '<-- Set param

        path = path_of_file + "pw_generated.txt"
	end sub
	
	sub class_terminate()
		path_of_file = Null 
        update_time = Null 
	end sub

    'Private subs
    Private Sub Generate_password()
        'Code taken from https://salman-w.blogspot.com/2009/06/generate-random-strings-using.html
        Randomize()

        Dim characterSetArray
        'Here, password length'
        characterSetArray = Array(_
            Array(5, "abcdefghijklmnopqrstuvwxyz"), _
            Array(2, "ABCDEFGHIJKLMNOPQRSTUVWXYZ"), _
            Array(2, "0123456789"), _
            Array(2, "!@#$+-*&?:") _
        )

        Dim i
        Dim j
        Dim count
        Dim chars
        Dim index
        Dim temp

        For i = 0 To UBound(characterSetArray)

            count = characterSetArray(i)(0)
            chars = characterSetArray(i)(1)

            For j = 1 To count

                index = Int(Rnd() * Len(chars)) + 1
                temp = temp & Mid(chars, index, 1)

            Next

        Next

        Dim tempCopy

        do until Len(temp) = 0

            index = Int(Rnd() * Len(temp)) + 1
            tempCopy = tempCopy & Mid(temp, index, 1)
            temp = Mid(temp, 1, index - 1) & Mid(temp, index + 1)

        loop

        password = tempCopy 
    End Sub

    Private Sub Write_file()
        Dim fs,f
        Set fs=Server.CreateObject("Scripting.FileSystemObject")
        Set f=fs.CreateTextFile(path,true)
        f.WriteLine(current_timestamp)
        f.WriteLine(password)
        f.close
        Set f=Nothing
        Set fs=Nothing
    End Sub
    
    ' Public function
    Public Function Get_password()
        'Check if file is present'
        If FileSystemObject.FileExists(path) Then 
            current_time = Now()
            Dim fs, t, temp_date, temp_psw
            set fs=Server.CreateObject("Scripting.FileSystemObject")
            set t=fs.OpenTextFile(path,1,false) 
            temp_time = t.ReadLine()
            temp_psw = t.ReadLine()
            t.close
            Set fs=Nothing
            Set t=Nothing
            If DateDiff("d",temp_time,current_timestamp) >=  update_time Then 
                Generate_password()
                Write_file()
            Else
                Get_password = temp_psw
                Exit Function
            End If 
        Else
            Generate_password()
            current_timestamp = Now()
            Write_file()
        End If
        Get_password = password
    End Function

End Class 
%>