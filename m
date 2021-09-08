Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1EB403C62
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182225.329704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzL5-0003MJ-LJ; Wed, 08 Sep 2021 15:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182225.329704; Wed, 08 Sep 2021 15:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzL5-0003KH-Ga; Wed, 08 Sep 2021 15:18:15 +0000
Received: by outflank-mailman (input) for mailman id 182225;
 Wed, 08 Sep 2021 15:18:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNzL4-0003KB-0v
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:18:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb8a7c60-10b7-11ec-b166-12813bfff9fa;
 Wed, 08 Sep 2021 15:18:13 +0000 (UTC)
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
X-Inumbo-ID: fb8a7c60-10b7-11ec-b166-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631114293;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vgbADa/BeAfDLA5gMI6dcJmJzTZlZecMN4BBfA2o+do=;
  b=HyZw9NFBdPvPM0/VSxa7UVFPERa4Q0F1taC1/E1YXE8j4m1KJcqzyfbs
   WeYM+26Sb2+BU8nZxObb8RwTtqdtYGSVG0NVO9tQo/49C1+B0OALK3YFp
   UDHKRY7v3fwjWizu5Qg9epflxPgu3qv1N4pJahIwBc2D+o5pgycgq55p5
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ownEoTcax3yoAnjo4Fg+7GcwxJRSwkBrSCKNQS14/hryjFi9waoALThHEU97k4SAemyRvltmDr
 UrQB+4iRhj8RS9C6XN1GY7nrleoYc6hesBCMpi2KQ0G+10qWmZHYOO/02XRP1tnNiBGGgMxcrb
 6i0L1uli1UprUyiw9Yk7wfnoHkhyy9r+8rgFjhjOpuq1yROk/BmQ9FmXIaSBT0UuzYrpLj9aaT
 nxA0XApjpC0vx+umPjefposb5zDSUdgbiCDBYMqaa37cGMIqbUCXZz3GkjJjmVrQD7guI9RLKu
 e49VuMhW3tovnAB0OJQRhinZ
X-SBRS: 5.1
X-MesageID: 52268475
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0xa1Makx2GgY7NzTBpYDLHeniR3pDfK33DAbv31ZSRFFG/Fw9v
 rEoB1173HJYVoqN03I+urrBEDoexq1yXcf2+Qs1NmZMDUOw1HIEKhSqbH6xiHmGWnX7/c179
 YDT4FOTOfoCER8j4LQ/Am8Hr8bsb+62ZHtv/7a03BuCSZjb60I1WdEIzfeKFRyWA5FQbwmE5
 aGj/A3xAaISDAsd8GmAXtAZcjvzue78a7OUFo9Hhs67wvLtz+y97LgNBCd0n4lIldy6IZny3
 HBjwv6opquqOu6zBi07R6106hr
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="52268475"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH for-4.13] x86/PVH: Fix build following XSA-378 bugfix
Date: Wed, 8 Sep 2021 16:17:54 +0100
Message-ID: <20210908151754.9593-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes: 8d8b4bde3e1c ("x86/PVH: de-duplicate mappings for first Mb of Dom0 memory")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/dom0_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 62958bf82cbe..c6eb86bfb7ee 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -467,7 +467,7 @@ static int __init pvh_populate_p2m(struct domain *d)
         p2m_type_t p2mt;
 
         if ( mfn_eq(get_gfn_query(d, i, &p2mt), INVALID_MFN) )
-            rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K,
+            rc = set_mmio_p2m_entry(d, i, _mfn(i), PAGE_ORDER_4K,
                                     p2m_get_hostp2m(d)->default_access);
         else
             ASSERT(p2mt == p2m_ram_rw);
-- 
2.11.0


