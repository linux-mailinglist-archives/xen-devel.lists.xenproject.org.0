Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E452534D4A8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103141.196855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuYM-0007IO-Ho; Mon, 29 Mar 2021 16:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103141.196855; Mon, 29 Mar 2021 16:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuYM-0007Hf-DH; Mon, 29 Mar 2021 16:15:46 +0000
Received: by outflank-mailman (input) for mailman id 103141;
 Mon, 29 Mar 2021 16:15:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuYK-0006uY-JU
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f153767d-3410-4497-95d6-e0bfc44d0914;
 Mon, 29 Mar 2021 16:15:42 +0000 (UTC)
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
X-Inumbo-ID: f153767d-3410-4497-95d6-e0bfc44d0914
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+84Kakahzof4rIC4av0/vbXyWMh2pRvsKxC2oPYPtNk=;
  b=AS23B2+FXem/cjJkXFYx50oiX/C/dC/W4PNVmc5xWqODoieQo64YaEqS
   6vQ+BEJz/NB8IAhbI83GITfliwJGtmysSGDbj3PqehcEjFfBo828u7kJD
   pj59DiVwqLlPcToCgfxf1fzT0y3lRZq2Bs8IPyIR44Wy/mIVa/X/yTYJG
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FnDIGPTOVfsSgZeVSP+7ly89GXbTHF8tWkB+xBfZvFsFQ0GhM0kWm++k3CP67YQnogK4IjUIPx
 qCOQslRkzrHu5TbSAw/M7cqcfnkjllswAdMQCLyutL4lrq7na5DHkgF4S2DsjpPrOvOgpm3b39
 O/f/zor4GmnkSQL6x4z6q3oA8I+oUTMk5tJzOK/7RqL/dQtqSjrrLDQg3RUA+PyJuXTMcv8s09
 YoY+91QXFOZh2eJ32iYqli9c9Mle306hBQeATRDf6pFPxqPLwC6dP4jjpd13dTK8bAY+CnLVIS
 /hQ=
X-SBRS: 5.1
X-MesageID: 40725689
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1jB+9KtkNzZ3F8YFNE3ek7hb7skD8dV00zAX/kB9WHVpW+az/v
 rOoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SJTXOkm2uMY1k8M/e0yTtcheOjdJ1+K
 98f8FFeb7NJHdgi8KS2maFOvYmhOKK6aW5wdrZpk0dKT1CT4FFw0NHBh2AEktwLTM2Y6YRMJ
 aH/MJIq36BVB0sH6aGL0IIVeTCuNHH/aiOCXVtanIawTKDgj+y5LnxHwLw5GZ4bxp1zao/6m
 +AqgTl58yYwomG4yXB3Gze5Yk+orvc4+ZEbfbjtuElbhHligOlf+1aKti/gAw=
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="40725689"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 for-4.15 6/7] CHANGELOG.md: Add entries for CI loop
Date: Mon, 29 Mar 2021 17:14:56 +0100
Message-ID: <20210329161457.345360-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329161457.345360-1-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
 - Add dom0 / domU testing for ARM on alpine Linux as well

CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 62174c8c74..c4696e41a1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Library improvements from NetBSD ports upstreamed
  - x86_emulate: Support AVX-VNNI instructions
  - x86_emulate: Expanded testing for several instruction classes
+ - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
+ - CI loop: Add qemu-based dom0 / domU test for ARM
+ - CI loop: Add dom0less aarch64 smoke test
 
 ## Removed / support downgraded
 
-- 
2.30.2


