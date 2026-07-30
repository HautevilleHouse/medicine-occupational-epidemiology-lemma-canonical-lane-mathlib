import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticModel where
  dose : ℝ
  volumeOfDistribution : ℝ
  eliminationRate : ℝ
  absorptionRate : ℝ
  concentration : ℝ -> ℝ
  initialCondition : concentration 0 = 0
  differentialEquation : ∀ t, deriv concentration t = absorptionRate * dose - eliminationRate * concentration t

structure PharmacokineticEvidence (P : PharmacokineticModel) where
  initialConditionClosed : P.initialCondition
  differentialEquationClosed : ∀ t, P.differentialEquation t
  dosePositive : P.dose > 0
  volumePositive : P.volumeOfDistribution > 0
  eliminationRatePositive : P.eliminationRate > 0
  absorptionRatePositive : P.absorptionRate > 0

def PharmacokineticClosed (P : PharmacokineticModel) : Prop :=
  P.initialCondition ∧ (∀ t, P.differentialEquation t) ∧ P.dose > 0 ∧ P.volumeOfDistribution > 0 ∧ P.eliminationRate > 0 ∧ P.absorptionRate > 0

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.initialConditionClosed (And.intro (by intro t; exact E.differentialEquationClosed t) (And.intro E.dosePositive (And.intro E.volumePositive (And.intro E.eliminationRatePositive E.absorptionRatePositive))))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse