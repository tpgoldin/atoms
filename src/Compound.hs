module Compound (
  Compound (..),
  molecularCompound,
  compoundElementRatioMapping,
)
where

import ChemicalElement
import qualified Data.Map as M
import ElementsRatios
import Molecule

newtype Compound = MolecularCompound { theMolecularCompound :: Molecule } deriving (Eq)

instance Show Compound where
  show MolecularCompound { theMolecularCompound=mc } = show mc

molecularCompound :: Molecule -> Compound
molecularCompound m = MolecularCompound { theMolecularCompound = m }

compoundElementRatioMapping :: Compound -> M.Map ChemicalElement Int
compoundElementRatioMapping MolecularCompound { theMolecularCompound = m } = elementsRatiosMapping $ elementsRatios m
