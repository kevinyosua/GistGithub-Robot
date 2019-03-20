*** Settings ***
Resource    config.robot
Resource    Settings.robot
Resource    Pages/__PageImporter.robot
Suite Setup     Run Keywords        Open Chrome Browser         ${Github.URL}
...             AND                 Login Github                ${Github.USERNAME}     ${Github.PASSWORD}

Test Setup  Go To       ${Github.URL}

*** Test Case ***
As a user, I want to create a public gist
    Click Create New Gist Button
    Input Gist Description              desc
    Input Filename                      filename
    Input Content                       content
    Click Create Public Gist Button
    Show All My Gist By Account Menu
    debug
    Open Gist with Filename             filename
    Verify Gist                         desc  filename  content

As a user, I want to edit an existing gist
    Show All My Gist By Account Menu
    Open Gist with Filename             filename
    Click Edit Gist Button
    Input Gist Description              desc1
    Input Filename                      filename1
    Input Content                       content1

As a user, I want to delete an existing gist.
    Show All My Gist By Account Menu
    Open Gist with Filename             filename
    Click Delete Gist Button

As a user, I want to see my list of gists.
    Show All My Gist By Account Menu
    Open Gist with Filename             filename
    Click Delete Gist Button