-- Audio Sources
focusrite_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_input.usb-Focusrite_Scarlett_Solo_USB_Y7RN4G5265215E-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["node.description"] = "Focusrite Scarlett Solo",
  },
}

laptop_microphone_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source" },
    },
  },
  apply_properties = {
    ["node.description"] = "Laptop Microphone",
  },
}

laptop_headphones_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__source" },
    },
  },
  apply_properties = {
    ["node.description"] = "Laptop Headphones",
  },
}

table.insert(alsa_monitor.rules, focusrite_rule)
table.insert(alsa_monitor.rules, laptop_microphone_rule)
table.insert(alsa_monitor.rules, laptop_headphones_rule)


-- Audio Sinks
external_speaker_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_3__sink" },
    },
  },
  apply_properties = {
    ["node.description"] = "External Speaker",
  },
}


speaker_headphones_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink" },
    },
  },
  apply_properties = {
    ["node.description"] = "Speaker + Headphones",
  },
}

table.insert(alsa_monitor.rules, external_speaker_rule)
table.insert(alsa_monitor.rules, speaker_headphones_rule)
