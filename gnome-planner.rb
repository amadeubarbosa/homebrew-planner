# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
 class GnomePlanner < Formula
  desc "Planner is a project management tool for the GNOME desktop, for planning, scheduling and tracking projects."
  homepage "https://wiki.gnome.org/Apps/Planner"
  url "http://ftp.gnome.org/pub/GNOME/sources/planner/0.14/planner-0.14.6.tar.xz"
  sha256 "130d29e6d6b8c1994017deba2acca05a4bf83ba1e169635ec8c5c7878abe0696"
   # depends_on "cmake" => :build
   depends_on "gnome-common"
   depends_on "intltool"
   depends_on "gtk-doc"
   depends_on "gettext"
   depends_on "pkgconfig"
   depends_on "gconf"
   depends_on "glib"
   depends_on "orbit" 
   depends_on "gtk+" 
   depends_on "libglade" 
   depends_on "pango" 
   depends_on "cairo" 
   depends_on "pixman" 
   depends_on "fontconfig" 
   depends_on "libgnomecanvas"
   depends_on "aisipos/libgnomeui/libgnomeui"
   depends_on "scrollkeeper"
   depends_on "python"
   def install
    # ENV.deparallelize  # if your formula fails when building in parallel
     # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-python=no"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end
   test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test planner`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
