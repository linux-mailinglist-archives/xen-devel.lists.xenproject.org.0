Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B3229D95
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 18:56:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyI22-0005EX-CM; Wed, 22 Jul 2020 16:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gpyo=BB=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jyI20-0005EM-Q0
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 16:55:48 +0000
X-Inumbo-ID: 302a6353-cc3c-11ea-8684-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 302a6353-cc3c-11ea-8684-bc764e2007e4;
 Wed, 22 Jul 2020 16:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7N5eoqmd8x29AALJwHhphkKTisEuPHoh/xOtLC76bNk=; b=Sd0eE7QgxJa+9V+Ngzopu2WtWI
 HVgHlv0NtOIh0UvC65AUZ8AZE+lnDq0H+OLtBl7HliSLW8iBGmdFh2/tGIVaJRby3U8si8PxWe/Dz
 /H/sxsFJ6ScnWDiNeNhug7S58Au4A/FJilADAXJOOmUWH2O4FXwCWTzgkLqAFRRh9TgU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jyI1z-0003tc-Bw; Wed, 22 Jul 2020 16:55:47 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=CBG-R90WXYV0.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jyI1z-0000tn-3D; Wed, 22 Jul 2020 16:55:47 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
Date: Wed, 22 Jul 2020 17:55:44 +0100
Message-Id: <20200722165544.557-1-paul@xen.org>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

Obviously this has my implicit Release-acked-by and is to be committed to
the staging-4.14 branch only.
---
 SUPPORT.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index efbcb26ddf..88a182ac31 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.14-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.14
+    Initial-Release: 2020-07-24
+    Supported-Until: 2022-01-24
+    Security-Support-Until: 2023-07-24
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.14_Release_Notes">RN</a>
-- 
2.17.1


