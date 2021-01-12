Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842422F385D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65856.116728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOFs-0004Uu-Tm; Tue, 12 Jan 2021 18:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65856.116728; Tue, 12 Jan 2021 18:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOFs-0004U3-NK; Tue, 12 Jan 2021 18:18:56 +0000
Received: by outflank-mailman (input) for mailman id 65856;
 Tue, 12 Jan 2021 18:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCj-0003Yo-1y
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:41 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8e16dec-0d9e-4acf-8dd4-bed978bcd95e;
 Tue, 12 Jan 2021 18:14:05 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIE4oX025725;
 Tue, 12 Jan 2021 19:14:04 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDtRW027842;
 Tue, 12 Jan 2021 19:13:55 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 100FE7218; Tue, 12 Jan 2021 19:13:55 +0100 (MET)
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
X-Inumbo-ID: d8e16dec-0d9e-4acf-8dd4-bed978bcd95e
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] xenpaging.c: include errno.h
Date: Tue, 12 Jan 2021 19:12:40 +0100
Message-Id: <20210112181242.1570-20-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:14:04 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

writable definition of errno on NetBSD.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/xenpaging/xenpaging.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
index 33098046c2..6e5490315d 100644
--- a/tools/xenpaging/xenpaging.c
+++ b/tools/xenpaging/xenpaging.c
@@ -22,6 +22,7 @@
 #include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <errno.h>
 #include <stdarg.h>
 #include <time.h>
 #include <signal.h>
-- 
2.29.2


