module ChemicalReaction (
  ChemicalEquation(..),
  chemicalEquation,
  isBalanced
) where

import ChemicalElement
import ChemicalReactant
import ChemicalProduct

import qualified Data.Map as M
import Data.List (intercalate)

data ChemicalEquation = ChemicalEquation { lhs::[ChemicalReactant], rhs::[ChemicalProduct] } deriving Eq

instance Show ChemicalEquation where
  show ce = mconcat [intercalate " + " $ map show $ lhs ce, " -> ", intercalate " + " $ map show $ rhs ce]

chemicalEquation :: [ChemicalReactant] -> [ChemicalProduct] -> ChemicalEquation
chemicalEquation crs cps = ChemicalEquation { lhs=crs, rhs=cps }

foldChemicalReactantsElementsRatiosIntoMapping :: [ChemicalReactant] -> M.Map ChemicalElement Int
foldChemicalReactantsElementsRatiosIntoMapping crs = foldl (M.unionWith (+)) M.empty mappings
                                                     where mappings = map chemicalReactantCompoundMapping crs

foldChemicalProductsElementsRatiosIntoMapping :: [ChemicalProduct] -> M.Map ChemicalElement Int
foldChemicalProductsElementsRatiosIntoMapping cps = foldl (M.unionWith (+)) M.empty mappings
                                                     where mappings = map chemicalProductCompoundMapping cps

isBalanced :: ChemicalEquation -> Bool
isBalanced ce = mLhs == mRhs
                where mLhs = foldChemicalReactantsElementsRatiosIntoMapping $ lhs ce
                      mRhs = foldChemicalProductsElementsRatiosIntoMapping $ rhs ce