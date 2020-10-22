Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FDD29561E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 03:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10167.26911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVPda-00062f-7l; Thu, 22 Oct 2020 01:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10167.26911; Thu, 22 Oct 2020 01:43:30 +0000
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
	id 1kVPda-00062J-1h; Thu, 22 Oct 2020 01:43:30 +0000
Received: by outflank-mailman (input) for mailman id 10167;
 Thu, 22 Oct 2020 01:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kVPdY-00062E-91
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 01:43:28 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b67b9e34-3e10-4b00-89ac-b20675723f36;
 Thu, 22 Oct 2020 01:43:26 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09M1hAfT073941
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 21 Oct 2020 21:43:16 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09M1hAop073940;
 Wed, 21 Oct 2020 18:43:10 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kVPdY-00062E-91
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 01:43:28 +0000
X-Inumbo-ID: b67b9e34-3e10-4b00-89ac-b20675723f36
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b67b9e34-3e10-4b00-89ac-b20675723f36;
	Thu, 22 Oct 2020 01:43:26 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09M1hAfT073941
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 21 Oct 2020 21:43:16 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09M1hAop073940;
	Wed, 21 Oct 2020 18:43:10 -0700 (PDT)
	(envelope-from ehem)
Date: Wed, 21 Oct 2020 18:43:10 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Remove EXPERT dependancy
Message-ID: <20201022014310.GA70872@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Linux requires UEFI support to be enabled on ARM64 devices.  While many
ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
potentially taking over.  Some common devices may need ACPI table
support.

Presently I think it is worth removing the dependancy on CONFIG_EXPERT.
I am rather tempted to add defaulting enabled, but I'm not yet confident
of going that far yet.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
I hope a popular ARM device capable of running Xen will soon be running
Xen on ACPI/UEFI, but it isn't quite there yet.  As such I would like to
have "default y", but I don't think that is likely to be accepted yet.
---
 xen/arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388265..f43d9074f9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -32,7 +32,7 @@ menu "Architecture Features"
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
+	bool "ACPI (Advanced Configuration and Power Interface) Support"
 	depends on ARM_64
 	---help---
 
-- 
2.20.1



-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



