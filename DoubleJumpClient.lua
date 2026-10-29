-- Easy Jump
-- Simple Jump Config
-- Created by ABUKICK

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local CONFIG = {
    JumpHeight = 50,
    MaxJumpHeight = 100,
    DoubleJump = true,
}

local humanoid
local rootPart
local jumpsUsed = 0
local characterConnection

local function getJumpHeight()
    local height = CONFIG.JumpHeight
    local maximum = CONFIG.MaxJumpHeight

    if typeof(height) ~= "number" or height ~= height then
        height = 50
    end

    if typeof(maximum) ~= "number" or maximum ~= maximum then
        maximum = 100
    end

    maximum = math.clamp(maximum, 0, 1000)
    return math.clamp(height, 0, maximum)
end

local function setupCharacter(character)
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    jumpsUsed = 0

    humanoid.UseJumpPower = false
    humanoid.JumpHeight = getJumpHeight()

    humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Landed
            or newState == Enum.HumanoidStateType.Running
            or newState == Enum.HumanoidStateType.RunningNoPhysics then
            jumpsUsed = 0
        end
    end)
end

player.CharacterAdded:Connect(setupCharacter)

if player.Character then
    task.spawn(setupCharacter, player.Character)
end

UserInputService.JumpRequest:Connect(function()
    if not humanoid or not rootPart or humanoid.Health <= 0 then
        return
    end

    if humanoid.FloorMaterial ~= Enum.Material.Air then
        jumpsUsed = 0
        return
    end

    if not CONFIG.DoubleJump or jumpsUsed >= 1 then
        return
    end

    jumpsUsed = 1

    local velocity = rootPart.AssemblyLinearVelocity
    local jumpVelocity = math.sqrt(
        2 * workspace.Gravity * getJumpHeight()
    )

    rootPart.AssemblyLinearVelocity = Vector3.new(
        velocity.X,
        jumpVelocity,
        velocity.Z
    )
end)
