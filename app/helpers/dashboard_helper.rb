module DashboardHelper
  def blood_name_and_ranges
    { hb: BloodProbe::HEMOGLOBIN_RANGE,
      mcv: BloodProbe::MEAN_CELL_VOLUME_RANGE,
      wbc: BloodProbe::WHITE_BLOOD_CELLS_RANGE,
      platelets: BloodProbe::PLATELETS_RANGE ,
      neutrophils: BloodProbe::NEUTROPHILS_RANGE,
      lymphocytes: BloodProbe::LYMPHOCYTES_RANGE,
      alt: BloodProbe::ALANINE_AMINOTRANSFERASE_RANGE,
      alk_phos: BloodProbe::ALKALINE_PHOSPHATASE_RANGE,
      creatinine: BloodProbe::CREATININE_RANGE,
      esr: BloodProbe::ERYTHROCYTE_SEDIMENTATION_RATE_RANGE,
      crp: BloodProbe::C_REACTIVE_PROTEIN_RANGE
    }
  end

  def positive_percentage
    (((moodiness.select {|score| score > 0}.count).to_f)/ (moodiness.length).to_f * 100)
  end

  def negative_percentage
    (((moodiness.select {|score| score < 0}.count).to_f)/ (moodiness.length).to_f * 100)
  end

  def neutral_percentage
    (((moodiness.select {|score| score == 0}.count).to_f)/ (moodiness.length).to_f * 100)
  end

  def moodiness
    Mood.all.inject([]) {|moods, mood| moods << mood.score }
  end
end
