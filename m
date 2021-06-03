Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E539A1D3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 15:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136440.252969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lon4y-0008Nv-4p; Thu, 03 Jun 2021 13:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136440.252969; Thu, 03 Jun 2021 13:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lon4y-0008LF-1t; Thu, 03 Jun 2021 13:08:08 +0000
Received: by outflank-mailman (input) for mailman id 136440;
 Thu, 03 Jun 2021 13:08:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+9Ry=K5=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lon4w-0008L9-G7
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 13:08:06 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c2e19d8-ab45-4635-b1a6-3c4acdb313be;
 Thu, 03 Jun 2021 13:08:05 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lon4t-000MAN-7P; Thu, 03 Jun 2021 13:08:03 +0000
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
X-Inumbo-ID: 0c2e19d8-ab45-4635-b1a6-3c4acdb313be
Date: Thu, 3 Jun 2021 14:08:03 +0100
From: Tim Deegan <tim@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] MAINTAINERS: adjust x86/mm/shadow maintainers
Message-ID: <YLjUM0Dzqn0lWA0l@deinos.phlegethon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Better reflect reality: Andrew and Jan are active maintainers
and I review patches.  Keep myself as a reviewer so I can help
with historical context &c.

Signed-off-by: Tim Deegan <tim@xen.org>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git MAINTAINERS MAINTAINERS
index d46b08a0d2..09a92534bf 100644
--- MAINTAINERS
+++ MAINTAINERS
@@ -591,7 +591,9 @@ F:	xen/arch/x86/mm/mem_sharing.c
 F:	tools/tests/mem-sharing/
 
 X86 SHADOW PAGETABLES
-M:	Tim Deegan <tim@xen.org>
+M:	Jan Beulich <jbeulich@suse.com>
+M:	Andrew Cooper <andrew.cooper3@citrix.com>
+R:	Tim Deegan <tim@xen.org>
 S:	Maintained
 F:	xen/arch/x86/mm/shadow/
 
-- 
2.26.2


