Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CED508C9F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309473.525755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhChr-0006mF-3d; Wed, 20 Apr 2022 15:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309473.525755; Wed, 20 Apr 2022 15:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhChq-0006jD-W1; Wed, 20 Apr 2022 15:57:26 +0000
Received: by outflank-mailman (input) for mailman id 309473;
 Wed, 20 Apr 2022 15:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhCho-0006j7-RB
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:57:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f8fb64a-c0c2-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 17:57:23 +0200 (CEST)
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
X-Inumbo-ID: 8f8fb64a-c0c2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650470243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1s+jDJLjZkp14miwMVaWlVz5f1j3mQtfwGaoBi6XF1c=;
  b=KfCy87xATwLUImt0jrfYZfdWCcFit/NE9tGPK+vrHaK7gAyoGPyFGOVT
   peYG9K5IUyc3dkDvWZ3zC3rmQyTVNrEH7Mt7ZqkJG3w+Y73ZvlUDHoS7v
   E0bpQoPaKb12y90KV8wYjgtRL5GtQHbAtqV3fqScOo38O4vkKthVLb8eu
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68925659
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q96m3qMk6iJcOwzvrR1El8FynXyQoLVcMsEvi/4bfWQNrUpz3z0Fy
 2ZLCjuOb/fZYmfyeYwibI3npkNQ75LRm4dgSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NYw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 txOtLyWdxcVAIrKmsEWcjBVTTBBBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTaeEO
 pREOFKDajzpTDJOY3Q+VakxkcO0g0jvQgF3uEya8P9fD2/7k1UqjemF3MDuUt6FX8JOhW6Du
 3nLuW/+B3kyFvaS1D6E+XKEnfLUkGXwX4d6PLe17OJwiVufgGkaEgQLVECTqOO8zEW5Xrp3F
 UsQ/SY/qLkow2aiRNL9Qh6QrWaNu1gXXN84O/Yh9AiHx67Q4gCYLmsJVDhMbJohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsTxYB4tTliJE+iFTIVNkLOLGxps34H3f32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzl/eXWOFyD1pWLCCYY6N4nny4KhRE7/MGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgkzPSZ8PEi3ySDAdJ3T3
 r/BL66R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+pdbAPUMr9mtvPYyOkwz
 zq5H5Lbo/m4eLegChQ7DKZJdQxaRZTFLcyeRzNrmh6rfVM9RTBJ5w75yrI9YY1195m5Zc+Tl
 kxRrnRwkQKl7VWecF3iQik6NNvHAMckxVpmbHNEALpd8yV6CWpZxPxHJ8VfkHhO3LEL8MOYu
 NFcIpvbU6UTEGmfk9nfBLGkxLFfmN2QrVrmF0KYjPIXJfaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:BPNj3633t4d7XBeY8SRo5AqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.90,276,1643691600"; 
   d="scan'208";a="68925659"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH RFC] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Date: Wed, 20 Apr 2022 16:56:57 +0100
Message-ID: <20220420155657.32506-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When CONFIG_GDBSX is compiled out, iommu_do_domctl() falls over a NULL
pointer.  It isn't really correct for processing of XEN_DOMCTL_gdbsx_* to fall
into the default case when compiled out.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

RFC, because this has implications across the codebase.  The tl;dr is that
case FOO:'s shouldn't be compiled out; we still know what the subops are, even
when the functionality is compiled out.

There are several ways to express this.  Alternatives would be:

    case XEN_DOMCTL_gdbsx_guestmemio:
        if ( !IS_ENABLED(CONFIG_GDBSX) )
        {
            rc = -EOPNOTSUPP;
            break;
        }
        ...;

but given my debugger series creating gdbsx.c, I was also considering:

    case XEN_DOMCTL_gdbsx_guestmemio:
    case XEN_DOMCTL_gdbsx_pausevcpu:
    case XEN_DOMCTL_gdbsx_unpausevcpu:
    case XEN_DOMCTL_gdbsx_domstatus:
        rc = gdbsx_do_domctl(d, iop);
        break;

when I can rework the callers of domain_pause_for_debugger() slightly, at
which point we can conditionally compile the gdbsx variables out struct
domain/vcpu, which wouldn't be compatible with the first suggestion.

Thoughts?
---
 xen/arch/x86/domctl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index a6aae500a30b..1faa5a49ff3c 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -890,7 +890,14 @@ long arch_do_domctl(
         copyback = true;
         break;
     }
-#endif
+#else /* CONFIG_GDBSX */
+    case XEN_DOMCTL_gdbsx_guestmemio:
+    case XEN_DOMCTL_gdbsx_pausevcpu:
+    case XEN_DOMCTL_gdbsx_unpausevcpu:
+    case XEN_DOMCTL_gdbsx_domstatus:
+        rc = -EOPNOTSUPP;
+        break;
+#endif /* CONFIG_GDBSX */
 
     case XEN_DOMCTL_setvcpuextstate:
     case XEN_DOMCTL_getvcpuextstate:
-- 
2.11.0


