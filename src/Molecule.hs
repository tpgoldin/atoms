module Molecule (
  Molecule(..),
  molecule,
  moleculeElementRatioMapping
) where

import ElementsRatios
import ChemicalElement

import qualified Data.Map as M
import Data.List (intercalate)

newtype Molecule = Molecule { elementsRatios::[ElementsRatios] } deriving Eq

instance Show Molecule where
  show Molecule { elementsRatios=ers } = intercalate " + " $ map show ers

molecule :: [ElementsRatios] -> Molecule
molecule ers = Molecule { elementsRatios=ers }

moleculeElementRatioMapping :: Molecule -> M.Map ChemicalElement Int
moleculeElementRatioMapping m = elementsRatiosMapping ers
                                where ers = elementsRatios m