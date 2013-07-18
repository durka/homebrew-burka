require 'formula'

class Aruco < Formula
    homepage 'http://www.uco.es/investiga/grupos/ava/node/26'
    url 'http://sourceforge.net/projects/aruco/files/1.2.4/aruco-1.2.4.tgz'
    sha1 '78e6ba073d59eae1ac62ba0ac226ff6f39a83d59'

    depends_on 'opencv'
    depends_on 'cmake' => :build
    
    def install
        mkdir 'build' do
            system 'cmake', '..', *std_cmake_args
            system 'make'
            system 'make install'
        end
    end
end


