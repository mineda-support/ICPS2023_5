# AIST-SOI-CMOS.xs v0.2 based on YSS-SOI-CMOS v0.31 by Swear Takahashi July 3rd, 2021 
# SOI CMOS process description demonstrating:
# - Source/Drain diffusion
# - TIN Gate formation
# - Contact to Source/Drain and Al gate
# - 2nd metal layer formation

# Pick a 10x finer database unit for enhanced accuracy:
dbu(dbu * 0.1)

# Basic options: declare the depth of the simulation and the height.
# These are the defaults:
#   depth(10.0)
#   height(10.0)
# Declare the basic accuracy used to remove artefacts for example:
delta(5 * dbu)
height(200.0)
# Declaration the layout layers.
# Possible operations are (l1 = layer(..); l2 = layer(..))
#   "or"     l1.or(l2)
#   "and"    l1.and(l2)
#   "xor"    l1.xor(l2)
#   "not"    l1.not(l2)
#   "size"   l1.sized(s)     (s in micron units)
#     or     l1.sized(x, y)  (x, y in micron units)
#   "invert" l1.inverted
#Layers Definition

soi   = layer("4/0")
if soi.data.size > 0 # for production
  pdiff  = layer("2/0")
  ndiff  = layer("3/0")
  tin    = layer("5/0").inverted
  cnt    = layer("6/0") 
  ml1    = layer("7/0").inverted
  via1   = layer("8/0")
  ml2    = layer("9/0").inverted  
  soi    = soi.inverted
else # for designers
  diff   = layer("3/0")
  diffa  = diff.sized(2.0)
  tin    = layer("21/0")
  if tin.data.size == 0                
    tin    = layer("5/0")
  end
  tin = tin.inverted 
  cnt    = layer("7/0") 
  ml1    = layer("8/0").inverted
  via1   = layer("9/0")
  ml2    = layer("10/0").inverted
  cap    = layer("16/0")
  parea  = layer("18/0")
  narea  = layer("19/0")
  pdiff  = diffa.and(parea).and(tin.or(cap)) 
  ndiff  = diffa.and(narea).and(tin.or(cap)) 
  soi    = diff.inverted
end

#### layer Thichness
  yfactor = 10.0 # zoom Y-direction by factor of 10 
  tsub   = 0.8  * yfactor
  tbox   = 0.4  * yfactor
  tsoi   = 0.095  * yfactor # AIST: 0.2 -> 0.095
  tox    = 0.015 * yfactor  # AIST: 0.02 -> 0.015
  ttin   = 0.05  * yfactor  # AIST: 0.1 -> 0.05
  tteos1 = 0.25  * yfactor  # AIST: 0.3 -> 0.25
  tcnt   = 0.27 * yfactor   # AIST: 0.32 -> ttes1+0.2=0.27
  tml1a  = 0.3  * yfactor   # AIST: same
  tvia1  = 0.3  * yfactor
  tteos2 = 0.3  * yfactor   # AIST: same
  tml2a  = 0.3 * yfactor    # AIST: 0.55 -> 0.3
  
# Process steps:
# Now we move to cross section view: from the layout geometry we create 
# a material stack by simulating the process step by step. 
# The basic idea is that all activity happens at the surface. We can
# deposit material (over existing or at a mask), etch material and
# planarize. 
# A material is a 2D geometry as seen in the cross section along the
# measurement line.

# Start with the n doped bulk and assign that to material "nbulk"
# "bulk" delivers the wafer's cross section. 

nbulk = bulk
# SUB.BOX/SOI deposit
  sub = deposit(tsub)
  box = deposit(tbox)
  soia = deposit(tsoi)
  
  mask(soi).etch(tsoi*2,:into => soia,:taper =>30)

# N/P doping

  nplus = mask(ndiff).grow(1.0*yfactor, 1.0, :mode => :round, :into => soia)
  pplus = mask(pdiff).grow(0.5*yfactor, 0.5, :mode => :round, :into => soia)
  

# SOI etching (taper = 70)

  mask(soi).etch(tsoi*2,:into => pplus,:taper =>30)
  mask(soi).etch(tsoi*2,:into => nplus,:taper =>30)

# 20nm gate oxide.deposit
  gox = deposit(tox)

# 100nm TiN deposit
  tina = deposit(ttin)

# TiN etching
  mask(tin).etch(ttin*2.0,:into => tina, :taper =>5)
  
# deposit first TEOS 300nm
  
  iso1 = deposit(tteos1,:mode => :round)
  
# etch the gate and source/drain contacts

  mask(cnt).etch(tteos1, :into => iso1, :taper => 4)
  mask(cnt).etch(tcnt, :into => gox, :taper => 4)

  
  ## Metal1 deposit alu1:metal1 deposit
  
  alu1 = deposit(tml1a,1.0, :mode => :round)

  ##alu1 etcing by ml1-MASK  
  mask(ml1).etch(tml1a*2, :into => alu1, :taper => 8)

  #  isolation TEOS2 layer deposit
  
  iso2 = deposit(tteos2,tteos1/2.0, :mode => :round)

# tungsten CMP: take off 0.45 micron measured from the top level of the
# w, iso materials from w and iso. 
# Alternative specifications are: 
#   :downto => {material(s)}   planarize down to these materials
#   :to => z                   planarize to the given z position measured from 0 (the initial wafer surface) 
#planarize(:into => [w, iso], :less => 0.65)

  ### iso1 etching for M1-M2 contact##

  mask(via1).etch(tvia1*2,0.3, :into => iso2,:taper =>5)

  ### metal2 deposit all region ##

  alu2 = deposit(tml2a,0.1,:mode => :round)

  ## metal2 Layer eching By ml2

  mask(ml2).etch(tml2a,0.5, :into => alu2, :taper => 5)
  
#planarize(:into => [alu1], :less => 0.3)
# finally output all result material.
# output specification can be scattered throughout the script but it is 
# easier to read when put at the end.

  output("sub (280/0)", sub)
  output("box (282/0)", box)
  output("soi (284/0)", soia)

  output("pdiff (290/0)", pplus)
  output("ndiff (292/0)", nplus)

  output("gox (300/0)", gox)
  output("tina (301/0)",tina)
  output("iso1 (302/0)",iso1)
  output("alu1 (305/0)", alu1)

  output("iso1 (310/0)", iso2)

  output("alu2 (400/0)", alu2)

  layers_file("YSS-SOI-CMOS_Xsection.lyp")


