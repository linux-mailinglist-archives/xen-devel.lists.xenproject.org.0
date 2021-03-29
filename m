Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EE34D4A6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103136.196830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuYB-00075j-PN; Mon, 29 Mar 2021 16:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103136.196830; Mon, 29 Mar 2021 16:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuYB-00074p-Kx; Mon, 29 Mar 2021 16:15:35 +0000
Received: by outflank-mailman (input) for mailman id 103136;
 Mon, 29 Mar 2021 16:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuYA-0006uY-JI
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51a755fe-00a8-403f-a597-ecb03f9a6d87;
 Mon, 29 Mar 2021 16:15:25 +0000 (UTC)
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
X-Inumbo-ID: 51a755fe-00a8-403f-a597-ecb03f9a6d87
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U5H4Sx5uIBD2IcgPM9vZXVBYk16q1MzBJS9boc0kKR4=;
  b=CeCUNFs8zjex1nCCFoSM6XaOP2Ub1EnpQw0DOO3QxtCTgqUCsvpshnup
   10vXRc/1FktaT+p+6HKldroIhSE2Rmy2ytwT/qcXzRICyLMgkg1lFxXnt
   HtYqxp7WboT8oRuas7tnDOY8TuiI3MNxiLmPk1i92EUjupL7YFNO4n4Zc
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: M1I+J4Ehm8jfBaO9mXd0MGDAAC712Gc5f5adrMvLGeDMo2BnexG+jxz18nwZ8SmLh3763/9yrW
 QAH3vFGBy7qtV7ToZSzC2kFa0wRfIFOTIC0o5xj3PrbgoJ9k+lR35u2rm8Ti7uxgEqHU9WjThG
 FOpAHIr885rKaLwdUZuvEvUhMHiveUeOcuHXEpZ2rPK71SGxItmFskXoHa8J6pawvb8o9rN9NR
 koZ+SCbdhqcPQR16LhLo5TnlanjHZEcYwfmtK/9xGPzymDmKdUp3u1oDH31+5mNzFjhY3jgLiQ
 RdM=
X-SBRS: 5.1
X-MesageID: 41809679
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PSxA363qlDyAyQkK69SmiQqjBDckLtp033Aq2lEZdDV+WKWj+f
 yGtvIdyBPylXItQ3kmg9+NI+2tRnnb+J5z7+AqTNGfdSPhv3alK5wn0Jv6z1TbalXD38NUyK
 sISchDIfLqC1wSt6rHySm+V+0t2dyWtJ2v7N2uqktFaSFPR+Ve4xxiCgCde3cGIzVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/PmNDCIuPBIp5BKDijml8tfBYnyl9ywTTi9VxvMa+X
 XF+jaJn5mLie2xyRPXygbojqh+pd2J8LR+Lf3JrsAULzn24zzYBrhcZw==
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="41809679"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
	"Ian Jackson" <ian.jackson@citrix.com>
Subject: [PATCH v2 for-4.15 2/7] CHANGELOG.md: Add named PCI devices
Date: Mon, 29 Mar 2021 17:14:52 +0100
Message-ID: <20210329161457.345360-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329161457.345360-1-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Ian Jackson <ian.jackson@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7f03e85bd7..8c89212f14 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
  - Intel Processor Trace support (Tech Preview)
+ - Named PCI devices for xl/libxl
 
 ## Removed / support downgraded
 
-- 
2.30.2


