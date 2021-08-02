module ElectronLoser (
  ElectronLoser(..),
  electronLoser
) where

import ChemicalElement

newtype ElectronLoser = ElectronLoser { elChemicalElement::ChemicalElement } deriving Eq

instance Show ElectronLoser where
  show el = show $ symbol $ elChemicalElement el

electronLoser :: ChemicalElement -> ElectronLoser
electronLoser ce = ElectronLoser { elChemicalElement=ce }
