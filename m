Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469472336EB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 18:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1BVk-0000u6-DB; Thu, 30 Jul 2020 16:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4any=BJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1k1BVi-0000u1-JU
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 16:34:27 +0000
X-Inumbo-ID: 869703fc-d282-11ea-8da6-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 869703fc-d282-11ea-8da6-bc764e2007e4;
 Thu, 30 Jul 2020 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596126863;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=cC1QXm1cXnUHioSQpBbWkyJanME2wgjyBOyCYaXYrrE=;
 b=Ts6qJ0rIqlis8OHITYUM3lhep0UJjrHXmFbn7VKtE7YETcwogZzm/V33k1rgvy46fQ
 1HSV7WeJXMqyM+DCGcDia36zuDtCqtV47UJIdQ5LWDQWJSHjeH0XlVuKgcXrlhRdwsF8
 YFVwM7CPMUn7QxT2EWlcBLZ1YeBQEXKmq19sqmLmhn7ZWrKAc2KPZOwhdDHnIVqmFdW7
 RiygJkRP5Sbh4WdLcMBPUA+jPFaCEHLQmQxGwAe1bzDR+l06u4w0RdXdGIH3pcPM1GBR
 uzyaLeNQq15y9QXZmmfjBqJ1ECNcm4YtyDDAHnoTl6mHIn18nWyR8YlNLac3imILZtC4
 w61A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS1QE="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id m032cfw6UGYCDBv
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 30 Jul 2020 18:34:12 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] tools/xen-cpuid: show enqcmd
Date: Thu, 30 Jul 2020 18:34:06 +0200
Message-Id: <20200730163406.31020-1-olaf@aepfle.de>
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
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Translate <29> into a feature string.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

not compile nor runtime tested.

 tools/misc/xen-cpuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index ac3548dcfe..2446941a47 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -133,7 +133,7 @@ static const char *const str_7c0[32] =
     [22] = "rdpid",
     /* 24 */                   [25] = "cldemote",
     /* 26 */                   [27] = "movdiri",
-    [28] = "movdir64b",
+    [28] = "movdir64b",        [29] = "enqcmd",
     [30] = "sgx-lc",
 };
 

