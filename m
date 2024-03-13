Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1187B54E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 00:41:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692822.1080331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkYCx-0006aR-QA; Wed, 13 Mar 2024 23:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692822.1080331; Wed, 13 Mar 2024 23:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkYCx-0006Yv-N4; Wed, 13 Mar 2024 23:40:27 +0000
Received: by outflank-mailman (input) for mailman id 692822;
 Wed, 13 Mar 2024 23:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqwV=KT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkYCx-0006Yp-3m
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 23:40:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1022d0ec-e193-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 00:40:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C27761482;
 Wed, 13 Mar 2024 23:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CF2C433F1;
 Wed, 13 Mar 2024 23:40:22 +0000 (UTC)
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
X-Inumbo-ID: 1022d0ec-e193-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710373223;
	bh=q96bMAe7S/BAlgQKBLJAjhHNlcen9mqsMrQiYkkOgag=;
	h=Date:From:To:cc:Subject:From;
	b=Cd9wDUIglPrOlKaClWetp0N75JJhRBL9KK0+MfianwesmS9Wt8901aYY+O2sgNpuH
	 XLWuUWar+GbFyq6NHF0nyDFd1xT9P1M/K+Zbs5eC5Hmv4x2TLnOpqtYYvcjZ8N/uyv
	 zOOuTQnavqLsTLzcOBnjuOCt6uVhIaWWB0xhjcM9+p1PjBwVWD7SisoXcy0TXC9bNQ
	 y0hsAe0CHl1Ms9JW5NQQ9yOSDALd37Ht+AZ0LB8VdUzT1aKRmj/ivvOEJOo4gvISLq
	 koPeGawAPmofQjly4O+pA6xzM+YoT/i5qKs6C9+09EiDH08iWKk2yKPNbGxC0036Uw
	 OYM+74DJxqUyg==
Date: Wed, 13 Mar 2024 16:40:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: [PATCH] MAINTAINERS: make Roger an IOMMU Maintainer
Message-ID: <alpine.DEB.2.22.394.2403131638530.853156@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-340617375-1710373223=:853156"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-340617375-1710373223=:853156
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Roger kindly volunteered to step up as IOMMU Maintainer.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56a6932037..ad385abd2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -359,7 +359,7 @@ F:	xen/drivers/passthrough/vtd/
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Paul Durrant <paul@xen.org>
-R:	Roger Pau Monné <roger.pau@citrix.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
 S:	Supported
 F:	xen/drivers/passthrough/
 X:	xen/drivers/passthrough/amd/
-- 
2.25.1

--8323329-340617375-1710373223=:853156--

