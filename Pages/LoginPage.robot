*** Keywords ***
Login Github
    [Arguments]         ${username}        ${password}
    Wait Until Element Is Visible           xpath=//a[@data-ga-click='Header, sign in']             timeout=10s
    Click Element                           xpath=//a[@data-ga-click='Header, sign in']
    Wait Until Element Is Visible           id=login_field
    Input Text                              id=login_field          ${username}
    Input Text                              id=password             ${password}
    Click Element                           xpath=//input[@class='btn btn-primary btn-block'][@type='submit']
    ${not_redirected}=                      Run Keyword And Return Status         Wait Until Element Is Not Visible              xpath=//a[text()='click here']
    Run Keyword If    ${not_redirected}     Click Element                         xpath=//a[text()='click here']
    Element Should Be Visible               css=.Header.gist-header.header-logged-in