module ApplicationHelper
  def permitted_student_params(params)
    params.fetch(:q, {}).permit(:name_cont, :groups_name_eq, :sorts, :s)
  end
end
