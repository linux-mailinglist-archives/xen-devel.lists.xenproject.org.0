Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD956BE16
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363581.594198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiG-0005O2-E2; Fri, 08 Jul 2022 16:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363581.594198; Fri, 08 Jul 2022 16:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiG-0005M1-9M; Fri, 08 Jul 2022 16:20:16 +0000
Received: by outflank-mailman (input) for mailman id 363581;
 Fri, 08 Jul 2022 16:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i666=XN=citrix.com=prvs=181ea21da=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o9qiE-00054g-GD
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:20:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7366dd3-fed9-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 18:20:13 +0200 (CEST)
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
X-Inumbo-ID: d7366dd3-fed9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657297213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G0pHe7Zlw0C/WopgFCHRK8VLGhJr1p2bjgFoVEoa40=;
  b=SSDrmT+vqsBKIRlCrzsNRMS4FBRyni5YVHA5l5aDttgcXdTEnI85jPrY
   mol1XNGvHrsJ5hD8TRFWOr1cQPy6zSm85ne4R1lExpYy2aJL/O/w+jXnn
   H2hyy+/P62UabJAe0qoAGJdDvT6vfTkPvmugxYKQyLg1UN2Kkuleng6cz
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74700440
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WHrFha09UyLL48Fr2PbD5bZxkn2cJEfYwER7XKvMYLTBsI5bpz0Om
 GsaXmrUPfnYNjHyKI1zbYS28E8H7Z/Rm4BmG1dqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tEw0YDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1NsraIFCB5HZeTkd0aXTNDKCRdA4JZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNamCO
 JJBNWY3BPjGS00QHgY0V7w7pfqTpSntSwx3hQLJoYNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4E+oQ0FyqmonuvA+gAWYuVQVES+IJq5pjLdA17
 WNlj+8FFBQ27uDKEyvBqefIxd+hEXNLdDFfPEfoWSNAuoC++99r03ojW/45SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDSsjPeZJn6TytTDmAQ9ode51tGWps
 nkegNS55+sTF5yLnyHlaLxTQe7zvqbaYGeC2w4H83wdG9KFoi/LkWd4uWgWGauUGpxcJW+Bj
 LH742u9G6O/zFP1NPQqMupd+uwhzLT6FMSNa804muFmO8ArHCfepXkGTRfJgwjFzRh9+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iuRwmEjTBAr7GPjG8vhQ+eDEOiHJFelVYAvmgyJQxPrsnTg5O
 u13b6OioyizmsWkCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:Olm7BK/T0npAyZW6p6tuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.92,256,1650945600"; 
   d="scan'208";a="74700440"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/spec-ctrl: Honour spec-ctrl=0 for unpriv-mmio sub-option
Date: Fri, 8 Jul 2022 17:19:32 +0100
Message-ID: <20220708161934.10095-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220708161934.10095-1-andrew.cooper3@citrix.com>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This was an oversight from when unpriv-mmio was introduced.

Fixes: 8c24b70fedcb ("x86/spec-ctrl: Add spec-ctrl=unpriv-mmio")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 7a4550db8318..ba64a09048be 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -122,6 +122,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_l1d_flush = 0;
             opt_branch_harden = false;
             opt_srb_lock = 0;
+            opt_unpriv_mmio = false;
         }
         else if ( val > 0 )
             rc = -EINVAL;
-- 
2.11.0


