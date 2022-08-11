Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67410590511
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384797.620347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBN3-0006cZ-AT; Thu, 11 Aug 2022 16:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384797.620347; Thu, 11 Aug 2022 16:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBN3-0006We-2E; Thu, 11 Aug 2022 16:49:21 +0000
Received: by outflank-mailman (input) for mailman id 384797;
 Thu, 11 Aug 2022 16:49:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBN1-0003s9-5c
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a279d32-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:18 +0200 (CEST)
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
X-Inumbo-ID: 8a279d32-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t6+BU0EnWCm/vG2lzwqGir5k7zNv5buwu52uFlyPjUo=;
  b=WMJEVobZgCdcTj4551wJAWJe+3bkHGEJq2vIITlYHDema7NOuHHnFKoj
   EQRQYm52iI8dBuNrR2flkUX2v/q0Swp6ePiPM72SwRStyhXcM7GQ7Ock9
   KVH/R/rJkk8bnekbM/4G7rf7ZVXLCAHzF+5I0Wb3F7FblkIGwh+QcYF/Y
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77893921
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lHfRe6nKpApFlm1UP5jwDNXo5gyHJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUGyFbq6PZTbzet8gbN+y/UxS6JPWy99lHAQ+qCE3RiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2r4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kNfoIq495wHlhl+
 MMyARctfDPEv/+plefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+OeyYIuOK4bTLSlTtneG/
 XzEomHoOztEJZuyjmTc1nesrcaayEsXX6pNTeblp5aGmma7zGEJFAcfU1f9pPCjk1O/QPpWM
 UlS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebT4lz
 FiShPvyGCdi9raSTBqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8btVHAfM9bF7GMpdDKMxjX4
 yKp6xAjmOBG5SIU7JlX7Wwrkhr1+MaRFl9qv1yJNo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28za67ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMIIWPcAoJV/apnsGiausM4fFziARfVwXY
 8/HIa5A815DYUiY8NZGb7hEiuJ6rszP7WjSWYr633ya7FZqX1bMEO9tGAbfMYgEAFas+lq9H
 yB3a5TXkH2ykYTWPkHqzGLkBQxTcSRnWMum95U/myzqClMOJVzNwsT5mdsJE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:Ck9m36n4nj6tF//ad5Ynb8arHyHpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77893921"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v4 13/32] libs/libs.mk: Remove the need for $(PKG_CONFIG_INST)
Date: Thu, 11 Aug 2022 17:48:26 +0100
Message-ID: <20220811164845.38083-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We can simply use $(PKG_CONFIG) to set the parameters, and add it to
$(TARGETS) as necessary.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libs/libs.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index e02f91f95e..7aee449370 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -37,10 +37,10 @@ PKG_CONFIG_LIB := $(LIB_FILE_NAME)
 PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
-PKG_CONFIG_INST := $(PKG_CONFIG)
-$(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
-$(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
-$(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR = $(libdir)
+TARGETS += $(PKG_CONFIG)
+$(PKG_CONFIG): PKG_CONFIG_PREFIX = $(prefix)
+$(PKG_CONFIG): PKG_CONFIG_INCDIR = $(includedir)
+$(PKG_CONFIG): PKG_CONFIG_LIBDIR = $(libdir)
 endif
 
 PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
@@ -55,7 +55,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: headers.chk $(TARGETS) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: headers.chk $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 headers.chk:
@@ -127,7 +127,6 @@ clean::
 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
-	rm -f $(PKG_CONFIG)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


