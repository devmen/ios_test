class ContactCreateController < Formotion::FormController
  def initForm
    form = Formotion::Form.new
    form.build_section do |s|
      s.title = "Contact"
      s.build_row do |r|
        r.title = "Name"
        r.key = :name
        r.type = :string
      end
      s.build_row do |r|
        r.title = "Phone"
        r.key = :phone
        r.type = :string
      end
    end
    form.build_section do |s|
      s.build_row do |r|
        r.title = "Save"
        r.type = :submit
      end
    end
    form.on_submit do |f|
      data = f.render
      contact = PFObject.objectWithClassName("Contact")
      contact.setObject(data[:name], forKey:"name")
      contact.setObject(data[:phone], forKey:"phone")
      if contact.save
        f.send(:each_row) {|r,i| r.value = ''} # Clear form
        tabBarController.selectedIndex = 1
        # PFQuery.clearAllCachedResults
        tabBarController.viewControllers[tabBarController.selectedIndex].loadObjects
      else
        alert = UIAlertView.new
        alert.title = 'Result'
        alert.message = "Error"
        alert.addButtonWithTitle 'Ok'
        alert.show
      end
    end
    initWithForm(form).tap do |f|
      f.title = 'Create'
    end
  end
end
