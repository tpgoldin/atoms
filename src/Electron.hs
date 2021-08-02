module Electron where

import ElectricCharge
import AtomicMassUnit
  
data Electron = ElectronDefinition ElectricCharge AtomicMassUnit deriving Eq

instance Show Electron where
  show e = "e"

electron::Electron
electron = ElectronDefinition negativeCharge (atomicMassUnit 0)
