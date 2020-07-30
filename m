Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582782337F9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1CjC-00089v-MN; Thu, 30 Jul 2020 17:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1CjB-00089g-G1
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:52:25 +0000
X-Inumbo-ID: 6cd457a2-d28d-11ea-8db0-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cd457a2-d28d-11ea-8db0-bc764e2007e4;
 Thu, 30 Jul 2020 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uz1f4JaSlPa4wvD4/wRGUINT1oVECe/gDerhHtYEvBE=; b=Sy5oj9eXYQSRViI4imhGOKOsMe
 cW0inVI1B0gMPiQDKoenLOTJpmE8qI1Qn1b9bdy3MGRZJG9HLSQynX7eLWlHBhOZJXXzfaJRRql8V
 ViqP1HhNRcTuGQ5GsUVqrTxQUHeQl1vzCqdP2QQUaRHtGIbYVzoVwW76el4kS8udv1Yo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1CjA-00079q-9f; Thu, 30 Jul 2020 17:52:24 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1CjA-0004nV-14; Thu, 30 Jul 2020 17:52:24 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/6] xen/arm: guestcopy: Re-order the includes
Date: Thu, 30 Jul 2020 18:52:06 +0100
Message-Id: <20200730175213.30679-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730175213.30679-1-julien@xen.org>
References: <20200730175213.30679-1-julien@xen.org>
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

We usually have xen/ includes first and then asm/. They are also ordered
alphabetically among themselves.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/guestcopy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 7a0f3e9d5fc6..c8023e2bca5d 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -1,7 +1,8 @@
-#include <xen/lib.h>
 #include <xen/domain_page.h>
+#include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
+
 #include <asm/current.h>
 #include <asm/guest_access.h>
 
-- 
2.17.1


