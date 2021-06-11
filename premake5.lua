workspace "OpenGLRND"
    architecture "x64"
    configurations { "Debug" , "Release" }

outputdir = "%{cfg.buildcfg}_%{cfg.system}_%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "OpenGLRND/src/vendor/GLFW/include"
IncludeDir["Glad"] = "OpenGLRND/src/vendor/Glad/include"
IncludeDir["GLM"] = "OpenGLRND/src/vendor/GLM"


include "OpenGLRND/src/vendor/GLFW"
include "OpenGLRND/src/vendor/Glad" 

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

    includedirs 
	{
		"%{prj.name}/src", 
        "%{IncludeDir.Glad}",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.GLM}"
	}

    links 
	{ 
        "GLFW",
        "Glad",
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