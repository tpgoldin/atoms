module Main where

import ChemicalElements
import Compound
import ElementsRatios
import Molecule
import Molecules
import PhysicalState
import ChemicalReactant
import ChemicalProduct
import ChemicalReaction

main :: IO ()
main = do
  let c2h6 = molecularCompound $ molecule [leafElementsRatios [elementRatio carbon 2, elementRatio hydrogen 6]]
  let o2 = molecularCompound $ molecule [leafElementsRatios [elementRatio oxygen 2]]

  let cr1 = chemicalReactant 2 c2h6 Gas
  let cr2 = chemicalReactant 7 o2 Gas

  let co2 = molecularCompound carbonDioxide
  let h2o = molecularCompound water

  let cp1 = chemicalProduct 4 co2 Gas
  let cp2 = chemicalProduct 6 h2o Liquid

  let ce = chemicalEquation [cr1, cr2] [cp1, cp2]

  print ce

  print $ isBalanced ce
