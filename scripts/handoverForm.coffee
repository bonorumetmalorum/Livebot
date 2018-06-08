{WebClient} = require "@slack/client"
{createMessageAdapter} = require "@slack/interactive-messages"

module.exports = (robot) ->

    slackInteractions = createMessageAdapter('gtT6k13RphyfG2Tu4xo9zglh')

    port = 9000

    slackInteractions.start(port).then -> console.log('listening on port: ' + port)

    web

    if robot.adapter.options != undefined
        web = new WebClient(robot.adapter.options.token)
    else
        web = new WebClient()
    
    robot.hear /(handover)/i, (res) ->
        res.send {
            "text": "alrighty-o handover initiating!!",
            "response_type": "in_channel",
            "attachments": [
                {
                    "text": "So, what part of the handover would you like to work on today?",
                    "fallback": "If you could read this message, you'd be choosing something fun to do right now.",
                    "color": "#3AA3E3",
                    "attachment_type": "default",
                    "callback_id": "handover",
                    "actions": [
                        {
                            "name": "handover_sections",
                            "text": "Select a topic...",
                            "type": "select",
                            "options": [
                                {
                                    "text": " Service handover details",
                                    "value": " service handover details"
                                },
                                {
                                    "text": "Service assurance",
                                    "value": "service assurance"
                                },
                                {
                                    "text": "About the service",
                                    "value": "about the service"
                                },
                                {
                                    "text": "User research",
                                    "value": "user research"
                                },
                                {
                                    "text": "Runbook",
                                    "value": "runbook"
                                },
                                {
                                    "text": "Architecture",
                                    "value": "architecture"
                                },
                                {
                                    "text": " Security and fraud",
                                    "value": " scurity and fraud"
                                },
                                {
                                    "text": "Open-sourcing code",
                                    "value": "open-sourcing code"
                                },
                                {
                                    "text": "Service health-check monitoring and testing",
                                    "value": "service health-check monitoring and testing"
                                },
                                {
                                    "text": "Security and fraud",
                                    "value": "security and fraud"
                                },
                                {
                                    "text": "Technical debt",
                                    "value": " scurity and fraud"
                                },
                                {
                                    "text": "Backend system(s) the service integrates with",
                                    "value": "backend system(s) the service integrates with"
                                },
                                {
                                    "text": "Service measurement and analytics",
                                    "value": "service measurement and analytics"
                                },
                                {
                                    "text": " Service operations",
                                    "value": "service operations"
                                },
                                {
                                    "text": "Outstanding items",
                                    "value": "outstanding items"
                                },
                                {
                                    "text": "Contacts",
                                    "value": "contacts"
                                },
                                {
                                    "text": "Sign off",
                                    "value": "sign off"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
     
    slackInteractions.action 'handover', (req) ->
        console.log(req + "\n ------------------------------ \n")
        console.log(req.trigger_id + "\n")
        web.dialog.open({
            trigger_id: req.trigger_id,
            dialog: {
                "callback_id": "ryde-46e2b0",
                "title": "Request a Ride",
                "submit_label": "Request",
                "notify_on_cancel": true,
                "elements": [
                                {
                                    "type": "text",
                                    "label": "Pickup Location",
                                    "name": "loc_origin"
                                },
                                {
                                    "type": "text",
                                    "label": "Dropoff Location",
                                    "name": "loc_destination"
                                }
                            ]
                }
        }).catch(
                (error) -> console.loge("error opening dialog: " + error)
            )