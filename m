Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF8459054C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 19:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384954.620553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXM-0001rF-Oq; Thu, 11 Aug 2022 17:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384954.620553; Thu, 11 Aug 2022 17:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXM-0001fg-9a; Thu, 11 Aug 2022 17:00:00 +0000
Received: by outflank-mailman (input) for mailman id 384954;
 Thu, 11 Aug 2022 16:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNO-0003Aq-6b
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95297b85-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:36 +0200 (CEST)
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
X-Inumbo-ID: 95297b85-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WWgKKsGpMO0s5/MpdnydWA9yplEqj5PrJ/SuQ+hxLac=;
  b=Z2IliiFVz30TrJkggKbdYyyPykX3xuEqDgmyBhEAfMz1GFZ0OO+yTxQp
   85NvynIbftSCCWHRj2OwJrrAw7/wtDQ5gD6Ei4SUA0hXJwKdzZ0XfrP2K
   M3Z1Yuoz49ksoF4BNZ7vYV1+XffdxrTLInXnwnxB53myOrq/QMaRfOc1r
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78334375
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XTZfqKjcttlOaiQA46HuDZ7+X161PRAKZh0ujC45NGQN5FlHY01je
 htvWW6BPqmLYWf2c94ibovnoBgB7Z6Ay4RhSVY/r3w9RCgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSr4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eMdc+wLZaWHt0/
 781LAoUXBqnmcKN+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyYIGOJofVGK25mG7Jq
 mTp2Tv0WisiPf2u8wfaqkzzgcHQyHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeSWYM7
 A+kxsnTD39CtIeMe3i56JevlGbnUcQKFlPudRPoXCNcvYe7+NBs10uRJjpwOPXr14OoQFkc1
 xjP9XFj3OtL0Kbnwo3hpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeODEtYji9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvmkmex8wY5ZZI2WBj
 KrvVeR5uvdu0IaCN/crM+pd9exzpUQfKTgVfq+NNYcfCnSAXASG4DtvdSat4owZq2B1yPlXE
 crKLq6R4YMyU/sPIMyeG7hAitfGB0kWmQvueHwM50j+jebCOSXFFe5t3ZnnRrlR0Z5oaT79q
 753X/ZmAT0FOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:Xl3ZDK3cYa2qDKCj4UaCbgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="78334375"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 22/32] tools/hotplug: Generate "hotplugpath.sh" with configure
Date: Thu, 11 Aug 2022 17:48:35 +0100
Message-ID: <20220811164845.38083-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/configure.ac                     |  1 +
 tools/hotplug/common/Makefile          | 10 ++--------
 tools/configure                        |  3 ++-
 tools/hotplug/common/hotplugpath.sh.in | 16 ++++++++++++++++
 4 files changed, 21 insertions(+), 9 deletions(-)
 create mode 100644 tools/hotplug/common/hotplugpath.sh.in

diff --git a/tools/configure.ac b/tools/configure.ac
index 09059bc569..18e481d77e 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -7,6 +7,7 @@ AC_INIT([Xen Hypervisor Tools], m4_esyscmd([../version.sh ../xen/Makefile]),
 AC_CONFIG_SRCDIR([libs/light/libxl.c])
 AC_CONFIG_FILES([
 ../config/Tools.mk
+hotplug/common/hotplugpath.sh
 hotplug/FreeBSD/rc.d/xencommons
 hotplug/FreeBSD/rc.d/xendriverdomain
 hotplug/Linux/init.d/sysconfig.xencommons
diff --git a/tools/hotplug/common/Makefile b/tools/hotplug/common/Makefile
index e8a8dbea6c..62afe1019e 100644
--- a/tools/hotplug/common/Makefile
+++ b/tools/hotplug/common/Makefile
@@ -1,19 +1,14 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-HOTPLUGPATH := hotplugpath.sh
-
 # OS-independent hotplug scripts go in this directory
 
 # Xen scripts to go there.
 XEN_SCRIPTS :=
-XEN_SCRIPT_DATA := $(HOTPLUGPATH)
-
-genpath-target = $(call buildmakevars2file,$(HOTPLUGPATH))
-$(eval $(genpath-target))
+XEN_SCRIPT_DATA := hotplugpath.sh
 
 .PHONY: all
-all: $(HOTPLUGPATH)
+all:
 
 .PHONY: install
 install: install-scripts
@@ -40,7 +35,6 @@ uninstall-scripts:
 
 .PHONY: clean
 clean:
-	rm -f $(HOTPLUGPATH)
 
 .PHONY: distclean
 distclean: clean
diff --git a/tools/configure b/tools/configure
index acd9a04c3b..6199823f5a 100755
--- a/tools/configure
+++ b/tools/configure
@@ -2456,7 +2456,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
-ac_config_files="$ac_config_files ../config/Tools.mk hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
+ac_config_files="$ac_config_files ../config/Tools.mk hotplug/common/hotplugpath.sh hotplug/FreeBSD/rc.d/xencommons hotplug/FreeBSD/rc.d/xendriverdomain hotplug/Linux/init.d/sysconfig.xencommons hotplug/Linux/init.d/sysconfig.xendomains hotplug/Linux/init.d/xen-watchdog hotplug/Linux/init.d/xencommons hotplug/Linux/init.d/xendomains hotplug/Linux/init.d/xendriverdomain hotplug/Linux/launch-xenstore hotplug/Linux/vif-setup hotplug/Linux/xen-hotplug-common.sh hotplug/Linux/xendomains hotplug/NetBSD/rc.d/xencommons hotplug/NetBSD/rc.d/xendriverdomain ocaml/libs/xs/paths.ml ocaml/xenstored/paths.ml ocaml/xenstored/oxenstored.conf"
 
 ac_config_headers="$ac_config_headers config.h"
 
@@ -10947,6 +10947,7 @@ for ac_config_target in $ac_config_targets
 do
   case $ac_config_target in
     "../config/Tools.mk") CONFIG_FILES="$CONFIG_FILES ../config/Tools.mk" ;;
+    "hotplug/common/hotplugpath.sh") CONFIG_FILES="$CONFIG_FILES hotplug/common/hotplugpath.sh" ;;
     "hotplug/FreeBSD/rc.d/xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xencommons" ;;
     "hotplug/FreeBSD/rc.d/xendriverdomain") CONFIG_FILES="$CONFIG_FILES hotplug/FreeBSD/rc.d/xendriverdomain" ;;
     "hotplug/Linux/init.d/sysconfig.xencommons") CONFIG_FILES="$CONFIG_FILES hotplug/Linux/init.d/sysconfig.xencommons" ;;
diff --git a/tools/hotplug/common/hotplugpath.sh.in b/tools/hotplug/common/hotplugpath.sh.in
new file mode 100644
index 0000000000..1036b884b8
--- /dev/null
+++ b/tools/hotplug/common/hotplugpath.sh.in
@@ -0,0 +1,16 @@
+sbindir="@sbindir@"
+bindir="@bindir@"
+LIBEXEC="@LIBEXEC@"
+LIBEXEC_BIN="@LIBEXEC_BIN@"
+libdir="@libdir@"
+SHAREDIR="@SHAREDIR@"
+XENFIRMWAREDIR="@XENFIRMWAREDIR@"
+XEN_CONFIG_DIR="@XEN_CONFIG_DIR@"
+XEN_SCRIPT_DIR="@XEN_SCRIPT_DIR@"
+XEN_LOCK_DIR="@XEN_LOCK_DIR@"
+XEN_RUN_DIR="@XEN_RUN_DIR@"
+XEN_PAGING_DIR="@XEN_PAGING_DIR@"
+XEN_DUMP_DIR="@XEN_DUMP_DIR@"
+XEN_LOG_DIR="@XEN_LOG_DIR@"
+XEN_LIB_DIR="@XEN_LIB_DIR@"
+XEN_RUN_STORED="@XEN_RUN_STORED@"
-- 
Anthony PERARD


