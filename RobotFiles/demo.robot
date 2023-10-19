*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    XML
Library    OperatingSystem
Library    Process
Test Setup    Create Data For Tests    #This would run anytime we run the test suite. This particular one would create the data for the tests 


*** Variables ***
${one}    Donald
${two}    Duck
@{list}    1    2    3    4

*** Keywords ***
Create Data For Tests
#By creating this keyword, you can call them in any test cases. 
    @{names}=    Create List    Donald    Mickey    Goofy    Scrooge    Daisy
    Set Test Variable    ${names}

*** Test Cases ***

test1
    Should Be Equal    1    1

Check outcome
    ${three}=    Set Variable    Donald Duck
    Should Be Equal    ${three}    ${one} ${two}

*** Test Cases ***
Ask User Input
   ${user}=    Get Value From User    Please input your text
    Should Be Equal    ${user}    Hello World

*** Test Cases ***
Check value from list
    ${number}=    Set Variable    ${list}[2]
    Should Be Equal    ${number}    3

*** Test Cases ***
Add value to the list
    #Local version from grobal variable (NOTE: The name could be changed to avoid confusion but it is possible to use same name)
    @{list}=    Copy List    ${list}
    ${addition}=    Set Variable    333
    Append To List    ${list}   ${addition}
    Log    ${list}
    Should Be Equal    ${list}[4]    ${addition}

*** Test Cases ***
Test list length
    ${length}=    Get Length    ${list}
    ${expectedResult}=    Convert To Integer    4
    #Should Be Equal    ${length}    4    #This gave an error or failed because the 4 was a string 
    Should Be Equal    ${length}    ${expectedResult}

*** Test Cases ***
Put list in alphabetical order
    Log    ${names}
    Sort List    ${names}
    Log    ${names}
    Should Be Equal    ${names}[0]    Daisy     #Logging is basically to show what the outcome is. It is not necessary but helpful

*** Test Cases ***
Remove from list test
    Remove From List    ${names}    0
    Log    ${names}
    Should Be Equal    ${names}[0]    Mickey



*** Test Cases ***
Loop the list
    FOR    ${element}    IN    @{names}
        Log    ${element}
        ${new}=    Set Variable    ${element}
        
    END

*** Test Cases ***
Loop all numbers
    FOR    ${counter}    IN RANGE    1    10
        Log    ${counter}
        ${new}=    Set Variable    ${counter}
        
    END


*** Test Cases ***
Make a new directory
    Create Directory    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotDemo
    Directory Should Exist    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotDemo


*** Test Cases ***
Create a new text failed
    ${path}=    Set Variable    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotDemo
    Set Global Variable    ${path}
    Create File    ${path}\\\\example.txt    This is painful
    File Should Exist    ${path}\\example.txt
    File Should Not Be Empty    ${path}\\example.txt
    # Sleep can make the computer sleep (for 4 seconds in this example) 
    Sleep    4 

*** Test Cases ***
Clean files and directory
    ${path}=    Set Variable    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotDemo
    Remove File    ${path}\\example.txt
    Directory Should Be Empty    ${path}
    Remove Directory    ${path}

*** Test Cases ***
ping WEB PAGE AND READ PING TIME
    ${output}=    Run And Return Rc And Output    ping www.google.computer
    Log    ${output}


*** Test Cases ***
Read text from file and find word student
    ${output}=    Get File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\example_text.txt
    Log    ${output}
    ${output}=    Remove String    ${output}    .    ,
    @{wordList}=    Split String    ${output}
    Log    ${wordList}
    ${index}=    Get Index From List    ${wordList}    students
    ${expectedResult}=    Convert To Integer    24
    Should Be Equal    ${index}    ${expectedResult}

    