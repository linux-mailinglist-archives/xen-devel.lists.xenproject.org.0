Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4981E7F4A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:53:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefS1-0003Wo-Ee; Fri, 29 May 2020 13:53:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VNM+=7L=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jefRz-0003WI-34
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:53:31 +0000
X-Inumbo-ID: c66c54e6-a1b3-11ea-81bc-bc764e2007e4
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c66c54e6-a1b3-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590760408;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=hFBD+qJ/gCpK9NJn5KvfJ5VJMc3vedN28pNRuhbtqjA=;
 b=Udg4+S03Wm9TCxsh5c6qpM4/J63b9BUCQYrrWn6SMNB9B86osRf1goYp7eh8UEiPZL
 KbAVbiSFcViThco6e5i8bljSIe6hSfbAis8Ma+lWxvfcf29JqQNd1wCCIikiNpa/JIkm
 Ck852Ji2+4mkNa+b8xTSDCGnzAtkeqsTpAcMyD6093ufSdyABpXTIbfqpJkmxjLJBq6H
 HaqPrL9DL94irIptLwk96z30ZjFZZc1k4xHAivAjWxvXt2osXZTkmMMfg7zt68aG72Sh
 Sb3ZZPKW276FphQ3kWUE03Xv5rx/4N2WtTWpZQN2QCZd8WNHbz3yV5AiQxV3a3a6y36W
 pAWw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpFjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.0 DYNA|AUTH)
 with ESMTPSA id k02b75w4TDrA62H
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 29 May 2020 15:53:10 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] INSTALL: remove TODO section
Date: Fri, 29 May 2020 15:53:03 +0200
Message-Id: <20200529135303.18457-1-olaf@aepfle.de>
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The default value '/' for DESTDIR is unusual, but does probably not hurt.

Fixes commit f2b40dababedcd8355bf3e85d00baf17f9827131
Fixes commit 8e986e5a61efeca92b9b268e77957d45d8316ee4

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 INSTALL | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/INSTALL b/INSTALL
index 72dc4b67dd..0d3eb89f02 100644
--- a/INSTALL
+++ b/INSTALL
@@ -365,12 +365,5 @@ make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
         DESTDIR=/some/path install
 
 
-TODO
-====
-
- - DESTDIR should be empty, not "/"
- - add make uninstall targets
- - replace private path variables as needed (SBINDIR/sbindir)
- - ...
 
 # vim: tw=72 et

