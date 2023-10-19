*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem

*** Keywords ***
First Word From text
    [Arguments]    ${text}    ${index}
    @{list}=    Split String    ${text}
    ${word}=    Set Variable    ${list}[${index}]
    [Return]    ${word}


*** Test Cases ***
New Text Test
    ${text}=    Set Variable    Red Rosses and Blue Sky
    ${word}=    First Word From text    ${text}    0
    Should Be Equal    ${word}    Red 
    Create File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\word.txt    ${word}\n

*** Test Cases ***
Another text test
    ${text}=    Set Variable    Red Rosses and Blue Sky
    ${word}=    First Word From text    ${text}    3
    Should Be Equal    ${word}    Blue 
    Append To File    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\RobotFiles\\word.txt    ${word}\n


*** Test Cases ***
GET IP address
    ${output}=    Run And Return Rc And Output    ipconfig
    @{wordList}=    Split String    ${output}[1]
    Log    ${wordList}

    ${index}=    Get Index From List    ${wordList}    Subnet
    ${index}=    Evaluate    ${index}-1
    ${IPAddress}=    Set Variable    ${wordList}[${index}]
    Log    ${IPAddress}