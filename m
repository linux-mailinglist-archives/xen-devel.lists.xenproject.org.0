Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3316659050B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384792.620326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMw-0005aX-CC; Thu, 11 Aug 2022 16:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384792.620326; Thu, 11 Aug 2022 16:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMw-0005Ws-6F; Thu, 11 Aug 2022 16:49:14 +0000
Received: by outflank-mailman (input) for mailman id 384792;
 Thu, 11 Aug 2022 16:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMu-0003s9-8S
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85426978-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:11 +0200 (CEST)
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
X-Inumbo-ID: 85426978-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mxTVCPUj7pxiYMIM697LcuDAzSCMllkoIRIujuNp3so=;
  b=EpGIt1LDO8mVGxactmy9AOUGZy+3rDDBvQUFFcOfLZVi7xoXU0vQR34C
   izd7IKXgX9zoL7u3ap/gUwaYfhTCDKrk/FpaEJqrjGM+n/IeFp2ZKtANl
   RlcxP42pFNyTtsIePKAO5jIy53Nm+uVQHwmRFCr0zmXA/gCfLKkB2F5iX
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77893905
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3dNdqarAoVGKQxsgKi97r107YLpeBmIjZRIvgKrLsJaIsI4StFCzt
 garIBmOMviMM2WmKIx2aojnpBtSvZTSyoRjHQY5/ilgH3xGopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUn+MR5MUcR7
 sYkMTIiSxzf3tmq/LekH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWKKo3RFJ0I9qqej
 l3s+Wa6Oh87COGglgKO+WOln9bhhwquDer+E5Xnr6U30TV/3Fc7CgASVFa9iem0jAi5Qd03A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c8VUO/037keK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9vsuoYolTrUU81uVqWyi7XdEzzq3
 yqDqiR4grwJlNMKzI2y51WBiDWpzqUlVSZsuF+RBDj8qFokOsj1PORE9GQ3895/LqSXfn/ep
 0I4gsqxyexSVKqRqCmSFbBl8K6S2xqVDNHNqQcxQcF5pmv0oiDLkZN4u28nehowWioQUXqwO
 RKI51sMjHNGFCHyBZKbdb5dHCjDIULIMd3+Hs7ZYdNVCnSaXF/WpXo+DaJ8Mo2EraTNrU3cE
 c3CGSpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDLEe9aaALfPr1jtstoRTk5F
 P4BX/ZmNj0FCLGuCsUp2dd7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8LsLUcaU9U8x8x9y7aXl
 kxRr2cClzITc1WbdljRAp2iAZuzNatCQYUTYXVwYQr1gCh/OO5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5/o7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:xyfUKqjEGoK27h0u45GvSX60z3BQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77893905"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 09/32] .gitignore: Cleanup ignores of tools/libs/*/{headers.chk,*.pc}
Date: Thu, 11 Aug 2022 17:48:22 +0100
Message-ID: <20220811164845.38083-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---

Notes:
    v2:
    - move new .gitignore entries to the one in tools/libs/

 .gitignore            | 26 --------------------------
 tools/libs/.gitignore |  2 ++
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/.gitignore b/.gitignore
index ff1d668489..e3fe06cd13 100644
--- a/.gitignore
+++ b/.gitignore
@@ -106,26 +106,8 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/toolcore/headers.chk
-tools/libs/toolcore/xentoolcore.pc
-tools/libs/toollog/headers.chk
-tools/libs/toollog/xentoollog.pc
-tools/libs/evtchn/headers.chk
-tools/libs/evtchn/xenevtchn.pc
-tools/libs/gnttab/headers.chk
-tools/libs/gnttab/xengnttab.pc
-tools/libs/hypfs/headers.chk
-tools/libs/hypfs/xenhypfs.pc
-tools/libs/call/headers.chk
-tools/libs/call/xencall.pc
 tools/libs/ctrl/libxenctrl.map
-tools/libs/ctrl/xencontrol.pc
-tools/libs/foreignmemory/headers.chk
-tools/libs/foreignmemory/xenforeignmemory.pc
-tools/libs/devicemodel/headers.chk
-tools/libs/devicemodel/xendevicemodel.pc
 tools/libs/guest/libxenguest.map
-tools/libs/guest/xenguest.pc
 tools/libs/guest/xc_bitops.h
 tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
@@ -145,21 +127,13 @@ tools/libs/light/testidl.c
 tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
-tools/libs/light/xenlight.pc
-tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
-tools/libs/stat/xenstat.pc
-tools/libs/store/headers.chk
 tools/libs/store/list.h
 tools/libs/store/utils.h
-tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
-tools/libs/util/*.pc
 tools/libs/util/libxlu_cfg_y.output
 tools/libs/util/libxenutil.map
-tools/libs/vchan/headers.chk
 tools/libs/vchan/libxenvchan.map
-tools/libs/vchan/xenvchan.pc
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
diff --git a/tools/libs/.gitignore b/tools/libs/.gitignore
index 4a13126144..1ad7c7f0cb 100644
--- a/tools/libs/.gitignore
+++ b/tools/libs/.gitignore
@@ -1 +1,3 @@
+*/*.pc
+*/headers.chk
 */headers.lst
-- 
Anthony PERARD


