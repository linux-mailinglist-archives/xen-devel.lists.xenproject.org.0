Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA23003F9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 14:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72765.131064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wKb-0003LF-GU; Fri, 22 Jan 2021 13:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72765.131064; Fri, 22 Jan 2021 13:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wKb-0003Kq-DC; Fri, 22 Jan 2021 13:18:29 +0000
Received: by outflank-mailman (input) for mailman id 72765;
 Fri, 22 Jan 2021 13:18:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2wKZ-0003Kk-TE
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 13:18:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3721f131-59e8-4f09-af63-c1966655aa99;
 Fri, 22 Jan 2021 13:18:26 +0000 (UTC)
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
X-Inumbo-ID: 3721f131-59e8-4f09-af63-c1966655aa99
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611321506;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=8YXMjl+np501RuPH23y9rRyQUTeN1nGsVfEwr6PQPaM=;
  b=WOnUF/7ayoD5Lle5Ds9CV2Tcvs7fxgYo7XvT/oVjnF4g9eNjBGXPfRXs
   KckWcygJwR14cSaPO3GQFFurMLq0sKKEA5qopRjUosSrKqvfvA3WzfX2f
   V7VpWfClVCkVXpKPxfbyybQXjL0pmX1UUET4YBpoOhhWd0XY8ZwG15ngz
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: svGS02bcBOk0+RrVl8yBNUWplan9FWX6DodK7FDiWLODyfinIHj3SJWPfKCIe3OhPGlkgvDvbv
 2Et3HWieB/Pf5ExpeBEc/eGTgniCkiinnv6idLV7ueuNMxOHgFUSw+Vu22M1lHhsPXYQgx22jT
 Mkws/TpuEsfb9Tqxq3tKLk7ZHf0Ntpr5nyF3mgN+dLjXuudrNxl3wMBgBomcBewnzsqGp8NdOW
 lgNM8EDwH5IWRQ22zHOlgwQC1RwkESWdLsHh8TzWBNxG/xxt/LcE3trySmTKWN4TcwNrEZbP+3
 Qlg=
X-SBRS: 5.1
X-MesageID: 35703148
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="35703148"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, George Dunlap <george.dunlap@eu.citrix.com>
Subject: [PATCH] golang/xenlight: Refresh generated helpers are recent libxl changes
Date: Fri, 22 Jan 2021 13:18:01 +0000
Message-ID: <20210122131801.32457-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
CC: George Dunlap <george.dunlap@eu.citrix.com>
---
 tools/golang/xenlight/helpers.gen.go | 3 +++
 tools/golang/xenlight/types.gen.go   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index c8605994e7..e0681ee14e 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -2025,6 +2025,7 @@ x.PowerMgmt = bool(xc.power_mgmt)
 x.Permissive = bool(xc.permissive)
 x.Seize = bool(xc.seize)
 x.RdmPolicy = RdmReservePolicy(xc.rdm_policy)
+x.Name = C.GoString(xc.name)
 
  return nil}
 
@@ -2044,6 +2045,8 @@ xc.power_mgmt = C.bool(x.PowerMgmt)
 xc.permissive = C.bool(x.Permissive)
 xc.seize = C.bool(x.Seize)
 xc.rdm_policy = C.libxl_rdm_reserve_policy(x.RdmPolicy)
+if x.Name != "" {
+xc.name = C.CString(x.Name)}
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b4c5df0f2c..ac78dea1af 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -210,6 +210,7 @@ ViridianEnlightenmentCrashCtl ViridianEnlightenment = 6
 ViridianEnlightenmentSynic ViridianEnlightenment = 7
 ViridianEnlightenmentStimer ViridianEnlightenment = 8
 ViridianEnlightenmentHcallIpi ViridianEnlightenment = 9
+ViridianEnlightenmentExProcessorMasks ViridianEnlightenment = 10
 )
 
 type Hdtype int
@@ -719,6 +720,7 @@ PowerMgmt bool
 Permissive bool
 Seize bool
 RdmPolicy RdmReservePolicy
+Name string
 }
 
 type DeviceRdm struct {
-- 
2.11.0


