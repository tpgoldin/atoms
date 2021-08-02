module Ion (
  Ion(..),
  loseElectrons,
  gainElectrons
) where

import ChemicalElement
import IonRatios

data Ion = Cation { cationChemicalElement::ChemicalElement, catRatio::IonRatio } |
           Anion { anionChemicalElement::ChemicalElement, anRatio::IonRatio } deriving Eq

loseElectrons :: ChemicalElement -> Int -> Ion
loseElectrons ce n = Cation { cationChemicalElement=ce, catRatio=cationRatio n }

gainElectrons :: ChemicalElement -> Int -> Ion
gainElectrons ce n = Anion { anionChemicalElement=ce, anRatio=anionRatio n }