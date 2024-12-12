# Timed password generator in Classic ASP

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/b002370296f74fce8bf189ab7ca27fda)](https://app.codacy.com/gh/R0mb0/Timed_password_generator_classic_asp/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/R0mb0/Timed_password_generator_classic_asp)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/R0mb0/Timed_password_generator_classic_asp)
[![MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/license/mit)

[![Donate](https://img.shields.io/badge/PayPal-Donate%20to%20Author-blue.svg)](http://paypal.me/R0mb0)

## Class Logic
```mermaid
flowchart LR
    A[/Timed passowrd generator/] --> B{If}
    B --> |Password and timestamp file is present| C[Check date]
    B --> |Password and timestamp file is not present| D[Generate a file with a new password and the timestamp]
    C --> E{If}
    E --> |The date is older than one day| G[Genereate a new password and update the file]
    E --> |The date is not older than one day| F[/Return password/]
    D --> F
    G --> F
```

> "one day" is an example of time, in the class this parameter in editable

## `timed_password_generator.class.asp`'s avaible function

- Retrieve the password -> `Public Function Get_password()`

## How to use 

> From `timed_password_generator.class.asp`

1. Set class parameters
   ```
        path_of_file = "" '<-- Set param
        update_time = 1 '<-- Set param
        'Set one of this params
        'time_check = "yyyy" '<- Year
        'time_check = "q"    '<- Quarter
        'time_check = "m"    '<- Month
        'time_check = "y"    '<- Day of year
        time_check = "d"    '<- Day
        'time_check = "w"    '<- Weekday
        'time_check = "ww"   '<- Week of year
        'time_check = "h"    '<- Hour
        'time_check = "n"    '<- Minute
        'time_check = "s"    '<- Second
   ```
> From `Test.asp`

2. Initialize the class
   ```
    <%@LANGUAGE="VBSCRIPT"%>
    <!--#include file="timed_password_generator.class.asp"-->
    <%
        Dim my_psw
        Set my_psw = new timed_password_generator
   ```
3. Retrieve the password
   ```
        Response.write("<h1> Password of the day: </h1><br>")
        Response.write(my_psw.Get_password())
    %> 
   ```

### A part of this project was inspired by [Salman's Web Development Blog](https://salman-w.blogspot.com/2009/06/generate-random-strings-using.html)
