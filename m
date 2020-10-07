Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25650286713
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3731.11202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAs-0005LC-Gf; Wed, 07 Oct 2020 18:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3731.11202; Wed, 07 Oct 2020 18:28:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAr-0005Gx-So; Wed, 07 Oct 2020 18:28:25 +0000
Received: by outflank-mailman (input) for mailman id 3731;
 Wed, 07 Oct 2020 18:28:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5p-00072Q-P4
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:13 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c4e2ceb-4d26-473f-b4de-23e72f53f8e1;
 Wed, 07 Oct 2020 18:21:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk2-0007CF-QW; Wed, 07 Oct 2020 19:00:42 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5p-00072Q-P4
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:13 +0000
X-Inumbo-ID: 6c4e2ceb-4d26-473f-b4de-23e72f53f8e1
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6c4e2ceb-4d26-473f-b4de-23e72f53f8e1;
	Wed, 07 Oct 2020 18:21:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk2-0007CF-QW; Wed, 07 Oct 2020 19:00:42 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 37/82] ts-hosts-allocate-Executive: Better message for hosts abandoned mid-test
Date: Wed,  7 Oct 2020 18:59:39 +0100
Message-Id: <20201007180024.7932-38-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 6fcfd2e3..58e9f891 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -1062,7 +1062,7 @@ sub actual_allocation ($) {
 	    }
 	    # someone was preparing it but they aren't any more
 	    push @allocwarnings,
-		"previous preparation apparently abandoned";
+		"previous use apparently abandoned ($shared->{state})";
 	    $allocatable= 1;
         }
     }
-- 
2.20.1


