#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Python script to generate a BOM from a KiCad generic netlist
# Created by Léa Strobino (2018)
#
"""
  @package
  Generate a csv BOM list.
  Components are sorted by reference and grouped by value.

  Fields are (if exist):
    Reference, Quantity, Value, Footprint,
    Manufacturer, Manufacturer part number,
    Supplier(s), Supplier part number(s)

  Command line:
    python bom.py "%I" "%O_bom.csv" delimiter
"""

# Import the KiCad python helper module and the csv formatter
import sys
sys.path.append("/Applications/KiCad/kicad.app/Contents/SharedSupport/plugins")
import kicad_netlist_reader
import csv

# Generate an instance of a generic netlist, and load the netlist tree from
# the command line option. If the file doesn't exist, execution will stop
net = kicad_netlist_reader.netlist(sys.argv[1])

# Open a file to write to, if the file cannot be opened output to stdout
# instead
try:
  f = open(sys.argv[2],"w")
except IOError:
  e = "Can't open output file for writing: "+sys.argv[2]
  print(__file__,":",e,sys.stderr)
  f = sys.stdout

# Create a new csv writer object to use as the output formatter
if len(sys.argv) > 3:
  d = sys.argv[3]
else:
  d = ","
out = csv.writer(f,lineterminator="\n",delimiter=d)

# Output a set of rows for a header providing general information
out.writerow(["% Source: "+net.getSource()])
out.writerow(["% Date: "+net.getDate()])
out.writerow(["% Component count: "+str(len(net.components))])
out.writerow(["Reference","Quantity","Value","Footprint","Manufacturer","Manufacturer part number",
              "Supplier 1","Supplier part number 1","Supplier 2","Supplier part number 2"])

# Get all of the components in groups of matching parts + values
# (see ky_generic_netlist_reader.py)
grouped = net.groupComponents()

# Output all of the component information
for group in grouped:
  refs = ""

  # Add the reference of every component in the group and keep a reference
  # to the component so that the other data can be filled in once per group
  for component in group:
    refs += component.getRef()+", "
    c = component

  # Fill in the component groups common data
  out.writerow([refs.rstrip(", "),len(group),c.getValue(),c.getFootprint().split(':',1)[1],c.getField("Manufacturer"),
                c.getField("ManufacturerPartNumber"),c.getField("Supplier1"),c.getField("Supplier1PartNumber"),
                c.getField("Supplier2"),c.getField("Supplier2PartNumber")])
