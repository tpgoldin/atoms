module ElementsRatios (
  ElementRatio(..),
  elementRatio,
  elementRatioMapping,
  ElementsRatios(..),
  leafElementsRatios,
  compositeElementsRatios,
  elementsRatiosMapping
) where

import ChemicalElement

import qualified Data.Map as M

data ElementRatio = ElementRatio { element::ChemicalElement, ratio::Int } deriving Eq

instance Show ElementRatio where
 show er = mconcat [show $ symbol $ element er, s]
           where s = if ratio er == 1 
                     then ""
                     else show $ ratio er

elementRatio :: ChemicalElement -> Int -> ElementRatio
elementRatio e r = ElementRatio { element=e, ratio=r }

elementRatioMapping :: ElementRatio -> M.Map ChemicalElement Int
elementRatioMapping er = M.fromList [(element er, ratio er)]

foldElementRatiosIntoMapping :: [ElementRatio] -> M.Map ChemicalElement Int
foldElementRatiosIntoMapping ers = foldl (M.unionWith (+)) M.empty mappings
                                    where mappings = map elementRatioMapping ers

data ElementsRatios = LeafElementsRatios { lElementsRatios::[ElementRatio]} | CompositeElementsRatios { cElementsRatios::[ElementsRatios] } deriving Eq

instance Show ElementsRatios where
  show LeafElementsRatios { lElementsRatios=lers } = mconcat $ map show lers
  show CompositeElementsRatios { cElementsRatios=cers } = mconcat $ map show cers

leafElementsRatios :: [ElementRatio] -> ElementsRatios
leafElementsRatios ers = LeafElementsRatios { lElementsRatios=ers }

compositeElementsRatios :: [ElementsRatios] -> ElementsRatios
compositeElementsRatios ers = CompositeElementsRatios { cElementsRatios=ers }

singleElementsRatiosMapping :: ElementsRatios -> M.Map ChemicalElement Int
singleElementsRatiosMapping LeafElementsRatios { lElementsRatios=lers } = foldElementRatiosIntoMapping lers
singleElementsRatiosMapping CompositeElementsRatios { cElementsRatios=cers } = foldElementsRatiosIntoMapping cers

foldElementsRatiosIntoMapping :: [ElementsRatios]  -> M.Map ChemicalElement Int
foldElementsRatiosIntoMapping ers = foldl (M.unionWith (+)) M.empty mappings
                                    where mappings = map singleElementsRatiosMapping ers

elementsRatiosMapping :: [ElementsRatios] -> M.Map ChemicalElement Int
elementsRatiosMapping = foldElementsRatiosIntoMapping
