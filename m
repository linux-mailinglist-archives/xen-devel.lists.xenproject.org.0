Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC276D7CCA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 14:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518504.805131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2Oy-0001Jz-MB; Wed, 05 Apr 2023 12:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518504.805131; Wed, 05 Apr 2023 12:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2Oy-0001Gx-JK; Wed, 05 Apr 2023 12:38:12 +0000
Received: by outflank-mailman (input) for mailman id 518504;
 Wed, 05 Apr 2023 12:38:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pk2Ox-0001Go-Fu
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 12:38:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b72a6f23-d3ae-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 14:38:08 +0200 (CEST)
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
X-Inumbo-ID: b72a6f23-d3ae-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680698288;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y9fFf4bToVg4q4ZBqyMdCtjoZ6FaJ5VIqXWpwJzTqIM=;
  b=fkghSAuGhX7z90Qt0sbRyLFXhQTnIxYLT5U35M7Ke+g1H0TH8IDjaCJG
   U6cjhjQrAq3RjuWIus3YnbRPeJEAXxUSKNZVLUeHlvzS2tlxoHZqcKZiJ
   cqXVnl07P2OGt/8Yq8UPuQoo1X2h4rnEULH/B2OneOdBtB32aoper+fOS
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104823534
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rgPFbqsYCg4oqqGDQev7+E4sDufnVCleMUV32f8akzHdYApBsoF/q
 tZmKWHSb66OamTyet12aYnl/EkFvMDQyNI1QQRori42EyMR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGyiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFWkvdjCeosiP5LOfTPBTr50zdu6yM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqarz6iX0pGXDCZ4Tu0yErvt/PhpxLUAZsWCISiteNrpkLGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTZcwcHDvaQZtzbOatB6L4fsnofSQD6ll
 lhmsxMCa6UvYd8jjvvrpQ6W22Py+fAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i4S4++DKGPPosWCnSUSONg1Hg3DXN8Iki3yBR8+U3BE
 czznTmQ4YYyVv08kWveqxY12r433CEurV7uqWTA503/i9K2PSfFIYrpxXPSNojVGovY+lSKm
 zueXuPWoyhivBrWOHCPrtJNcglVdhDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:0/13Ca4TRXW1EtxEkQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.98,319,1673931600"; 
   d="scan'208";a="104823534"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/guest: Fix build following libx86 changes
Date: Wed, 5 Apr 2023 13:37:55 +0100
Message-ID: <20230405123755.1427246-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I appear to have lost this hunk somewhere...

Fixes: 1b67fccf3b02 ("libx86: Update library API for cpu_policy")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/guest/xg_cpuid_x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 33d366a8eb43..bd16a87e489c 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -555,7 +555,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             const uint32_t *dfs;
 
             if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+                 !(dfs = x86_cpu_policy_lookup_deep_deps(b)) )
                 continue;
 
             for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-- 
2.30.2


