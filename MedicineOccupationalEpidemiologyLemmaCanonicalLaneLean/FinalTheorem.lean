import canonicalLaneMathlib.AdmissibleClass
import MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean.CompartmentModels
import MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean.DiagnosticInference
import MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

def MedicineOccupationalEpidemiologyLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem medicine_occupational_epidemiology_endgame (A : AdmissibleClass) :
    MedicineOccupationalEpidemiologyLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
