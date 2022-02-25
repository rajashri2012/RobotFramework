

    #TITLE SHOULD BE  Forcepoint RBI Admin Portal
    #PAGE SHOULD CONTAIN BUTTON  loginSuccessful
    #page should contain link  ${bellIcon}
    #element should be visible  xpath://i[@class='feather icon-bell']
     #page should contain link  ${UsersOption}
    #sleep   5 seconds

    #set selenium timeout  5 seconds
    #${tm}=  get selenium timeout
    #log to console  ${tm}