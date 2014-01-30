class Image

  extend ActiveModel::Model

  delegate :id, :info, :json, to: :@docker_image

  def initialize(docker_image)
    @docker_image = docker_image
  end

  def repository
    info['Repository']
  end

  def tag
    info['Tag']
  end

  def created_at
    if info.any?
      Time.at(info['Created'])
    else
      Time.parse(json['created'])
    end
  end

  def size_mb
    info['Size']/1000000.0
  end

  def virtual_size_mb
    info['VirtualSize']/1000000.0
  end

  def parent_id
    json['parent']
  end

  def container_id
    json['container']
  end

  def config
    json['config']
  end

  def hostname
    config['Hostname'] if config
  end

  def user
    json['user']
  end

  def cmd
    config['Cmd'] if config
  end

  def volumes
    json['Volumes']
  end

  def volumes_from
    json['VolumesFrom']
  end

end