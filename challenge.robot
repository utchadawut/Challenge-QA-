*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String



*** Variables ***
${URL}                       https://abhigyank.github.io/To-Do-List/
${BROWSER}                   chrome
${INPUT_AddItem}             Challenge QA
${BTN_AddItem}               //button[@data-upgraded=",MaterialButton"]
${TAB_ToDoTask}              //a[@href="#todo"]
${TAB_Completed}             //a[@href="#completed"]
${CheckBox_CompletedTask}    //label[@data-upgraded=",MaterialCheckbox,MaterialRipple"]
${BTN_DeteleTask}            //Button[@data-upgraded=",MaterialButton,MaterialRipple"]

*** Keywords ***
Open The website
    [Arguments]            ${url}        ${browser}
    Open Browser           ${url}        ${browser}
    Page Should Contain    To Do List
Visit To-Do Task
    Click Element    ${TAB_ToDoTask} 
Visit Completed
    Click Element    ${TAB_Completed} 
***Test Cases ***
TS_01 : Add Item
    Open The website           ${url}              ${browser}
    Maximize Browser Window
    Input Text                 id=new-task         ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${BTN_AddItem}
    Sleep                      1s
    Visit To-Do Task
    Sleep                      1s
    Page Should Contain        ${INPUT_AddItem}
    Sleep                      1s

TS_02 : Completed Item To-Do Tsak
    Open The website           ${url}                        ${browser}
    Maximize Browser Window
    Input Text                 id=new-task                   ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${BTN_AddItem}
    Sleep                      1s
    Visit To-Do Task
    Sleep                      1s
    Page Should Contain        ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${CheckBox_CompletedTask} 
    Sleep                      1
    Visit Completed
    Sleep                      1s
    Page Should Contain        ${INPUT_AddItem}
    Sleep                      1s

TS_03 : Delete Item To-Do Tsak
    Open The website           ${url}                ${browser}
    Maximize Browser Window
    Input Text                 id=new-task           ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${BTN_AddItem}
    Sleep                      1s
    Visit To-Do Task
    Sleep                      1s
    Page Should Contain        ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${BTN_DeteleTask} 
    Sleep                      1
    Page Should Not Contain    ${INPUT_AddItem}
    Visit Completed
    Sleep                      1s
    Page Should Not Contain    ${INPUT_AddItem}
    Sleep                      1s

TS_04 : Delete Item Completed
    Open The website           ${url}                        ${browser}
    Maximize Browser Window
    Input Text                 id=new-task                   ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${BTN_AddItem}
    Sleep                      1s
    Visit To-Do Task
    Sleep                      1s
    Page Should Contain        ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${CheckBox_CompletedTask} 
    Sleep                      1
    Visit Completed
    Sleep                      1s
    Page Should Contain        ${INPUT_AddItem}
    Sleep                      1s
    Click Element              ${BTN_DeteleTask} 
    Sleep                      1s
    Page Should Not Contain    ${INPUT_AddItem}
    Sleep                      1s



