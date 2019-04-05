@echo off
set config=Release
set platform=AnyCPU
set warnings=1591,1572,1573,1570,1000,1587

set buildargs=/p:Configuration="%config%" /p:Platform="%platform%" /p:NoWarn="%warnings%" /v:minimal 
set buildargsTests=/p:Configuration="Debug" /p:Platform="%platform%" /p:NoWarn="%warnings%" /v:minimal 

echo Building XamForms.Controls.Calendar...

msbuild XamForms.Controls.Calendar/XamForms.Controls.Calendar.csproj %buildargs%
msbuild XamForms.Controls.Calendar.Droid/XamForms.Controls.Calendar.Droid.csproj %buildargs%
msbuild XamForms.Controls.Calendar.iOS/XamForms.Controls.Calendar.iOS.csproj %buildargs%

echo Building CalendarDemo...

msbuild Example/CalendarDemo/CalendarDemo/CalendarDemo.csproj %buildargs%
msbuild Example/CalendarDemo/CalendarDemo.Droid/CalendarDemo.Droid.csproj %buildargs%
msbuild Example/CalendarDemo/CalendarDemo.iOS/CalendarDemo.iOS.csproj %buildargs%

echo Creating Nuget Packages...

nuget pack FinalSprint.Controls.Calendar.nuspec

xcopy *.nupkg packages\*.* /Y
del *.nupkg

echo All done.