module ChemicalReaction (
  ChemicalEquation(..),
  chemicalEquation,
  isBalanced
) where

import ChemicalReactant
import ChemicalProduct
import Data.List (intercalate)

data ChemicalEquation = ChemicalEquation { lhs::[ChemicalReactant], rhs::[ChemicalProduct] } deriving Eq

instance Show ChemicalEquation where
  show ce = mconcat [intercalate " + " $ map show $ lhs ce, " -> ", intercalate " + " $ map show $ rhs ce]

chemicalEquation :: [ChemicalReactant] -> [ChemicalProduct] -> ChemicalEquation
chemicalEquation crs cps = ChemicalEquation { lhs=crs, rhs=cps }

isBalanced :: ChemicalEquation -> Bool
isBalanced ce = mLhs == mRhs
                where mLhs = map chemicalReactantCompoundMapping $ lhs ce
                      mRhs = map chemicalProductCompoundMapping $ rhs ce