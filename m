Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9755BA7F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 16:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356802.585083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pk8-0008Ib-8S; Mon, 27 Jun 2022 14:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356802.585083; Mon, 27 Jun 2022 14:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pk8-0008GP-5K; Mon, 27 Jun 2022 14:29:36 +0000
Received: by outflank-mailman (input) for mailman id 356802;
 Mon, 27 Jun 2022 14:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0SW=XC=citrix.com=prvs=170a910b0=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1o5pk6-0008GJ-E2
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 14:29:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e46d2e4-f625-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 16:29:32 +0200 (CEST)
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
X-Inumbo-ID: 8e46d2e4-f625-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656340172;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xaKM+ebYAqyEmZhRkNr800vQvKcTck+EiNxG1DdvZek=;
  b=h6XQbnxiKlr81peYzTH3aqab9dYo8LAm9oZQdsVuVAN+BqdQ1dS3mqEK
   BCuGWznYPLyYz5bHLyduD+LH2bjiwuNl1lWgh+/8jME63/rxxGTZObATu
   3huZGJwwmHNQxe8aaVrxZoZgIvT0//RFVUfCtzpHymFjbKO+glTEKPWyD
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74341223
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B+rK7a5iNjcBtE950fu0uAxRtAnHchMFZxGqfqrLsTDasY5as4F+v
 jcZX2vSbq6MajP0KdwkPYS2oENSv8TTzN5mGwVkqnhnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurStDicPEoPzst5HSgNHFHllOLNq2JnYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvWp7izXQAvs8XpnHR43B5MNC3Sd2jcdLdRrbT
 5VFMmY2Nk6bC/FJEkgREq9vzMb1umjUazJjoUOkgZYu7FGGmWSd15CyaYGIK7RmX/59mUKVp
 XnP+WjjNQ0LL9yUyTeD8XWEi/fGmGXwX4d6PLG/8PFugRuBxmUVBzURT1KwpfT/gUm7M/pVL
 FYV4WwptrQo81KwTcjVWAexq3qJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1U2AoxSAiKfjdFQs/BrQBnmg8C9ZQpHwMuRE9mPnAeZ8wJexFwfc4
 iBfxpDBvIjiHrnWynXTHbxl8KWBoq/cbWaC2QMH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUvIT42Nugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UytEU/o3kWvoHr9HuVPO+szZ7TqLLa0XMjz9iebODJJrYext3KSyghARs/rf/VS9H
 yd3PMqW0RRPONDDjt3s2ddLdzgidCFjbbiv8pw/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzreWl
 px8M2cFoGfCaYrvc1XSMC85M+OzB/6SbxsTZEQRALph4FB7Ca7H0UvVX8FtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:JgFGkaN7oMRkusBcTs+jsMiBIKoaSvp037Eqv3oRdfUzSL3+qy
 nOpoVj6faaskdzZJhNo7+90cq7MBfhHPxOkOss1N6ZNWGM0gbFEGgL1/qF/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="74341223"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Dongli Zhang
	<dongli.zhang@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH] xen/manage: Use orderly_reboot() to reboot
Date: Mon, 27 Jun 2022 15:28:22 +0100
Message-ID: <20220627142822.3612106-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently when the toolstack issues a reboot, it gets translated into a
call to ctrl_alt_del(). But tying reboot to ctrl-alt-del means rebooting
may fail if e.g. the user has masked the ctrl-alt-del.target under
systemd.

A previous attempt to fix this set the flag to force rebooting when
ctrl_alt_del() is called. However, this doesn't give userspace the
opportunity to block rebooting or even do any cleanup or syncing.

Instead, call orderly_reboot() which will call the "reboot" command,
giving userspace the opportunity to block it or perform the usual reboot
process while being independent of the ctrl-alt-del behaviour. It also
matches what happens in the shutdown case.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 drivers/xen/manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index 3d5a384d65f7..c16df629907e 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -205,7 +205,7 @@ static void do_poweroff(void)
 static void do_reboot(void)
 {
 	shutting_down = SHUTDOWN_POWEROFF; /* ? */
-	ctrl_alt_del();
+	orderly_reboot();
 }
 
 static struct shutdown_handler shutdown_handlers[] = {
-- 
2.31.1


