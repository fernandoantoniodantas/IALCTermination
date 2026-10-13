import Mathlib.Data.Finset.Basic

namespace IALCTableau.Termination

variable {Formula : Type} [DecidableEq Formula]

/-- Conjunto finito das fórmulas relevantes da base K. -/
abbrev Closure (Formula : Type) := Finset Formula

/-- Sinal atribuído a uma fórmula em uma branch do tableau. -/
inductive Sign where
  | T
  | F
deriving DecidableEq, Repr

end IALCTableau.Termination
