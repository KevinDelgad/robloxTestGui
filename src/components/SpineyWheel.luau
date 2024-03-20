local Roact = require(game.ReplicatedStorage.Roact)

local Wheel = Roact.Component:extend("Wheel")

function Wheel:init()
	self:setState({
		spin = false
	})
end

function Wheel:render()
	return Roact.createElement("ScreenGui",{
		Name = "Interface",
	},{
		SpinButton = Roact.createElement("TextButton",{
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromScale(.2,.2),
			Position = UDim2.fromScale(.5, .5),
			Text = "Spin!",
			[Roact.Event.Activated] = function(rbx)
				self:setState({spin = true})
        		print(self.state.spin)
    		end
		},{
			Aspect = Roact.createElement("UIAspectRatioConstraint",{
				AspectRatio = 1;
			}),
			RoundedCorner = Roact.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}),
		}),

		[self.props.name] = Roact.createElement("Frame",{
			Size = UDim2.new(.9,0,.9,0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(39, 39, 39)
		},{
			Aspect = Roact.createElement("UIAspectRatioConstraint",{
				AspectRatio = 1;
			}),
			RoundedCorner = Roact.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}),
			ReferenceCircle = Roact.createElement("Frame",{
				Size = UDim2.fromScale(.1,.1),
				Position = UDim2.fromScale(.5,.9),
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
			})
		}),
	});
end

return Wheel