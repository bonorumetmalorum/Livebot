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
                ['hubot', 'alrighty-o handover initiating!!']
            ]
    
    