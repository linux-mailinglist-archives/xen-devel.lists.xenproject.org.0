Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366C2D9F21
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52388.91629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshH-0001uy-Vt; Mon, 14 Dec 2020 18:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52388.91629; Mon, 14 Dec 2020 18:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshH-0001sh-Dl; Mon, 14 Dec 2020 18:35:47 +0000
Received: by outflank-mailman (input) for mailman id 52388;
 Mon, 14 Dec 2020 16:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqU-0006vN-JD
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:10 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de156a27-9ec4-4675-91d3-84c974aff5bf;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaWYu006863;
 Mon, 14 Dec 2020 17:36:32 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaWeD021269;
 Mon, 14 Dec 2020 17:36:32 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id B9906AAC67; Mon, 14 Dec 2020 17:36:32 +0100 (MET)
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
X-Inumbo-ID: de156a27-9ec4-4675-91d3-84c974aff5bf
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 02/24] NetBSD doens't need xenbackendd with xl toolstack
Date: Mon, 14 Dec 2020 17:36:01 +0100
Message-Id: <20201214163623.2127-3-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/Makefile b/tools/Makefile
index ed71474421..757a560be0 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -18,7 +18,6 @@ SUBDIRS-$(CONFIG_X86) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
 SUBDIRS-y += xentop
-SUBDIRS-$(CONFIG_NetBSD) += xenbackendd
 SUBDIRS-y += libfsimage
 SUBDIRS-$(CONFIG_Linux) += vchan
 
-- 
2.28.0


