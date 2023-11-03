def lvs_settings
  same_circuits 'nand', '.TOP'
  netlist.make_top_level_pins
  netlist.flatten_circuit 'Nch*'
  netlist.flatten_circuit 'Pch*'
  align
  same_device_classes 'NMOS', 'NCH'
  same_device_classes 'PMOS', 'PCH'
  same_device_classes 'MIMCAP', 'CAP'
  same_device_classes 'TINCAP', 'CAP'
  same_device_classes 'PDIFFCAP', 'CAP'
  same_device_classes 'NDIFFCAP', 'CAP'
  same_device_classes 'NRES', 'RES'
  same_device_classes 'PRES', 'RES'
  same_device_classes 'R_SOI', 'RES'
  tolerance 'RES', 'R', :relative => 0.03
  tolerance 'NRES', 'R', :relative => 0.03
  tolerance 'PRES', 'R', :relative => 0.03
  tolerance 'R_SOI', 'R', :relative => 0.03
  tolerance 'MIMCAP', 'C', :relative => 0.03
  tolerance 'TINCAP', 'C', :relative => 0.03
  tolerance 'PDIFFCAP', 'C', :relative => 0.03
  tolerance 'NDIFFCAP', 'C', :relative => 0.03
  netlist.combine_devices
  schematic.combine_devices
end
