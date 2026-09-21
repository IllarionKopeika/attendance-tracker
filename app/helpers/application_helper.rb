module ApplicationHelper
  def permitted_student_params(params)
    params.fetch(:q, {}).permit(:name_cont, :groups_name_eq, :sorts, :s)
  end

  def format_teaching_method(teaching_method)
    if teaching_method.nil?
      ""
    else
      t("teaching_methods.#{teaching_method}")
    end
  end

  def format_date(date)
    if date.nil?
      ""
    else
      date.strftime("%Y-%m-%d")
    end
  end
end
