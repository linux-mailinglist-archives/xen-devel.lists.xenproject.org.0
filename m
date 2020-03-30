Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BE5197DBD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 16:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuvJ-0002X7-36; Mon, 30 Mar 2020 13:57:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UV6F=5P=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jIuvH-0002X1-H8
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:57:51 +0000
X-Inumbo-ID: 6eb784fe-728e-11ea-83d8-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6eb784fe-728e-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 13:57:46 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jIuvB-0007Qg-5u; Mon, 30 Mar 2020 14:57:45 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 14:57:33 +0100
Message-Id: <20200330135735.31512-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
References: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [PATCH 1/3] docs etc.: https: Fix references to
 wiki.xen[project.org
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 ian.jackson@eu.citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Yang Hongyang <imhy.yang@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Change the url scheme to https.  This is all in-tree references to the
Xen wiki.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 README                            | 16 ++++++++--------
 config/Paths.mk.in                |  2 +-
 docs/README.colo                  |  2 +-
 docs/README.remus                 |  2 +-
 docs/misc/stubdom.txt             |  2 +-
 docs/misc/vtd.txt                 |  2 +-
 docs/misc/xen-command-line.pandoc |  2 +-
 docs/misc/xenstore.txt            |  2 +-
 tools/libxl/libxlu_cfg.c          |  2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/README b/README
index 92b1de9938..712d05d69d 100644
--- a/README
+++ b/README
@@ -21,15 +21,15 @@ development community, spearheaded by xen.org (http://www.xen.org).
 
 This file contains some quick-start instructions to install Xen on
 your system. For more information see http:/www.xen.org/ and
-http://wiki.xen.org/
+https://wiki.xen.org/
 
 Quick-Start Guide
 =================
 
 First, this is just a quick-start guide. For more comprehensive
 information see the INSTALL file and the Xen wiki at
-http://wiki.xenproject.org and in particular
-http://wiki.xenproject.org/wiki/Getting_Started.
+https://wiki.xenproject.org and in particular
+https://wiki.xenproject.org/wiki/Getting_Started.
 
 Second, there are a number of prerequisites for building a Xen source
 release. Make sure you have all the following installed, either by
@@ -88,10 +88,10 @@ disabled at compile time:
 Second, you need to acquire a suitable kernel for use in domain 0. If
 possible you should use a kernel provided by your OS distributor. If
 no suitable kernel is available from your OS distributor then refer to
-http://wiki.xen.org/wiki/XenDom0Kernels for suggestions for
+https://wiki.xen.org/wiki/XenDom0Kernels for suggestions for
 suitable kernels to use.
 If you are looking to compile a Dom0 kernel from source, please refer to
-http://wiki.xen.org/wiki/XenParavirtOps.
+https://wiki.xen.org/wiki/XenParavirtOps.
 
 [NB. Unless noted otherwise, all the following steps should be
 performed with root privileges.]
@@ -168,9 +168,9 @@ You can change the preferred xenstored you want to use in the configuration
 but since we cannot stop the daemon a reboot will be required to make the
 change take effect.
 
-[0] http://wiki.xen.org/wiki/XenStore
-[1] http://wiki.xen.org/wiki/XenStoreReference
-[2] http://wiki.xen.org/wiki/Xenstored
+[0] https://wiki.xen.org/wiki/XenStore
+[1] https://wiki.xen.org/wiki/XenStoreReference
+[2] https://wiki.xen.org/wiki/Xenstored
 
 Python Runtime Libraries
 ========================
diff --git a/config/Paths.mk.in b/config/Paths.mk.in
index dc9d0c0353..416fc7aab9 100644
--- a/config/Paths.mk.in
+++ b/config/Paths.mk.in
@@ -10,7 +10,7 @@
 #
 # For more documentation you can refer to the wiki:
 #
-# http://wiki.xen.org/wiki/Category:Host_Configuration#System_wide_xen_configuration
+# https://wiki.xen.org/wiki/Category:Host_Configuration#System_wide_xen_configuration
 
 PACKAGE_TARNAME          := @PACKAGE_TARNAME@
 prefix                   := @prefix@
diff --git a/docs/README.colo b/docs/README.colo
index 466eb72152..acb4ee5a0a 100644
--- a/docs/README.colo
+++ b/docs/README.colo
@@ -5,5 +5,5 @@ response in parallel too. If the response packets from PVM and SVM are
 identical, they are released immediately. Otherwise, a VM checkpoint (on demand)
 is conducted.
 
-See the website at http://wiki.xen.org/wiki/COLO_-_Coarse_Grain_Lock_Stepping
+See the website at https://wiki.xen.org/wiki/COLO_-_Coarse_Grain_Lock_Stepping
 for details.
diff --git a/docs/README.remus b/docs/README.remus
index 20783c93da..e41e045a10 100644
--- a/docs/README.remus
+++ b/docs/README.remus
@@ -1,7 +1,7 @@
 Remus provides fault tolerance for virtual machines by sending continuous
 checkpoints to a backup, which will activate if the target VM fails.
 
-See the website at http://wiki.xen.org/wiki/Remus for details.
+See the website at https://wiki.xen.org/wiki/Remus for details.
 
 Using Remus with libxl on Xen 4.5 and higher:
  To enable network buffering, you need libnl 3.2.8
diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index de7b6c7d96..882a18cab4 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -19,7 +19,7 @@ config:
     device_model_stubdomain_override = 1
 
 See xl.cfg(5) for more details of the xl domain configuration syntax
-and http://wiki.xen.org/wiki/Device_Model_Stub_Domains for more
+and https://wiki.xen.org/wiki/Device_Model_Stub_Domains for more
 information on device model stub domains
 
 
diff --git a/docs/misc/vtd.txt b/docs/misc/vtd.txt
index 88b2102e3e..89076a0776 100644
--- a/docs/misc/vtd.txt
+++ b/docs/misc/vtd.txt
@@ -208,7 +208,7 @@ http://www.dell.com/content/products/category.aspx/optix?c=us&cs=555&l=en&s=biz
 - HP Compaq:  DC7800
 http://h10010.www1.hp.com/wwpc/us/en/en/WF04a/12454-12454-64287-321860-3328898.html
 
-For more information, pls refer to http://wiki.xen.org/wiki/VTdHowTo.
+For more information, pls refer to https://wiki.xen.org/wiki/VTdHowTo.
 
 
 Assigning devices to HVM domains
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 02432bdb25..6ff317d15d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -843,7 +843,7 @@ So `<sz>` being `1G+25%` on a 256 GB host would result in 65 GB.
 If you use this option then it is highly recommended that you disable
 any dom0 autoballooning feature present in your toolstack. See the
 _xl.conf(5)_ man page or [Xen Best
-Practices](http://wiki.xen.org/wiki/Xen_Best_Practices#Xen_dom0_dedicated_memory_and_preventing_dom0_memory_ballooning).
+Practices](https://wiki.xen.org/wiki/Xen_Best_Practices#Xen_dom0_dedicated_memory_and_preventing_dom0_memory_ballooning).
 
 This option doesn't have effect if pv-shim mode is enabled.
 
diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
index 7f2b388dd5..04ce0ba607 100644
--- a/docs/misc/xenstore.txt
+++ b/docs/misc/xenstore.txt
@@ -168,7 +168,7 @@ SET_PERMS		<path>|<perm-as-string>|+?
 		r<domid>	read only
 		b<domid>	both read and write
 		n<domid>	no access
-	See http://wiki.xen.org/wiki/XenBus section
+	See https://wiki.xen.org/wiki/XenBus section
 	`Permissions' for details of the permissions system.
 
 ---------- Watches ----------
diff --git a/tools/libxl/libxlu_cfg.c b/tools/libxl/libxlu_cfg.c
index cafc632fc1..f9e8aa2f3a 100644
--- a/tools/libxl/libxlu_cfg.c
+++ b/tools/libxl/libxlu_cfg.c
@@ -74,7 +74,7 @@ static void parse(CfgParseContext *ctx) {
         fputs(
  "warning: Config file looks like it contains Python code.\n"
  "warning:  Arbitrary Python is no longer supported.\n"
- "warning:  See http://wiki.xen.org/wiki/PythonInXlConfig\n",
+ "warning:  See https://wiki.xen.org/wiki/PythonInXlConfig\n",
               ctx->cfg->report);
     }
 }
-- 
2.11.0


