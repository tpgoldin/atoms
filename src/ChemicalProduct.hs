module ChemicalProduct (
  ChemicalProduct(..),
  chemicalProduct,
  chemicalProductCompoundMapping
) where

import Compound
import ChemicalElement
import PhysicalState

import qualified Data.Map as M

data ChemicalProduct = ChemicalProduct { cpRatio::Int, cpCompound::Compound, cpState::PhysicalState } deriving Eq

instance Show ChemicalProduct where
  show ChemicalProduct { cpRatio=r, cpCompound=c, cpState=ps } = mconcat [show r, show c, show ps]

chemicalProduct :: Int -> Compound -> PhysicalState -> ChemicalProduct
chemicalProduct r c s = ChemicalProduct { cpRatio=r, cpCompound=c, cpState=s }

chemicalProductCompoundMapping :: ChemicalProduct -> M.Map ChemicalElement Int
chemicalProductCompoundMapping cp = M.map (cpRatio cp *) mapping
                                     where mapping = compoundElementRatioMapping $ cpCompound cp
