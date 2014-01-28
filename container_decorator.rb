class ContainerDecorator < SimpleDelegator

  def image_id
    self.json['Image']
  end

  def path
    self.json['Path']
  end

  def args
    self.json['Args']
  end

  def created_at
    Time.parse(self.json['Created'])
  end

  def state
    self.json['State']
  end

  def ghost?
    !!state['Ghost']
  end

  def running?
    !!state['Running']
  end

  def exit_code
    state['ExitCode']
  end

  def started_at
    Time.parse(state['StartedAt'])
  end
end