Helper = require('hubot-test-helper')
chai = require('chai')

expect = chai.expect

helper = new Helper('../scripts/handoverForm.coffee')

describe 'handover from journey', ->
    beforeEach ->
        @room = helper.createRoom()
    
    afterEach ->
        @room.destroy()

    it 'should start the handover process on request', ->
        @room.user.say('bob', 'handover please!').then =>
            expect(@room.messages).to.eql [
                ['bob', 'handover please!'],
                ['hubot', {
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
                                    "name": "games_list",
                                    "text": "Pick a game...",
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
                }]
            ]
            
    # it 'should return the appropriate form when service handover details is selected', ->
    #     @room.user.say('bob', 'Service handover details').then =>
    #         expect(@room.messages).to.eql [
    #             ['bob', 'Service handover details'],
    #             ['hubot', 'Service Handover Details: Service Name, Existing Digital Service Manager,
    #                         Handover date, new service or enhancement to existing?']
    #         ]
    
    