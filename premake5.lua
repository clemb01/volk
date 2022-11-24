project "Volk"
	kind "StaticLib"
	language "C"
	staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"volk.h",
		"volk.c"
	}

	includedirs
	{
		"%{IncludeDir.VulkanSDK}"
	}

	filter "system:linux"
		pic "On"

		systemversion "latest"

		defines
		{
			"VK_USE_PLATFORM_XLIB_KHR"
		}

	filter "system:windows"
		systemversion "latest"

		defines 
		{ 
			"VK_USE_PLATFORM_WIN32_KHR"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
    symbols "off"
