include("AskPhi.jl")

function main()::Integer
  println("
   █████████           █████      ███████████  █████       ███ 
  ███░░░░░███         ░░███      ░░███░░░░░███░░███       ░░░  
 ░███    ░███   █████  ░███ █████ ░███    ░███ ░███████   ████ 
 ░███████████  ███░░   ░███░░███  ░██████████  ░███░░███ ░░███ 
 ░███░░░░░███ ░░█████  ░██████░   ░███░░░░░░   ░███ ░███  ░███ 
 ░███    ░███  ░░░░███ ░███░░███  ░███         ░███ ░███  ░███ 
 █████   █████ ██████  ████ █████ █████        ████ █████ █████
░░░░░   ░░░░░ ░░░░░░  ░░░░ ░░░░░ ░░░░░        ░░░░ ░░░░░ ░░░░░ 
")
  println("Welcome to the AskPhi REPL environment!\nWrite a message and press ENTER to send it to the Phi3 LLM!\nPress ENTER with no message to exit this program!\n")
  
  while true
    print("AskPhi >> ")
    input = readline()
    if input == ""
      break
    end
    response = JSON.parse(askPhi(input))
    println("\n$(response["message"]["content"])\n")
  end

  return 0
end

if abspath(PROGRAM_FILE) == @__FILE__
  main()
end