*** Settings ***
Resource    ../config.robot
*** Keywords ***
Click Create New Gist Button
    Wait Until Element Is Visible               xpath=//a[@data-ga-click="Header, go to new gist, text:new gist"]
    Click Element                               xpath=//a[@data-ga-click="Header, go to new gist, text:new gist"]
    ${current_url}=                             Get Location
    Should Be Equal As Strings                  ${current_url}          https://gist.github.com/

Show All My Gist By Account Menu
    Wait Until Element Is Visible               css=.HeaderNavlink.name.mt-1                            timeout=15s
    Click Element                               css=.HeaderNavlink.name.mt-1
    Wait Until Element Is Visible               css=.dropdown-menu.dropdown-menu-sw
    Click Element                               xpath=//a[@data-ga-click='Header, go to your gists, text:your gists']
    Location Should Be                          ${Github.URL}/${Github.USERNAME}

Show All My Gist
    Wait Until Element Is Visible               xpath=//li[@class='flex-auto py-3 text-bold text-right f6 lh-condensed']/a[text()='See all of your gists']
    Location Should Be                          ${Github.URL}/${Github.USERNAME}

Input Gist Description
    [Arguments]         ${gist_description}
    Wait Until Element Is Visible               css=.form-control.input-block.input-contrast
    Input Text                                  css=.form-control.input-block.input-contrast       ${gist_description}

Input Filename
    [Arguments]         ${filename}
    Wait Until Element Is Visible               css=.form-control.filename.js-gist-filename.js-blob-filename
    Input Text                                  css=.form-control.filename.js-gist-filename.js-blob-filename       ${filename}

Input Content
    [Arguments]         ${content}
    Wait Until Element Is Visible               css=.CodeMirror-code
    Execute Javascript                          document.querySelector('.CodeMirror').CodeMirror.setValue('${content}')

Click Create Public Gist Button
    Wait Until Element Is Visible               css=.btn.js-gist-create
    Click Element                               css=.btn.js-gist-create

Click Create Secret Gist Button
    Wait Until Element Is Visible               css=.btn btn-secret.js-gist-create 
    Click Element                               css=.btn btn-secret.js-gist-create 

Open Gist with Filename
    [Arguments]         ${filename}
    Show All My Gist By Account Menu
    Scroll Element Into View                    xpath=//strong[@class='css-truncate-target'][text()='${filename}']/parent::a
    Click Element                               xpath=//strong[@class='css-truncate-target'][text()='${filename}']/parent::a

Click Edit Gist Button
    Wait Until Element Is Visible               css=.octicon.octicon-pencil
    Click Element                               css=.octicon.octicon-pencil

Click Update Public Gist Button
    Scroll Element Into View                    xpath=//button[@type='submit'][@class='btn btn-primary']
    Click Element                               xpath=//button[@type='submit'][@class='btn btn-primary']

Click Delete Gist Button
    Wait Until Element Is Visible               css=.octicon.octicon-trashcan
    Click Element                               css=.octicon.octicon-trashcan
    Alert Should Be Present                     Are you positive you want to delete this Gist?          action=ACCEPT
    
Verify Delete Gist
    Wait Until Element Is Visible               xpath=//div[@class='container'][contains(., 'Gist deleted successfully.')]

Verify Gist
    [Arguments]             ${gist_description}     ${filename}     ${content}
    ${current_text}=           Get Text          xpath=//div[@itemprop='about']
    Should Be Equal As Strings                   ${current_text}        ${gist_description}
    ${current_filename}        Get Text          xpath=//strong[@class='user-select-contain gist-blob-name css-truncate-target']
    Should Be Equal As Strings                   ${current_filename}        ${filename}
    Wait Until Page Contains Element             xpath=//textarea[@name='gist[content]'][text()='${content}']