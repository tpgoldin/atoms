module ChemicalElements (
 hydrogen,
 carbon,
 oxygen,
 sodium
) where

import ChemicalElement
import PeriodicGroup

hydrogen :: ChemicalElement
hydrogen = chemicalElement "Hydrogen" "H" 1 0 1 groupOne

carbon :: ChemicalElement
carbon = chemicalElement "Carbon" "C" 6 6 6 groupFour

oxygen :: ChemicalElement
oxygen = chemicalElement "Oxygen" "O" 8 8 8 groupSix

sodium :: ChemicalElement
sodium = chemicalElement "Sodium" "Na" 11 12 11 groupOne
