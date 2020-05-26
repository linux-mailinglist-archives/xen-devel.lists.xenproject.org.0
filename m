Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C81E1F23
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 11:51:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdWEP-0006SZ-G2; Tue, 26 May 2020 09:50:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3e+z=7I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jdWEO-0006Rf-3m
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 09:50:44 +0000
X-Inumbo-ID: 5cad35d7-9f36-11ea-a5f8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cad35d7-9f36-11ea-a5f8-12813bfff9fa;
 Tue, 26 May 2020 09:50:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20043AD12;
 Tue, 26 May 2020 09:50:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] SUPPORT.md: add hypervisor file system
Date: Tue, 26 May 2020 11:50:38 +0200
Message-Id: <20200526095038.27378-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526095038.27378-1-jgross@suse.com>
References: <20200526095038.27378-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index e3a366fd56..a1f7eb6434 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -109,6 +109,20 @@ ARM only has one guest type at the moment
 
     Status: Supported
 
+## Hypervisor file system
+
+### Build info
+
+    Status: Supported
+
+### Hypervisor config
+
+    Status: Supported
+
+### Runtime parameters
+
+    Status: Supported
+
 ## Toolstack
 
 ### xl
-- 
2.26.2


