local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local Roact = require(game.ReplicatedStorage.Roact)

local Wheel = require(game.ReplicatedStorage.Components:WaitForChild("SpineyWheel"))

local interface = Roact.createElement(Wheel,{
	name = "TestName"
})

Roact.mount(interface,playerGui)