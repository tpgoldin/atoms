module ElectronGainer (
  ElectronGainer(..),
  electronGainer
) where

import ChemicalElement

newtype ElectronGainer = ElectronGainer { egChemicalElement::ChemicalElement } deriving Eq

instance Show ElectronGainer where
  show eg = show $ symbol $ egChemicalElement eg

electronGainer :: ChemicalElement -> ElectronGainer
electronGainer ce = ElectronGainer { egChemicalElement=ce }
