#! /bin/bash

# -- �û��ֶ�����

# -------------------------------
# -- IOS
# -------------------------------

# -------------------------------
# -- Tools
# -------------------------------

# -- ϵͳ�Զ�����

# -------------------------------
# -- IOS
# -------------------------------

# -------------------------------
# -- DxM
# -------------------------------
DXM_FRAMEWORK=$(pwd)/$(dirname $0)
DXM_TOOLS=${DXM_FRAMEWORK}/dxm/tools
DXM_INSTALL=${DXM_FRAMEWORK}/install
DXM_CMAKE=${DXM_FRAMEWORK}/dxm/cmake

# -- �������б�������ʱ�ļ�
echo $DXM_FRAMEWORK >var_dxm_framework.txt
echo $DXM_TOOLS >var_dxm_tools.txt
echo $DXM_INSTALL >var_DXM_INSTALL.txt
echo $DXM_CMAKE >var_dxm_cmake.txt

chmod 777 ${DXM_INSTALL}/inc