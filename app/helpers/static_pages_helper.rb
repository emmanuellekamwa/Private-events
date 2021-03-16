module StaticPagesHelper
    def header_link
        if signed_in?
            return {
                text: "#{current_user.name}(Sign Out)",
                path: signout_path,
                method: "delete"
            }
        else
            return {
                text: "Sign In",
                path: signin_path,
                method: nil
            }
        end
    end
end
