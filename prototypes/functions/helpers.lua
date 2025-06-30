function py_veganism_globals.remove_improper_ingredients(ingredients)
  local new_ingredients = table.deepcopy(ingredients)
  local remove_count = 0
  for k,v in pairs(ingredients) do
    log(k .. ": " .. serpent.block(v))
    if v.amount < 1 then
      log("removed: " .. k)
      table.remove(new_ingredients, k - remove_count)
      remove_count = remove_count + 1
    end
  end
  return new_ingredients
end
