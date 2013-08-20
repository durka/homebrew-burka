require 'formula'

class Aruco < Formula
    homepage 'http://www.uco.es/investiga/grupos/ava/node/26'
    url 'http://sourceforge.net/projects/aruco/files/1.2.4/aruco-1.2.4.tgz'
    sha1 '78e6ba073d59eae1ac62ba0ac226ff6f39a83d59'

    depends_on 'opencv'
    depends_on 'cmake' => :build

    option 'strip-print', 'Strip out an annoying printf in aruco::Marker::calculateExtrinsics'

    def patches
        if build.include? 'strip-print'
           DATA
        end
    end
    
    def install
        mkdir 'build' do
            system 'cmake', '..', *std_cmake_args
            system 'make'
            system 'make install'
        end
    end
end

__END__
diff --git a/src/marker.cpp b/src/marker.cpp
index 62b87ed..1c42b3a 100644
--- a/src/marker.cpp
+++ b/src/marker.cpp
@@ -294,7 +294,6 @@ void Marker::calculateExtrinsics(float markerSizeMeters,cv::Mat  camMatrix,cv::M
     //rotate the X axis so that Y is perpendicular to the marker plane
    if (setYPerperdicular) rotateXAxis(Rvec);
     ssize=markerSizeMeters; 
-    cout<<(*this)<<endl;
     
 }
 
