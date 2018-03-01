twix = {
  "name" => "Twix",
  "selection_letter" => "A",
  "price" => 0.65
}

chips = {
  "name" => "Chips",
  "selection_letter" => "B",
  "price" => 0.50
}

nutter_butter = {
  "name" => "Nutter Butter",
  "selection_letter" => "C",
  "price" => 0.75
}

peanut_butter_cups = {
  "name" => "Peanut Butter Cups",
  "selection_letter" => "D",
  "price" => 0.65
}

juicy_fruit_gum = {
  "name" => "Juicy Fruit Gum",
  "selection_letter" => "E",
  "price" => 0.55
}

def round_down_to_two_decimal_places(float)
  return (float * 100).floor / 100.to_f
end

selections = [twix, chips, nutter_butter, peanut_butter_cups, juicy_fruit_gum]

def candy_machine(selections)
  puts "Welcome to Michelle's Computer Candy Machine!"
  puts "(All candy provided is virtual.)"

  puts "\nHow much money do ya got?"
  money = round_down_to_two_decimal_places(Float(gets.chomp)) rescue false

  if !money || money < 0
    puts "Error. Please enter a valid input"
    return
  end

  puts "$" + money.to_s + ", that's all?"
  puts "Well, lemme tell ya what we got here."
  selections.each do |selection|
    puts selection["selection_letter"] + " $" + selection["price"].to_s + " " + selection["name"]
  end

  puts "\nSo, What'll ya have?"
  userPick = gets.chomp.strip.upcase
  selection = nil
  selections.each do |s|
    if s["selection_letter"] == userPick
      selection = s
      if money < selection["price"]
        puts "You're broke. Take your " + money.to_s + " and go elsewhere."
      else
        change = round_down_to_two_decimal_places(money - selection["price"])
        puts "Thanks for purchasing candy through us."
        puts "Please take your candy, and your $" + change.to_s + " change!"
      end
    end
  end
  if !selection
    puts "Please enter a valid selection"
    return
  end


end

candy_machine(selections)
