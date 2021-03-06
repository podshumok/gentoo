# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
ROS_REPO_URI="https://github.com/mavlink/mavros"
KEYWORDS="~amd64 ~arm"
PYTHON_COMPAT=( python{2_7,3_5,3_6} pypy{,3} )
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="Extra nodes and plugins for mavros"
LICENSE="GPL-3 LGPL-3 BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/image_transport
	dev-ros/cv_bridge
	dev-ros/mavros
	dev-ros/roscpp
	dev-ros/mavros_msgs[${CATKIN_MESSAGES_CXX_USEDEP},${CATKIN_MESSAGES_PYTHON_USEDEP}]
	dev-ros/sensor_msgs[${CATKIN_MESSAGES_CXX_USEDEP},${CATKIN_MESSAGES_PYTHON_USEDEP}]
	dev-ros/geometry_msgs[${CATKIN_MESSAGES_CXX_USEDEP},${CATKIN_MESSAGES_PYTHON_USEDEP}]
	dev-ros/std_msgs[${CATKIN_MESSAGES_PYTHON_USEDEP}]
	dev-ros/visualization_msgs[${CATKIN_MESSAGES_CXX_USEDEP}]
	dev-ros/urdf
	dev-cpp/eigen:3
	dev-libs/boost:=
	dev-libs/console_bridge:=
"
DEPEND="${RDEPEND}"
