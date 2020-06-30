Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CE20F28C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 12:22:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqDOR-0005CR-S0; Tue, 30 Jun 2020 10:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ebYo=AL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jqDOP-0005CM-95
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 10:21:34 +0000
X-Inumbo-ID: 77bc6fea-babb-11ea-85ef-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.163])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77bc6fea-babb-11ea-85ef-12813bfff9fa;
 Tue, 30 Jun 2020 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593512491;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=CjGBpohQCR2QX4LL+omL6oSa12vdHDQzy8BpzpjGH4M=;
 b=QtUu50fr9+M5jpROsEmkoUabUXEy0xiLYCTCk9+qmK7LNGLmRAXk1GJZUFI2yFBUlx
 wQt1TXelbcLSja7X+SoCuHFwFO/3w0Yy65BsfIXE0YmGtM8UB6UQXb4ZbufX08BfYfuI
 L1Vlgj2V5nCULUPJsKbJ05u2BxxgyavhMKIOMSKojv7uW22zReb5EzH8R7Zd9ZMr7/h4
 kUohWVHEwGEg+rUhw3ZrghROhWmzpQHRboQwaRLduvqejhp/DWY/+Y5H9YieWbvwcuVf
 iQZc1xqPA0hYWfABlVV/JZnR35COykJ/U3bo5X/SyxxYSKeZZVSTtgbPaWII4B+qwHtL
 AsOw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP267TqQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id m032cfw5UALNLRc
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 30 Jun 2020 12:21:23 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] kconfig: fix typo in XEN_SHSTK description
Date: Tue, 30 Jun 2020 12:21:19 +0200
Message-Id: <20200630102119.16870-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rename 'vai' to 'via'.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 xen/arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 4a2ec87ff5..a636a4bb1e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -113,7 +113,7 @@ config XEN_SHSTK
 
 	  This option arranges for Xen to use CET-SS for its own protection.
 	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
-	  compatiblity can be provided vai the PV Shim mechanism.
+	  compatiblity can be provided via the PV Shim mechanism.
 
 config SHADOW_PAGING
         bool "Shadow Paging"

