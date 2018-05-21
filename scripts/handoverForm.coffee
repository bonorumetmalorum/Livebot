module.exports = (robot) ->
    
    robot.hear /handover/, (res) ->
        res.send "alrighty-o handover initiating!!"
        res.send "So, what part of the handover would you like to work on today?"
        res.send "Service handover details, Service assurance, About the service,
                    User research, Design and content, Runbook, Architecture,
                    Security and fraud, Open-sourcing code,
                    Service health-check monitoring and testing, Technical debt,
                    Backend system(s) the service integrates with,
                    Service measurement and analytics, Service operations,
                    Outstanding items, Contacts, Sign off"
    
    robot.hear /Service Handover Details/, (res) ->
        res.send "Service Handover Details: Service Name, Existing Digital Service Manager,
        Handover date, new service or enhancement to existing?"