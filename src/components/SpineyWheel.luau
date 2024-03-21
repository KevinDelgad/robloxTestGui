local Roact = require(game.ReplicatedStorage.Roact)
local TweenService = game:GetService("TweenService")

local Wheel = Roact.Component:extend("Wheel")

local TweenTime = 2
local TweenStyle = Enum.EasingStyle.Linear

local tweenStart = {}
tweenStart.Size = UDim2.fromScale(0.2,0.2)

local tweenGoal = {}
tweenGoal.Size = UDim2.fromScale(0.7, 0.7)

local tweenInfo = TweenInfo.new(TweenTime, TweenStyle)

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
				print(typeof(rbx.Size))
				if rbx.Size == UDim2.new(0.7, 0, 0.7, 0) then
					local tween = TweenService:Create(rbx, tweenInfo, tweenGoal)
					tween:Play()
				else
					local tween = TweenService:Create(rbx, tweenInfo, tweenStart)
					tween:Play()
				end
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