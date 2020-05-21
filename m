Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AE1DCF98
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 16:23:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbm5X-0006MD-Vu; Thu, 21 May 2020 14:22:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQnW=7D=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jbm5W-0006M8-St
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 14:22:22 +0000
X-Inumbo-ID: 7c053ab2-9b6e-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c053ab2-9b6e-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 14:22:22 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 43Tj/gR47oKP9Ex2PPBWEahlOGo6x/IxY+jx4kPMsU9YzGoiIELkT+92xNL9+4fdswIs353hDQ
 qv7qm02BmarxzkJ5rHUOUgPgf5WtQ21ml0ujeIEIFWivlfOgRjw2EtGNF7Otu8OYJf4XoRNi3i
 1MxBe3FzCO2FpUF3i6bMs4j6HIVwIrsWuuGQJDPCEDJdZ/9+F9cbcLbE/ddyOsyq8YHMveEfyA
 vGj1LhvZR2NIZrNaLy1hGS5rnj7zTjOcnefl1eYiI0qavC5BZZciV1c7Q4gQxaLBgWliLsMsPA
 /Dk=
X-SBRS: 2.7
X-MesageID: 18354433
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18354433"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] CHANGELOG: Add an entry for golang binding updates
Date: Thu, 21 May 2020 15:21:38 +0100
Message-ID: <20200521142138.3528654-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wasn't sure whether this sort of thing was what was wanted, but
thought it was worth trying.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Paul Durrant <paul@xen.org>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ccb5055c87..5aa6af612f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    fixes.
  - Hypervisor framework to ease porting Xen to run on hypervisors.
  - Initial support to run on Hyper-V.
+ - Golang bindings: IDL generation of structs, more functions covered,
+  more module-friendly (still Experimental)
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.25.1


