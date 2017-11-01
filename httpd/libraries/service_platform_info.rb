module Httpd
  module Service
    module Helpers
      # package and service name information section

      def default_httpd_version_for(platform, platform_family, platform_version)
        keyname = keyname_for(platform, platform_family, platform_version)
        PlatformInfo.httpd_info[platform_family][keyname]['default_version']
      rescue NoMethodError
        nil
      end

      def package_name_for(platform, platform_family, platform_version, version)
        keyname = keyname_for(platform, platform_family, platform_version)
        PlatformInfo.httpd_info[platform_family][keyname][version]['package_name']
      rescue NoMethodError
        nil
      end

      def keyname_for(platform, platform_family, platform_version)
        case
        when platform_family == 'rhel'
          platform == 'amazon' ? platform_version : platform_version.to_i.to_s
        when platform_family == 'fedora'
          platform_version
        when platform_family == 'debian'
          if platform == 'ubuntu'
            platform_version
          elsif platform_version =~ /sid$/
            platform_version
          else
            platform_version.to_i.to_s
          end
        when platform_family == 'smartos'
          platform_version
        when platform_family == 'omnios'
          platform_version
        end
      rescue NoMethodError
        nil
      end

      class PlatformInfo
        def self.httpd_info
          @httpd_info ||= {
            'rhel' => {
              '5' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'httpd'
                }
              },
              '6' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'httpd'
                }
              },
              '7' => {
                'default_version' => '2.4',
                '2.4' => {
                  'package_name' => 'httpd'
                }
              },
              '2013.03' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'httpd'
                }
              },
              '2013.09' => {
                'default_version' => '2.4',
                '2.2' => {
                  'package_name' => 'httpd'
                },
                '2.4' => {
                  'package_name' => 'httpd24'
                }
              },
              '2014.03' => {
                'default_version' => '2.4',
                '2.2' => {
                  'package_name' => 'httpd'
                },
                '2.4' => {
                  'package_name' => 'httpd24'
                }
              }
            },
            'fedora' => {
              '20' => {
                'default_version' => '2.4',
                '2.4' => {
                  'package_name' => 'httpd'
                }
              }
            },
            'debian' => {
              '7' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'apache2'
                }
              },
              'jessie/sid' => {
                'default_version' => '2.4',
                '2.4' => {
                  'package_name' => 'apache2'
                }
              },
              '12.04' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'apache2'
                }
              },
              '13.04' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'apache2'
                }
              },
              '13.10' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'apache2'
                }
              },
              '14.04' => {
                'default_version' => '2.4',
                '2.4' => {
                  'package_name' => 'apache2'
                }
              }
            },
            'smartos' => {
              # Do this or now, until Ohai correctly detects a
              # smartmachine vs global zone (base64 13.4.0) from /etc/product
              '5.11' => {
                'default_version' => '2.4',
                '2.0' => {
                  'package_name' => 'apache'
                },
                '2.2' => {
                  'package_name' => 'apache'
                },
                '2.4' => {
                  'package_name' => 'apache'
                }
              }
            },
            'omnios' => {
              '151006' => {
                'default_version' => '2.2',
                '2.2' => {
                  'package_name' => 'apache22'
                }
              }
            }
          }
        end
      end
    end
  end
end
