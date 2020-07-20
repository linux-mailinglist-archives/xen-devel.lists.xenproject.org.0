Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5E226D3D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 19:37:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZiX-0007ZA-2v; Mon, 20 Jul 2020 17:36:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxZiW-0007Z5-97
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:36:44 +0000
X-Inumbo-ID: 93c6e14e-caaf-11ea-84ac-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c6e14e-caaf-11ea-84ac-bc764e2007e4;
 Mon, 20 Jul 2020 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTT211vu9tMK586W15vIDXiAhMSFIMbKUszxNIgH8mo=; b=p+qpisSlQLSIjGsF/xirQ/iTdk
 b6gnMD+m4WvNXvR9H27RH/FNZEdF2DnsTh+D19GiZZQ93Eevh4CPrM8VQWlXqAZ/dZgZGeA1YBIOa
 Ex6Ssmf5gEkOcG97iRAAOaUdwqUSztjyQwPpKopHErG6g8PdvUEBFJVSi0GfAWg7eWYM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxZiV-0003zT-4o; Mon, 20 Jul 2020 17:36:43 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxZiU-000568-OL; Mon, 20 Jul 2020 17:36:43 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] SUPPORT.md: Spell correctly Experimental
Date: Mon, 20 Jul 2020 18:36:35 +0100
Message-Id: <20200720173635.1571-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 SUPPORT.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index b81d36eea541..1479055c450d 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -249,13 +249,13 @@ to boot with memory < maxmem.
 
 Allow sharing of identical pages between guests
 
-    Status, x86 HVM: Expermental
+    Status, x86 HVM: Experimental
 
 ### Memory Paging
 
 Allow pages belonging to guests to be paged to disk
 
-    Status, x86 HVM: Experimenal
+    Status, x86 HVM: Experimental
 
 ### Alternative p2m
 
-- 
2.17.1


