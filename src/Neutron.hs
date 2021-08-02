module Neutron(
  Neutron(..),
  neutron
) where

import ElectricCharge
import AtomicMassUnit
  
data Neutron = NeutronDefinition ElectricCharge AtomicMassUnit deriving Eq

instance Show Neutron where
  show n = "n"

neutron::Neutron
neutron = NeutronDefinition neutralCharge (atomicMassUnit 1)
