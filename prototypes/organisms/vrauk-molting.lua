ITEM {
		type = "item",
  	name = "vrauk-molt",
    icon = "__pyveganism__/graphics/icons/vrauk-molt.png",
    icon_size = 64,
    enabled = false,
    subgroup = "py-veganism-vrauk",
    stack_size = 200,
}
ITEM {
		type = "item",
  	name = "vrauk-molt",
    icon = "__pyveganism__/graphics/icons/vrauk-molt.png",
    icon_size = 64,
    enabled = false,
    subgroup = "py-veganism-vrauk",
    stack_size = 200,
}

ITEM {
		type = "item",
  	name = "vrauk-frass",
    icon = "__pyveganism__/graphics/icons/frass.png",
    icon_size = 64,
    enabled = false,
    subgroup = "py-veganism-vrauk",
    stack_size = 200,
}

RECIPE {
    type = "recipe",
    name = "vrauk-molting-with-frass",
    order = "aab",
    category = "vrauks",
    subgroup = "py-veganism-vrauk",
    icons = {
    	{ icon = "__pyveganism__/graphics/icons/vrauk-molt.png", icon_size = 64 },
    	{ icon = "__pyveganism__/graphics/icons/frass.png", icon_size = 64, scale = 0.26, shift = {8, 8}}
    },
    icon_size = 64,
    enabled = false,
    ingredients = {
      {
        type = "item",
        name = "water-barrel",
        amount = 3,
      },
      {
        type = "item",
        name = "native-flora",
        amount = 15,
      },
      {
        type = "item",
        name = "moss",
        amount = 5,
      },
    },
    results = {
      {
        type = "item",
        name = "barrel",
        amount = 3,
      },
      {
        type = "item",
        name = "vrauk-molt",
        amount = 5
      },
      {
        type = "item",
        name = "vrauk-frass",
        amount = 15
      },
    },
    energy_required = 160,
}:add_unlock("vrauks")

RECIPE {
    type = "recipe",
    name = "vrauk-molting",
    order = "aaa",
    category = "vrauks",
    subgroup = "py-veganism-vrauk",
    icon = "__pyveganism__/graphics/icons/vrauk-molt.png",
    icon_size = 64,
    enabled = false,
    ingredients = {
      {
        type = "item",
        name = "water-barrel",
        amount = 3,
      },
      {
        type = "item",
        name = "native-flora",
        amount = 15,
      },
      {
        type = "item",
        name = "moss",
        amount = 5,
      },
    },
    results = {
      {
        type = "item",
        name = "barrel",
        amount = 3,
      },
      {
        type = "item",
        name = "vrauk-molt",
        amount = 5
      }
    },
    energy_required = 160,
}:add_unlock("vrauks")

RECIPE {
    type = "recipe",
    name = "vrauk-frass",
    order = "aac",
    category = "vrauks",
    subgroup = "py-veganism-vrauk",
    icon = "__pyveganism__/graphics/icons/frass.png",
    icon_size = 64,
    enabled = false,
    ingredients = {
      {
        type = "item",
        name = "water-barrel",
        amount = 3,
      },
      {
        type = "item",
        name = "native-flora",
        amount = 15,
      },
      {
        type = "item",
        name = "moss",
        amount = 5,
      },
    },
    results = {
      {
        type = "item",
        name = "barrel",
        amount = 3,
      },
      {
        type = "item",
        name = "vrauk-frass",
        amount = 15
      }
    },
    energy_required = 160,
}:add_unlock("vrauks")

RECIPE{
		type = "recipe",
		name = "vrauk-molt-to-chitin",
		order = "aab",
		category = "crafting",
		subgroup = "py-veganism-vrauk",
		icon = "__pyalienlifegraphics__/graphics/icons/chitin.png",
		icon_size = 64,
		enabled = false,
		ingredients = {
			{
				type = "item",
				name = "vrauk-molt",
				amount = 10,
			},
		},
		results = {
			{
				type = "item",
				name = "chitin",
				amount = 5
			},
		},
}
