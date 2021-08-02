module Molecules (
  carbonDioxide,
  water
) where

import ElementsRatios
import ChemicalElements
import Molecule

carbonDioxide :: Molecule
carbonDioxide = molecule [leafElementsRatios [elementRatio carbon 1, elementRatio oxygen 2]]

water :: Molecule
water = molecule [leafElementsRatios [elementRatio hydrogen 2, elementRatio oxygen 1]]
