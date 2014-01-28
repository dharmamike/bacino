class ImageDecorator < SimpleDelegator

  def repository
    self.info['Repository']
  end

  def tag
    self.info['Tag']
  end

  def created_at
    if self.info.any?
      Time.at(self.info['Created'])
    else
      Time.parse(self.json['created'])
    end
  end

  def size_mb
    self.info['Size']/1000000.0
  end

  def virtual_size_mb
    self.info['VirtualSize']/1000000.0
  end

  def parent_id
    self.json['parent']
  end

  def container_id
    self.json['container']
  end

  def config
    self.json['config']
  end

  def hostname
    config['Hostname'] if config
  end

  def user
    self.json['user']
  end

  def cmd
    config['Cmd'] if config
  end

  def volumes
    self.json['Volumes']
  end

  def volumes_from
    self.json['VolumesFrom']
  end

end