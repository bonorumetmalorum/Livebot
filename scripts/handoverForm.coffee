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
                                    "value": "service handover details"
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
                                    "text": "Design and content",
                                    "value": "design and content"
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
                                    "value": "scurity and fraud"
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
                                    "value": " techinical debt"
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
        console.log(JSON.stringify(req.actions) + "\n" + req.actions[0].selected_options[0].value)

        switch req.actions[0].selected_options[0].value

            when "service handover details"
                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Service Handover Details",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "text",
                                            "label": "Service Handover Details",
                                            "name": "handoverdetails"
                                        },
                                        {
                                            "type": "text",
                                            "label": "DSM",
                                            "name": "dsm"
                                        },
                                        {
                                            "type": "text",
                                            "label": "Handover Date",
                                            "name": "date"
                                        },
                                        {
                                            "type": "text",
                                            "label": "new or enhancement",
                                            "name": "new or enhance"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "service assurance"
                
                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Service Assurance",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [

                                        {
                                            "type": "textarea",
                                            "label": "LA or GDS complete?",
                                            "name": "la_gds"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "if not, why?",
                                            "name": "actions"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Completion date?",
                                            "name": "date"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Name owner for actions",
                                            "name": "owner_for_actions"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )


            when "about the service"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "About the service",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "Brief Description",
                                            "name": "description"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "drivers & benefits",
                                            "name": "driver_benefits"
                                        },
                                        {
                                            "type": "text",
                                            "label": "events and peak volumes",
                                            "name": "events_peak"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Service links",
                                            "name": "service_links"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "user research"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "User research and design",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "User volumes",
                                            "name": "user_volumes"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "User personas",
                                            "name": "personas"
                                        },
                                        {
                                            "type": "text",
                                            "label": "User needs",
                                            "name": "u_needs"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Research plan",
                                            "name": "research_plan"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Other user research",
                                            "name": "research_plan_other"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "design and content"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Design and content",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "text",
                                            "label": "Service journey maps",
                                            "name": ""
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Design prototype",
                                            "name": "design_proto"
                                        },
                                        {
                                            "type": "text",
                                            "label": "DAC assessment",
                                            "name": "DAC"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Research plan",
                                            "name": "research_plan"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Welsh translation",
                                            "name": "welsh_trans"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )


            when "runbook"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Runbook",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "text",
                                            "label": "Runbook url",
                                            "name": "runbook_url"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "architecture"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Architecture",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "text",
                                            "label": "Diagrams",
                                            "name": "archi_diag"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Documentation",
                                            "name": "archi_doc"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "platform/library updates",
                                            "name": "updates"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "security and fraud"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Security and fraud",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "Security Assessment",
                                            "name": "sec_risk_assessment"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Fraud assessment",
                                            "name": "fraud_assessment"
                                        },
                                        {
                                            "type": "text",
                                            "label": "Data capture",
                                            "name": "data_capture"
                                        },
                                        {
                                            "type": "textarea",
                                            "label": "Google Analytics",
                                            "name": "ga"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "open-sourcing code"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Open-sourcing code",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "Open Source?",
                                            "name": "os"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )
            when "service health-check monitoring and testing"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Service health-check monitoring and testing",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "Pager Duty alerts",
                                            "name": "pager_duty_alerts"
                                        },
                                        {
                                            "type": "text",
                                            "label": "Kibana and Grafana",
                                            "name": "kibana_grafana"
                                        },
                                        {
                                            "type": "text",
                                            "label": "Test data",
                                            "name": "test_data"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )
            when 'technical debt'

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Technical debt",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "any technical debt?",
                                            "name": "tech_debt"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            when "backend system(s) the service integrates with"

                web.dialog.open({
                    trigger_id: req.trigger_id,
                    dialog: {
                        "callback_id": "ryde-46e2b0",
                        "title": "Backend system(s) the service integrates with",
                        "submit_label": "Request",
                        "notify_on_cancel": true,
                        "elements": [
                                        {
                                            "type": "textarea",
                                            "label": "Backend sytems",
                                            "name": "backend_integrations"
                                        }
                                    ]
                        }
                }).catch(
                        (error) -> console.loge("error opening dialog: " + error)
                )

            # when "service measurement and analytics" then
            # when "service operations" then
            # when "outstanding items" then
            # when "contacts" then
            # when "sign off" then
            else console.log("err")