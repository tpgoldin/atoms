module Ion where

import Proton
import ChemicalElement

data Ion = Cation { cationChemicalElement::ChemicalElement, protons::[Proton] } deriving Eq

cation :: ChemicalElement -> Int -> Ion
cation ce n = Cation { cationChemicalElement=ce, protons=replicate n proton }