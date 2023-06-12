external_monitor_2_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_4__sink" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

external_monitor_3_rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_5__sink" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules, external_monitor_2_rule)
table.insert(alsa_monitor.rules, external_monitor_3_rule)
