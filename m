Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF284C4872
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279182.476813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI2-0008AC-OO; Fri, 25 Feb 2022 15:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279182.476813; Fri, 25 Feb 2022 15:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcI2-00085R-In; Fri, 25 Feb 2022 15:13:50 +0000
Received: by outflank-mailman (input) for mailman id 279182;
 Fri, 25 Feb 2022 15:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI0-0007Bf-Pg
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879ce21b-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:47 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 879ce21b-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+tvgdAnTgDFIQbMFRm+czYIkxCdj45NAL3MUbvPerCo=;
  b=SG+Fv1Hf0KSYHJUJwpZ+Zkd/ZHARVzwHnHWe/Sa9/zvN7HRsDp0hMNJX
   830HmV9VagoWU/6OvzwzIWKrTrDRdhoh07AR0nGckKuPSqLDttt7v1jTp
   OSsn8N7lQ1buFMN5Yx7wUj5FiKQJimsLDzPKURy3ZKyITYcDXJzOyp6M1
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64998373
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TEaeMKhcHvuX9+aHKGjzAh4OX161CxAKZh0ujC45NGQN5FlHY01je
 htvXmiEaPnYMDPxedhyboi3pBtTscTVztZgTVdsri81H34b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVcoOIndms9NaAlFHS17N7VfoeDBGEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2Y+PUSbPEYn1lE/MLEjp+KGhCjDSCRXmXi3oboL5FTuw1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1Zon8WTmpolXUhQ4BVdZVGfUjsV6L85OBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG++Nlbs/7Zcjp0/EdZZPXRECq4/
 T2FpTNWa1473Z9SjPXTEbwqbluRSnn1ouwdulS/soGNtFoRiGuZi2qAswmzARFodtvxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9qmvxoiL+JdgIuFmSwXuF1O5eKFcFh
 2eJ5GtsCGJ7ZiP2PcebnarrYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7eHwO50n+uVZoTCXOEult3ZrnRr1R0Z5oVy2Oq
 4cPb5bRkk4HOAA8CwGOmbMuwZkxBSBTLfjLRwZ/L4Zv/iIO9LkdNsLs
IronPort-HdrOrdr: A9a23:pZEU/aHSMBtPf1+SpLqE4seALOsnbusQ8zAXP0AYc3Nom6uj5q
 WTdZUgpHjJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldARLsSibcKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998373"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 08/29] tools/hotplug: cleanup Makefiles
Date: Fri, 25 Feb 2022 15:13:00 +0000
Message-ID: <20220225151321.44126-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use simply expanded variables when recursively expanded variable
aren't needed. (Use ":=" instead of "=".)

Don't check if a directory already exist when installing, just create
it.

Fix $(HOTPLUGPATH), it shouldn't have any double-quote.

Some reindentation.

FreeBSD, "hotplugpath.sh" is already installed by common/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/hotplug/FreeBSD/Makefile       | 11 +++--------
 tools/hotplug/Linux/Makefile         | 16 ++++++----------
 tools/hotplug/Linux/systemd/Makefile | 16 +++++++---------
 tools/hotplug/NetBSD/Makefile        |  9 +++------
 tools/hotplug/common/Makefile        | 16 ++++++----------
 5 files changed, 25 insertions(+), 43 deletions(-)

diff --git a/tools/hotplug/FreeBSD/Makefile b/tools/hotplug/FreeBSD/Makefile
index de9928cd86..a6552c9884 100644
--- a/tools/hotplug/FreeBSD/Makefile
+++ b/tools/hotplug/FreeBSD/Makefile
@@ -2,18 +2,15 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
-XEN_SCRIPTS = vif-bridge block
+XEN_SCRIPTS := vif-bridge block
 
-XEN_SCRIPT_DATA =
+XEN_SCRIPT_DATA :=
 
-XEN_RCD_PROG = rc.d/xencommons rc.d/xendriverdomain
+XEN_RCD_PROG := rc.d/xencommons rc.d/xendriverdomain
 
 .PHONY: all
 all:
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: install-scripts install-rcd
 
@@ -44,12 +41,10 @@ install-rcd:
 	   do \
 	   $(INSTALL_PROG) $$i $(DESTDIR)$(INITD_DIR); \
 	done
-	$(INSTALL_DATA) ../common/hotplugpath.sh $(DESTDIR)$(XEN_SCRIPT_DIR)
 
 .PHONY: uninstall-rcd
 uninstall-rcd:
 	rm -f $(addprefix $(DESTDIR)$(INITD_DIR)/, $(XEN_RCD_PROG))
-	rm -f $(DESTDIR)$(XEN_SCRIPT_DIR)/hotplugpath.sh
 
 .PHONY: clean
 clean:
diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
index 0b1d111d7e..9a7b3a3515 100644
--- a/tools/hotplug/Linux/Makefile
+++ b/tools/hotplug/Linux/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
-XEN_SCRIPTS = vif-bridge
+XEN_SCRIPTS := vif-bridge
 XEN_SCRIPTS += vif-route
 XEN_SCRIPTS += vif-nat
 XEN_SCRIPTS += vif-openvswitch
@@ -22,16 +22,13 @@ XEN_SCRIPTS += launch-xenstore
 
 SUBDIRS-$(CONFIG_SYSTEMD) += systemd
 
-XEN_SCRIPT_DATA = xen-script-common.sh locking.sh logging.sh
+XEN_SCRIPT_DATA := xen-script-common.sh locking.sh logging.sh
 XEN_SCRIPT_DATA += xen-hotplug-common.sh xen-network-common.sh vif-common.sh
 XEN_SCRIPT_DATA += block-common.sh
 
 .PHONY: all
 all: subdirs-all
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: install-initd install-scripts subdirs-install
 
@@ -41,9 +38,9 @@ uninstall: uninstall-initd uninstall-scripts subdirs-uninstall
 # See docs/misc/distro_mapping.txt for INITD_DIR location
 .PHONY: install-initd
 install-initd:
-	[ -d $(DESTDIR)$(INITD_DIR) ] || $(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
-	[ -d $(DESTDIR)$(SYSCONFIG_DIR) ] || $(INSTALL_DIR) $(DESTDIR)$(SYSCONFIG_DIR)
-	[ -d $(DESTDIR)$(LIBEXEC_BIN) ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(SYSCONFIG_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_DATA) init.d/sysconfig.xendomains $(DESTDIR)$(SYSCONFIG_DIR)/xendomains
 	$(INSTALL_DATA) init.d/sysconfig.xencommons $(DESTDIR)$(SYSCONFIG_DIR)/xencommons
 	$(INSTALL_PROG) xendomains $(DESTDIR)$(LIBEXEC_BIN)
@@ -64,8 +61,7 @@ uninstall-initd:
 
 .PHONY: install-scripts
 install-scripts:
-	[ -d $(DESTDIR)$(XEN_SCRIPT_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
 	set -e; for i in $(XEN_SCRIPTS); \
 	    do \
 	    $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SCRIPT_DIR); \
diff --git a/tools/hotplug/Linux/systemd/Makefile b/tools/hotplug/Linux/systemd/Makefile
index a5d41d86ef..26df2a43b1 100644
--- a/tools/hotplug/Linux/systemd/Makefile
+++ b/tools/hotplug/Linux/systemd/Makefile
@@ -1,12 +1,12 @@
 XEN_ROOT = $(CURDIR)/../../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-XEN_SYSTEMD_MODULES = xen.conf
+XEN_SYSTEMD_MODULES := xen.conf
 
-XEN_SYSTEMD_MOUNT =  proc-xen.mount
+XEN_SYSTEMD_MOUNT := proc-xen.mount
 XEN_SYSTEMD_MOUNT += var-lib-xenstored.mount
 
-XEN_SYSTEMD_SERVICE  = xenstored.service
+XEN_SYSTEMD_SERVICE := xenstored.service
 XEN_SYSTEMD_SERVICE += xenconsoled.service
 XEN_SYSTEMD_SERVICE += xen-qemu-dom0-disk-backend.service
 XEN_SYSTEMD_SERVICE += xendomains.service
@@ -14,7 +14,7 @@ XEN_SYSTEMD_SERVICE += xen-watchdog.service
 XEN_SYSTEMD_SERVICE += xen-init-dom0.service
 XEN_SYSTEMD_SERVICE += xendriverdomain.service
 
-ALL_XEN_SYSTEMD =	$(XEN_SYSTEMD_MODULES)  \
+ALL_XEN_SYSTEMD :=	$(XEN_SYSTEMD_MODULES)  \
 			$(XEN_SYSTEMD_MOUNT)	\
 			$(XEN_SYSTEMD_SERVICE)
 
@@ -30,10 +30,8 @@ distclean: clean
 
 .PHONY: install
 install: $(ALL_XEN_SYSTEMD)
-	[ -d $(DESTDIR)$(XEN_SYSTEMD_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
-	[ -d $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
 	$(INSTALL_DATA) *.service $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.mount $(DESTDIR)$(XEN_SYSTEMD_DIR)
 	$(INSTALL_DATA) *.conf $(DESTDIR)$(XEN_SYSTEMD_MODULES_LOAD)
@@ -48,5 +46,5 @@ $(XEN_SYSTEMD_MODULES):
 	rm -f $@.tmp
 	for mod in $(LINUX_BACKEND_MODULES) ; do \
 		echo $$mod ; \
-		done > $@.tmp
+	done > $@.tmp
 	$(call move-if-changed,$@.tmp,$@)
diff --git a/tools/hotplug/NetBSD/Makefile b/tools/hotplug/NetBSD/Makefile
index f909ffa367..1cd3db2ccb 100644
--- a/tools/hotplug/NetBSD/Makefile
+++ b/tools/hotplug/NetBSD/Makefile
@@ -2,22 +2,19 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
-XEN_SCRIPTS =
+XEN_SCRIPTS :=
 XEN_SCRIPTS += locking.sh
 XEN_SCRIPTS += block
 XEN_SCRIPTS += vif-bridge
 XEN_SCRIPTS += vif-ip
 XEN_SCRIPTS += qemu-ifup
 
-XEN_SCRIPT_DATA =
-XEN_RCD_PROG = rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog rc.d/xendriverdomain
+XEN_SCRIPT_DATA :=
+XEN_RCD_PROG := rc.d/xencommons rc.d/xendomains rc.d/xen-watchdog rc.d/xendriverdomain
 
 .PHONY: all
 all:
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: install-scripts install-rcd
 
diff --git a/tools/hotplug/common/Makefile b/tools/hotplug/common/Makefile
index ef48bfacc9..e8a8dbea6c 100644
--- a/tools/hotplug/common/Makefile
+++ b/tools/hotplug/common/Makefile
@@ -1,22 +1,19 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-HOTPLUGPATH="hotplugpath.sh"
+HOTPLUGPATH := hotplugpath.sh
 
 # OS-independent hotplug scripts go in this directory
 
 # Xen scripts to go there.
-XEN_SCRIPTS =
-XEN_SCRIPT_DATA = $(HOTPLUGPATH)
+XEN_SCRIPTS :=
+XEN_SCRIPT_DATA := $(HOTPLUGPATH)
 
 genpath-target = $(call buildmakevars2file,$(HOTPLUGPATH))
 $(eval $(genpath-target))
 
 .PHONY: all
-all: build
-
-.PHONY: build
-build: $(HOTPLUGPATH)
+all: $(HOTPLUGPATH)
 
 .PHONY: install
 install: install-scripts
@@ -25,9 +22,8 @@ install: install-scripts
 uninstall: uninstall-scripts
 
 .PHONY: install-scripts
-install-scripts: build
-	[ -d $(DESTDIR)$(XEN_SCRIPT_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
+install-scripts: all
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_SCRIPT_DIR)
 	set -e; for i in $(XEN_SCRIPTS); \
 	   do \
 	   $(INSTALL_PROG) $$i $(DESTDIR)$(XEN_SCRIPT_DIR); \
-- 
Anthony PERARD


