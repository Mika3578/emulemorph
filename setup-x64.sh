#!/bin/bash
# Setup script for x64 build configuration
# This script creates the necessary project files in submodules for x64 support

echo "Setting up x64 build configuration for eMule Morph..."

# Check if we're in the right directory
if [ ! -f "srchybrid/emule.sln" ]; then
    echo "Error: This script must be run from the repository root directory"
    exit 1
fi

# Initialize submodules if needed
echo "Checking submodules..."
if [ ! -d "cryptopp/.git" ]; then
    echo "Initializing submodules..."
    git submodule init
    git submodule update
fi

# Create id3lib.vcxproj
echo "Creating id3lib.vcxproj..."
mkdir -p id3lib/libprj
cat > id3lib/libprj/id3lib.vcxproj << 'ENDOFFILE'
<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup Label="ProjectConfigurations">
    <ProjectConfiguration Include="Debug|Win32">
      <Configuration>Debug</Configuration>
      <Platform>Win32</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Release|Win32">
      <Configuration>Release</Configuration>
      <Platform>Win32</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Debug|x64">
      <Configuration>Debug</Configuration>
      <Platform>x64</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Release|x64">
      <Configuration>Release</Configuration>
      <Platform>x64</Platform>
    </ProjectConfiguration>
  </ItemGroup>
  <PropertyGroup Label="Globals">
    <ProjectGuid>{119FB498-E3AC-49A5-A310-20E8B466B413}</ProjectGuid>
    <RootNamespace>id3lib</RootNamespace>
    <WindowsTargetPlatformVersion>10.0</WindowsTargetPlatformVersion>
  </PropertyGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.props" />
  <ImportGroup Label="ExtensionSettings">
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <PropertyGroup Label="UserMacros" />
  <PropertyGroup>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">Debug\</IntDir>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">Release\</IntDir>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">Debug_x64\</IntDir>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Release|x64'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Release|x64'">Release_x64\</IntDir>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">id3libD</TargetName>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">id3libD</TargetName>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">id3lib</TargetName>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Release|x64'">id3lib</TargetName>
  </PropertyGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <ClCompile>
      <Optimization>Disabled</Optimization>
      <AdditionalIncludeDirectories>.\;..;..\include;..\include\id3;..\zlib\include;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>_DEBUG;WIN32;_MBCS;_LIB;_WINDOWS;HAVE_CONFIG_H;ID3LIB_LINKOPTION=1;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <BasicRuntimeChecks>EnableFastChecks</BasicRuntimeChecks>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
    <ClCompile>
      <Optimization>MaxSpeed</Optimization>
      <InlineFunctionExpansion>AnySuitable</InlineFunctionExpansion>
      <AdditionalIncludeDirectories>.\;..;..\include;..\include\id3;..\zlib\include;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>NDEBUG;WIN32;_MBCS;_LIB;_WINDOWS;HAVE_CONFIG_H;ID3LIB_LINKOPTION=1;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <ClCompile>
      <Optimization>Disabled</Optimization>
      <AdditionalIncludeDirectories>.\;..;..\include;..\include\id3;..\zlib\include;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>_DEBUG;WIN32;_MBCS;_LIB;_WINDOWS;HAVE_CONFIG_H;ID3LIB_LINKOPTION=1;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <BasicRuntimeChecks>EnableFastChecks</BasicRuntimeChecks>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
    <ClCompile>
      <Optimization>MaxSpeed</Optimization>
      <InlineFunctionExpansion>AnySuitable</InlineFunctionExpansion>
      <AdditionalIncludeDirectories>.\;..;..\include;..\include\id3;..\zlib\include;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>NDEBUG;WIN32;_MBCS;_LIB;_WINDOWS;HAVE_CONFIG_H;ID3LIB_LINKOPTION=1;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemGroup>
    <ClCompile Include="..\src\c_wrapper.cpp" />
    <ClCompile Include="..\src\field.cpp" />
    <ClCompile Include="..\src\field_binary.cpp" />
    <ClCompile Include="..\src\field_integer.cpp" />
    <ClCompile Include="..\src\field_string_ascii.cpp" />
    <ClCompile Include="..\src\field_string_unicode.cpp" />
    <ClCompile Include="..\src\frame.cpp" />
    <ClCompile Include="..\src\frame_impl.cpp" />
    <ClCompile Include="..\src\frame_parse.cpp" />
    <ClCompile Include="..\src\frame_render.cpp" />
    <ClCompile Include="..\src\globals.cpp" />
    <ClCompile Include="..\src\header.cpp" />
    <ClCompile Include="..\src\header_frame.cpp" />
    <ClCompile Include="..\src\header_tag.cpp" />
    <ClCompile Include="..\src\helpers.cpp" />
    <ClCompile Include="..\src\io.cpp" />
    <ClCompile Include="..\src\io_decorators.cpp" />
    <ClCompile Include="..\src\io_helpers.cpp" />
    <ClCompile Include="..\src\misc_support.cpp" />
    <ClCompile Include="..\src\mp3_parse.cpp" />
    <ClCompile Include="..\src\readers.cpp" />
    <ClCompile Include="..\src\spec.cpp" />
    <ClCompile Include="..\src\tag.cpp" />
    <ClCompile Include="..\src\tag_file.cpp" />
    <ClCompile Include="..\src\tag_find.cpp" />
    <ClCompile Include="..\src\tag_impl.cpp" />
    <ClCompile Include="..\src\tag_parse.cpp" />
    <ClCompile Include="..\src\tag_parse_lyrics3.cpp" />
    <ClCompile Include="..\src\tag_parse_musicmatch.cpp" />
    <ClCompile Include="..\src\tag_parse_v1.cpp" />
    <ClCompile Include="..\src\tag_render.cpp" />
    <ClCompile Include="..\src\utils.cpp" />
    <ClCompile Include="..\src\writers.cpp" />
  </ItemGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.targets" />
  <ImportGroup Label="ExtensionTargets">
  </ImportGroup>
</Project>
ENDOFFILE

# Create pthread.vcxproj
echo "Creating pthread.vcxproj..."
cat > pthreads/pthread.vcxproj << 'ENDOFFILE'
<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <ItemGroup Label="ProjectConfigurations">
    <ProjectConfiguration Include="Debug|Win32">
      <Configuration>Debug</Configuration>
      <Platform>Win32</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Release|Win32">
      <Configuration>Release</Configuration>
      <Platform>Win32</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Debug|x64">
      <Configuration>Debug</Configuration>
      <Platform>x64</Platform>
    </ProjectConfiguration>
    <ProjectConfiguration Include="Release|x64">
      <Configuration>Release</Configuration>
      <Platform>x64</Platform>
    </ProjectConfiguration>
  </ItemGroup>
  <PropertyGroup Label="Globals">
    <ProjectGuid>{98A1AD27-110A-4C3E-AF0C-4F967E536517}</ProjectGuid>
    <RootNamespace>pthread</RootNamespace>
    <WindowsTargetPlatformVersion>10.0</WindowsTargetPlatformVersion>
  </PropertyGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="Configuration">
    <ConfigurationType>StaticLibrary</ConfigurationType>
    <UseOfMfc>false</UseOfMfc>
    <CharacterSet>MultiByte</CharacterSet>
    <PlatformToolset>v142</PlatformToolset>
  </PropertyGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.props" />
  <ImportGroup Label="ExtensionSettings">
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <ImportGroup Label="PropertySheets" Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
  </ImportGroup>
  <PropertyGroup Label="UserMacros" />
  <PropertyGroup>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">Debug\</IntDir>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">Release\</IntDir>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">Debug_x64\</IntDir>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Release|x64'">$(ProjectDir)</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Release|x64'">Release_x64\</IntDir>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">pthreadVC3d</TargetName>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">pthreadVC3d</TargetName>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">pthreadVC3</TargetName>
    <TargetName Condition="'$(Configuration)|$(Platform)'=='Release|x64'">pthreadVC3</TargetName>
  </PropertyGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <ClCompile>
      <Optimization>Disabled</Optimization>
      <AdditionalIncludeDirectories>.;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>_DEBUG;WIN32;_LIB;HAVE_CONFIG_H;PTW32_STATIC_LIB;PTW32_BUILD;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <BasicRuntimeChecks>EnableFastChecks</BasicRuntimeChecks>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
    <ClCompile>
      <Optimization>MaxSpeed</Optimization>
      <InlineFunctionExpansion>AnySuitable</InlineFunctionExpansion>
      <AdditionalIncludeDirectories>.;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>NDEBUG;WIN32;_LIB;HAVE_CONFIG_H;PTW32_STATIC_LIB;PTW32_BUILD;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <ClCompile>
      <Optimization>Disabled</Optimization>
      <AdditionalIncludeDirectories>.;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>_DEBUG;WIN32;_LIB;HAVE_CONFIG_H;PTW32_STATIC_LIB;PTW32_BUILD;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <BasicRuntimeChecks>EnableFastChecks</BasicRuntimeChecks>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
    <ClCompile>
      <Optimization>MaxSpeed</Optimization>
      <InlineFunctionExpansion>AnySuitable</InlineFunctionExpansion>
      <AdditionalIncludeDirectories>.;%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>NDEBUG;WIN32;_LIB;HAVE_CONFIG_H;PTW32_STATIC_LIB;PTW32_BUILD;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Lib>
      <OutputFile>$(OutDir)$(TargetName)$(TargetExt)</OutputFile>
    </Lib>
  </ItemDefinitionGroup>
  <ItemGroup>
    <ClCompile Include="pthread.c" />
  </ItemGroup>
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.targets" />
  <ImportGroup Label="ExtensionTargets">
  </ImportGroup>
</Project>
ENDOFFILE

echo ""
echo "x64 build configuration setup complete!"
echo ""
echo "The following files have been created:"
echo "  - id3lib/libprj/id3lib.vcxproj"
echo "  - pthreads/pthread.vcxproj"
echo ""
echo "These files are in Git submodules and will show as untracked."
echo "You can now open srchybrid/emule.sln in Visual Studio and build for x64."
echo ""
echo "For more information, see X64_BUILD.md"
