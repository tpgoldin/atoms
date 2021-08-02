module PhysicalState where

data PhysicalState = Gas | Liquid | Solid deriving (Eq, Ord)

instance Show PhysicalState where
  show Gas = "(g)"
  show Liquid = "(aq)"
  show Solid = "(s)"
