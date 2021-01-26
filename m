Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C4304768
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 20:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75439.135849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Tci-0004o2-LC; Tue, 26 Jan 2021 19:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75439.135849; Tue, 26 Jan 2021 19:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Tci-0004nX-FQ; Tue, 26 Jan 2021 19:03:32 +0000
Received: by outflank-mailman (input) for mailman id 75439;
 Tue, 26 Jan 2021 19:03:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4Tch-0004nA-4f
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 19:03:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3498e7d-d62f-4a2b-8001-db32feb032b8;
 Tue, 26 Jan 2021 19:03:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 844792228A;
 Tue, 26 Jan 2021 19:03:29 +0000 (UTC)
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
X-Inumbo-ID: b3498e7d-d62f-4a2b-8001-db32feb032b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611687809;
	bh=OELfP2+bx90CE63iMtCmIw1eetKsqCDD4U0PIp0tN6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLFPSqFfGEX+oiWRGnVUkE0OsNd0JQy4v5E8gQzeEddoutRn8uiJihM/4pOBfyyNy
	 KKbBpAgsV8tYt5Yu4K3yYXN3tOh8LwaHvdwoL8siViai81FHXnyJSRpifrzdFt78DK
	 y61KwYulIUaVh+UtRtHOWl1gUzUal2WRa5AHD0Ube9tF224IYorZxdAaPmsq0OML+Q
	 scvA08AQnI2hZ/u+hQrTJkIRn8KbrCrurjEKxRY09y8gih6AyR0dLBnjQ91YzEtYIB
	 5TtalElLmx7oYiDh705MEbyNCvMTUHBDvPJJuj/SE+hLCDUNv9Pgj+SC15e//MYl7V
	 /aXECGAeYym+Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 2/2] xen: add (EXPERT) to one-line description of XEN_SHSTK
Date: Tue, 26 Jan 2021 11:03:28 -0800
Message-Id: <20210126190328.2461-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101261042030.20638@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261042030.20638@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Add an "(EXPERT)" tag to the one-line description of Kconfig options
that depend on EXPERT. (Not where just the prompt depends on EXPERT.)

Today we only have one such option: XEN_SHSTK.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: george.dunlap@citrix.com
CC: iwj@xenproject.org
CC: jbeulich@suse.com
CC: julien@xen.org
CC: wl@xen.org

---
Changes in v5:
- actually, only change one-line description of options that depends on
  EXPERT (and not just the prompt)

Changes in v4:
- new patch
---
 xen/arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 302334d3e4..3f630b89e8 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -103,7 +103,7 @@ config HVM
 	  If unsure, say Y.
 
 config XEN_SHSTK
-	bool "Supervisor Shadow Stacks"
+	bool "Supervisor Shadow Stacks (EXPERT)"
 	depends on HAS_AS_CET_SS && EXPERT
 	default y
 	---help---
-- 
2.17.1


