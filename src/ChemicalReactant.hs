module ChemicalReactant (
  ChemicalReactant(..),
  chemicalReactant,
  chemicalReactantCompoundMapping
) where

import ChemicalElement
import Compound
import PhysicalState

import qualified Data.Map as M

data ChemicalReactant = ChemicalReactant { crRatio::Int, crCompound::Compound, crState::PhysicalState } deriving Eq

instance Show ChemicalReactant where
 show ChemicalReactant { crRatio=r, crCompound=c, crState=ps } = mconcat [show r, show c, show ps]

chemicalReactant :: Int -> Compound -> PhysicalState -> ChemicalReactant
chemicalReactant r c s = ChemicalReactant { crRatio=r, crCompound=c, crState=s }

chemicalReactantCompoundMapping :: ChemicalReactant -> M.Map ChemicalElement Int
chemicalReactantCompoundMapping cr = M.map (crRatio cr *) mapping
                                    where mapping = compoundElementRatioMapping $ crCompound cr

