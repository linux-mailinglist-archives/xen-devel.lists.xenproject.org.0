Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B093C3753DA
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 14:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123449.232828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1led8B-0007VA-HU; Thu, 06 May 2021 12:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123449.232828; Thu, 06 May 2021 12:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1led8B-0007SF-E7; Thu, 06 May 2021 12:29:27 +0000
Received: by outflank-mailman (input) for mailman id 123449;
 Thu, 06 May 2021 12:29:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FTm=KB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1led89-0007S7-FS
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 12:29:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85273503-9f8a-4dd2-b57a-4729d0bf8c1d;
 Thu, 06 May 2021 12:29:24 +0000 (UTC)
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
X-Inumbo-ID: 85273503-9f8a-4dd2-b57a-4729d0bf8c1d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620304164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=maMG0Hgis5coGY5V76NoThNCQsncixNxvZnWa8PNJdw=;
  b=MD2l7paxKmltBg73/Lfk4CrPMkgEAPANnLWyaNaDaRQhvkPEO8P0gbAu
   jw6mn0rsYFoi0630c6yvCi0mVwNU8wg4wzJMmzuhLDD2cfaEmZvrmwnws
   XekeIu3qzI06X/JdhmiF68KgBCaH4W/pzLnSUJvgioRYiMKP6c9BR5mw3
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 23lC3dv3tj/qmPSffcLyqiz6SurvbL6V1iiNBgWW4MKWKsHSq0CDg6TRrAvOcsWLlK4o29m/Ke
 GDsOxqw0f0giscR2Po8TV9207lGjj7YUfcBduZ73ctrsG/kZX99+AO3xeOg+MWDKulqwqn7lSn
 rP82/Ev67pVIDCzcmKAv5YlSd06cV2qzCY3vEee2O1bULJx6yNWzN3R9Qa4bQo55xYmAgOeB+n
 IF1CAPPalh1aSVp7VZIR3dj8vtznPtwYtlsT6OeTF1XUCZzuiSfWfU+ZdSLr6eRqOFzsLIexcy
 BPg=
X-SBRS: 5.1
X-MesageID: 43007888
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O7CUia+1rRAioC+WOSFuk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+8jztCWE8Qr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQfREWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.82,277,1613451600"; 
   d="scan'208";a="43007888"
From: George Dunlap <george.dunlap@citrix.com>
To: <security@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported
Date: Thu, 6 May 2021 13:29:15 +0100
Message-ID: <20210506122915.65108-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The support status of 32-bit guests doesn't seem particularly useful.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---

NB this patch should be considered a proposal to the community, as a
follow-on to XSA-370.  As mentioned in the advisory, we will wait
until 25 May for comments before checking it in.
---
 SUPPORT.md | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index d0d4fc6f4f..a29680e04c 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -86,14 +86,7 @@ No hardware requirements
 
     Status, x86_64: Supported
     Status, x86_32, shim: Supported
-    Status, x86_32, without shim: Supported, with caveats
-
-Due to architectural limitations,
-32-bit PV guests must be assumed to be able to read arbitrary host memory
-using speculative execution attacks.
-Advisories will continue to be issued
-for new vulnerabilities related to un-shimmed 32-bit PV guests
-enabling denial-of-service attacks or privilege escalation attacks.
+    Status, x86_32, without shim: Supported, not security supported
 
 ### x86/HVM
 
-- 
2.30.2


