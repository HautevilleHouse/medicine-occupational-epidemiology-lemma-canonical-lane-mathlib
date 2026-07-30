import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  doseRegimen : ℕ → ℝ
  plasmaConcentration : ℕ → ℝ
  therapeuticWindowLower : ℝ
  therapeuticWindowUpper : ℝ
  steadyStateConcentration : ℝ
  withinWindow : Prop

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.withinWindow

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  withinWindowClosed : P.withinWindow

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact E.withinWindowClosed

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse