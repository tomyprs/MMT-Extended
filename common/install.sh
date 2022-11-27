# @kai_verse
# Module extended 
# Here all variable
# You can join our channel at https://kai_verse.tme

# Variable
DUBUG_FLAG=false
SKIPMOUNT=false

MODULE_DATE=`grep_prop module_date $TMPDIR/module.prop`
TOO_EARLY_DATE=`grep_prop too_early_date $TMPDIR/module.prop`
BUILD_DATE=`getprop ro.system.build.date`
    
# As system prop modified 
PROPFILE=false

# Running Post-fs service
POSTFSDATA=false

# Running Late service 
LATESTARTSERVICE=false

# Replace File or folder
REPLACE=""

# Grep android version
var_version="`grep_prop ro.build.version.release`"

# Grep Miui version
var_MIUI_version="`grep_prop ro.miui.ui.version.name`"

# Module version
module_version="`grep_prop version $TMPDIR/module.prop`"

# Module name
module_name="`grep_prop name $TMPDIR/module.prop`"

# Module id
module_id="`grep_prop id $TMPDIR/module.prop`"

# Authority
module_author="`grep_prop author $TMPDIR/module.prop`"

# Required version 
module_require_version="`grep_prop require_version $TMPDIR/module.prop`"

# Device required 
module_require_device="`grep_prop require_device $TMPDIR/module.prop`"

# required miui
module_require_MIUI_version="`grep_prop require_MIUI_version $TMPDIR/module.prop`"

# Print all
MIUI_VERSION="`getprop ro.system.build.version.incremental`"
id="`grep_prop id $TMPDIR/module.prop`"
var_device="`getprop ro.product.device`"
var_version="`grep_prop ro.build.version.release`"

# Checking
    if [ $API -lt 30 ] || [ $API -gt 33 ] ; then
        ui_print " "
        ui_print " *Warning: Unavailable for 
        current Android version!"
        ui_print " "
        ui_print " - Install exited"
        ui_print " "
        sleep 2
        Warning=true
        exit 1
    fi
  
  ui_print "*******************************************"
  ui_print "   $module_name "
  ui_print "   author: $module_author"
  ui_print "   version: $module_version"
  sleep 2
  ui_print "*******************************************"
  ui_print "   ** Device Information **"
  ui_print "   device: $var_device"
  ui_print "   Android: $var_version"
  ui_print "   Android API: $API"
  ui_print "   MIUI: $MIUI_VERSION"
  sleep 2
  ui_print "*******************************************"
  ui_print " "
  ui_print " "
  sleep 2
  ui_print "*******************************************"
  ui_print " Installation executed."
  
#chooseport

  ui_print "-$ARCH SDK $API"
  ui_print "  Installing for $ARCH SDK $API device..."
  ui_print " "
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  TMPAPKDIR=/data/local/tmp
  cp -rf $MODPATH/system/priv-app/MiuiCamera/MiuiCamera.apk $TMPAPKDIR
  result=$(pm install ${TMPAPKDIR}/MiuiCamera.apk 2>&1)
  if [ $result = Success ];then
    echo
    ui_print "- 正在提取模組文件"
    ui_print "  Extracting mod files"
    ui_print " "
    sleep 2
    ui_print "- 將安裝在系統分區..."
    ui_print "  will be installed on the system partition..."
    ui_print " "
    sleep 2
    ui_print "✓ 相機安裝完成"
    ui_print "  Camera installation completed"
    ui_print " "
    echo
  fi
    # 清除缓存
  ui_print "- 開始清理暫存碎片"
  ui_print "  Start clearing system cache files"
  ui_print " "
  sleep 2
  ui_print "- 刪除 package_cache 文件"
  ui_print "  delete package_cache file"
  ui_print " "
  sleep 2
    /dev/*/.magisk/busybox/fstrim -v /cache 
    rm -rf /data/system/package_cache/*
  ui_print "  cleaning cache files done ✓"
  ui_print " "
    mkdir -p $MODPATH/system/app/MIUISystemUIPlugin/lib/${Type}
    mkdir -p $MODPATH/MIUISystemUIPlugin
    unzip -o $MODPATH/system/priv-app/MIUISystemUIPlugin/MIUISystemUIPlugin -d $MODPATH/MIUISystemUIPlugin >&2
    cp -rf $MODPATH/MIUISystemUIPlugin/lib/${Wenj}/* $MODPATH/system/priv-app/MIUISystemUIPlugin/lib/${Type}
    rm -rf $MODPATH/Camera
touch /data/adb/modules/MIUISysPlugin_Mod/remove
ui_print "  Removing old mods (if installed..)"
ui_print " "
sleep 2
ui_print "
- remind:
  If the boot loop after flashing, please
  Recovery→Advanced→File Management
  →data→adb→modules
  Delete the corresponding $id folder, 
  If you don't know, use Google search to find 
  the answer
"
sleep 2
tmp_list="MIUISystemUIPlugin"

dda=/data/dalvik-cache/arm
[ -d $dda"64" ] && dda=$dda"64"
for i in $tmp_list; do
	rm -f $dda/system@*@"$i"*
done
