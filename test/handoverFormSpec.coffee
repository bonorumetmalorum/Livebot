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
                ['hubot', 'So, what part of the handover would you like to work on today?\n
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
                           Sign off'],
                ['hubot', '']
            ]
            
    it 'should return the appropriate form when service handover details is selected', ->
        @room.user.say('bob', 'Service handover details').then =>
            expect(@room.messages).to.eql [
                ['bob', 'Service handover details'],
                ['hubot', 'Service Handover Details: Service Name, Existing Digital Service Manager,
                            Handover date, new service or enhancement to existing?']
            ]
    
    