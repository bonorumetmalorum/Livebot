module.exports = (robot) ->
    
    robot.hear /handover/, (res) ->
        res.send "alrighty-o handover initiating!!"
        res.send "So, what part of the handover would you like to work on today?\n
                    Service handover details, Service assurance\n
                    About the service\n
                    User research\n
                    Design and content\n
                    Runbook\n
                    Architecture\n
                    Security and fraud\n
                    Open-sourcing code\n
                    Service health-check monitoring and testing\n
                    Technical debt\n
                    Backend system(s) the service integrates with\n
                    Service measurement and analytics\n
                    Service operations\n
                    Outstanding items\n
                    Contacts\n
                    Sign off"
    
    robot.hear /Service Handover Details/, (res) ->
        res.send "Service Handover Details: Service Name, Existing Digital Service Manager,
        Handover date, new service or enhancement to existing?"