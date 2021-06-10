workspace "OpenGLRND"
    architecture "x64"
    configurations { "Debug" , "Release" }

outputdir = "%{cfg.buildcfg}_%{cfg.system}_%{cfg.architecture}"

project "OpenGLRND"
    kind "ConsoleApp"
    language "C++"
    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("int/" ..outputdir.. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    excludes 
    { 
        "%{prj.name}/src/vendor/**.cpp",
        "%{prj.name}/src/vendor/**.h"
    }

    links 
	{ 
        "GLFW",
        "opengl32.lib"
	}	

    filter "system:windows"
        cppdialect "C++20"
        systemversion "latest"

        defines
        {
            "GLFW_INCLUDE_NONE"
        }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"