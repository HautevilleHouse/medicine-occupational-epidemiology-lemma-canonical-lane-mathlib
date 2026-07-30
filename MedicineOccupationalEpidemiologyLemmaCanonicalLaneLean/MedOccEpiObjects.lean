import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure MedOccEpiStudySpace where
  studyPopulation : Type
  exposureDefinition : String
  outcomeDefinition : String
  confoundingVariables : List String
  studyDesign : String

structure MedOccEpiAdmittedObject where
  study : MedOccEpiStudySpace
  studyHypothesis : Prop
  effectMeasure : Prop
  confoundingControlled : Prop
  conclusion : effectMeasure ∧ confoundingControlled

def MedOccEpiWitnessClosed (O : MedOccEpiAdmittedObject) : Prop :=
  O.effectMeasure ∧ O.confoundingControlled

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
