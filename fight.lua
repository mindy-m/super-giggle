player_hp = 50
opponent_hp = 100
potion_count = 3

print("Welcome!  You're in a boss fight!  Isn't that exciting...\n")

while player_hp > 0 and opponent_hp > 0 do
    print("Your current hp is " .. player_hp .. " and your opponent's hp is " .. opponent_hp)
    print("Would you like to attack or use a potion?")
    io.write("> \x1B[1m")
    io.flush()
    input_line = io.read()
    io.write("\x1B[0m")

    player_move = false
    if input_line == "attack" then
        opponent_hp = opponent_hp - 10
        print("You have dealt 10 hp damage to your opponent.")
        player_move = true
    elseif input_line == "potion" then
        if potion_count > 0 then
            player_hp = player_hp + 30
            print("You drank a potion. You healed 30 hp.")
            if player_hp >50 then
                player_hp = 50
                print("You are fully healed, but you wasted some of your potion.")
            end
            potion_count = potion_count - 1
            player_move = true
        elseif potion_count == 0 then
            print("Sorry, you're out of potions.")
        else
            print("Something went wackadoodle.")
        end
    else
        print("Please choose either 'attack' or 'potion'.")
    end

    if player_move then
        player_hp = player_hp - 10
        print("Your opponent dealt 10 hp damage.\n")
    end
end

if player_hp == 0 then
    if opponent_hp == 0 then
        print("While you defeated your opponent, you are also dead, so you can't celebrate.")
    end
    print("Game over, you lost.")
elseif opponent_hp == 0 then
    print("Congratulations, you won!")
else
    print("I don't know what happened.")
end

