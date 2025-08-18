require "__pypostprocessing__.lib"

py.register_compound_entities()
py.finalize_events()

script.on_load(function (event)
  remote.call("py_digosaurs", "new_digosaur", "digosaurus-prime", 1, "digosaurus-prime-mineable-proxy")
end)
