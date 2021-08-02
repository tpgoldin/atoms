module Proton (
  Proton(..),
  proton
) where

import ElectricCharge
import AtomicMassUnit

data Proton = ProtonDefinition ElectricCharge AtomicMassUnit deriving Eq

instance Show Proton where
  show p = "p"

proton::Proton
proton = ProtonDefinition positiveCharge (atomicMassUnit 1)
