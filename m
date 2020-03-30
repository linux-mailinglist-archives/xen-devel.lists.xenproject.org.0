Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25754197DC7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 16:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuvN-0002Y3-Cw; Mon, 30 Mar 2020 13:57:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UV6F=5P=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jIuvM-0002Xv-Fu
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:57:56 +0000
X-Inumbo-ID: 6f2fa45c-728e-11ea-9e09-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f2fa45c-728e-11ea-9e09-bc764e2007e4;
 Mon, 30 Mar 2020 13:57:46 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jIuvC-0007Qg-3T; Mon, 30 Mar 2020 14:57:46 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 14:57:35 +0100
Message-Id: <20200330135735.31512-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
References: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [PATCH 3/3] docs/README: Fix a broken url
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 ian.jackson@eu.citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There was a / missing here.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 555f3415fa..d0c87a78f0 100644
--- a/README
+++ b/README
@@ -20,7 +20,7 @@ GPL. Since its initial public release, Xen has grown a large
 development community, spearheaded by xen.org (https://www.xen.org).
 
 This file contains some quick-start instructions to install Xen on
-your system. For more information see https:/www.xen.org/ and
+your system. For more information see https://www.xen.org/ and
 https://wiki.xen.org/
 
 Quick-Start Guide
-- 
2.11.0


