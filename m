Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72E3B9086
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 12:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148603.274608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytyL-0000Ny-5B; Thu, 01 Jul 2021 10:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148603.274608; Thu, 01 Jul 2021 10:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytyL-0000LK-1q; Thu, 01 Jul 2021 10:31:05 +0000
Received: by outflank-mailman (input) for mailman id 148603;
 Thu, 01 Jul 2021 10:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytyJ-0000LE-72
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 10:31:03 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [85.215.255.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 113a42b9-ebec-470d-bd68-3ad1e2e5905c;
 Thu, 01 Jul 2021 10:31:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61AUo5ih
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 12:30:50 +0200 (CEST)
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
X-Inumbo-ID: 113a42b9-ebec-470d-bd68-3ad1e2e5905c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625135451;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Y/umBz55iRwFQy474jplT7NWH63BSvriXmAsJ0ambaI=;
    b=QzRhUIRiFIqv4idpt40UEApO3wutsIy7YRQVAentS+hsL8Q5twDr5JWtMRU9/9NOCV
    YbPh/E88DAcxEX0dMRu1ZsAIEZ0xWVbINPtXhUw1M8Y48/zU0xWM3gdEUaFHG7LV0JOG
    Luyr//yX04nTWjvlP/WtaSbVLb9gvRcK4lvWUv2hf1ZHErHAuLpni3atR2AvcoGopnFW
    +QeUSRrdUElcbHQYv6lDqMxnk+Ekj9JxFETjFbBaDZguLgzb3QRm54QOhzwDIql62x2O
    Zeq5tI+TcCyCOcgx1bpx7DyHmdzuJ5yF740b3fSFPl3z12GbgrLpOLVw+32LjhXmntvv
    PkFw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1] tools: fix comment typo in libxl__cpuid_legacy
Date: Thu,  1 Jul 2021 12:30:48 +0200
Message-Id: <20210701103048.971-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace emualted with emulated.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/light/libxl_cpuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index eb6feaa96d..b2c673841a 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -465,7 +465,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
      * isn't going to migrate, then the current hardware is all that matters.
      *
      * Alternatively, an internal property of vTSC is that the values read are
-     * invariant.  Advertise ITSC when we know the domain will have emualted
+     * invariant.  Advertise ITSC when we know the domain will have emulated
      * TSC everywhere it goes.
      */
     itsc = (libxl_defbool_val(info->disable_migrate) ||

