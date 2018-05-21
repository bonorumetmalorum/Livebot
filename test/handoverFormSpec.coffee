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
                ['hubot', 'alrighty-o handover initiating!!'],
                ['hubot', 'So, what part of the handover would you like to work on today?'],
                ['hubot', 'Service handover details, Service assurance, About the service,
                           User research, Design and content, Runbook, Architecture,
                           Security and fraud, Open-sourcing code,
                           Service health-check monitoring and testing, Technical debt,
                           Backend system(s) the service integrates with,
                           Service measurement and analytics, Service operations,
                           Outstanding items, Contacts, Sign off']
            ]
            
    it 'should return the appropriate form when service handover details is selected', ->
        @room.user.say('bob', 'Service handover details').then =>
            expect(@room.messages).to.eql [
                ['bob', 'Service handover details'],
                ['hubot', 'Service Handover Details: Service Name, Existing Digital Service Manager,
                            Handover date, new service or enhancement to existing?']
            ]
    
    