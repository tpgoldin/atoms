module Ion (
  Ion(..),
  loseElectrons,
  gainElectrons
) where

import Electron
import Proton
import ChemicalElement

data Ion = Cation { cationChemicalElement::ChemicalElement, protons::[Proton] } |
           Anion { anionChemicalElement::ChemicalElement, electrons::[Electron] } deriving Eq

loseElectrons :: ChemicalElement -> Int -> Ion
loseElectrons ce n = Cation { cationChemicalElement=ce, protons=replicate n proton }

gainElectrons :: ChemicalElement -> Int -> Ion
gainElectrons ce n = Anion { anionChemicalElement=ce, electrons=replicate n electron }