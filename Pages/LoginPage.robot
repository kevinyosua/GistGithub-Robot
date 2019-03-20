*** Keywords ***
Login Github
    [Arguments]         ${username}        ${password}
    Wait Until Element Is Visible           xpath=//a[@data-ga-click='Header, sign in']             timeout=10s
    Click Element                           xpath=//a[@data-ga-click='Header, sign in']
    Wait Until Element Is Visible           id=login_field
    Input Text                              id=login_field          ${username}
    Input Text                              id=password             ${password}
    Click Element                           xpath=//input[@class='btn btn-primary btn-block'][@type='submit']
    Element Should Be Visible               css=.Header.gist-header.header-logged-in