# Release

> This document explains how a new release is created for PVPWarn

* Update version of Addon
  * Code/Constants.lua - PVPW_CONSTANTS.ADDON_VERSION
* Check for loglevel in `PVPW_Logger.lua` and set level to 1 (error)
* Check for logEvent in `PVPW_Logger.lua` and set to false
* Create a new git tag
  * git tag vx.x.x
  * git push origin --tags
* Draft new Github release with description
  * Title should be the version e.g. vx.x.x
  * Short description of what was added newly
* Prepare upload of downloadable version to the created release
  * Download full created tag
  * Remove Docs folder to keep the footprint small
  * Remove git related files .git folder, .gitignore, .gitattributes
  * Remove .xcf project files from Assets/Images
  * Remove .png texture files - leave only .blp version of textures
  * Remove or comment testclass entries from .toc
  * Remove testclass files from project
  * Pack to zipfile (make sure that the name of the unpacked folder is PVPWarn)
