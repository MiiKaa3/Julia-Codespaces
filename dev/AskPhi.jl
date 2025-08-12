using HTTP
using JSON

function askPhi(msg::String)::String
  response = HTTP.post(
    "http://127.0.0.1:11434/api/chat",
    ["Content-Type" => "application/json"],
    JSON.json(Dict(
      "model" => "phi3",
      "messages" => [Dict(
          "role" => "user",
          "content" => "$msg"
        )],
      "stream" => false
    ))
  )
  
  return String(response.body)
end

function testing(msg::String)::String
  return msg
end

if abspath(PROGRAM_FILE) == @__FILE__
  println(askPhi(join(ARGS, " ")))
end