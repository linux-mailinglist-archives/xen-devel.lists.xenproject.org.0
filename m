Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GDXLISstT2qVbgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 07:10:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416672CB34
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 07:10:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=hGHrGkCZ;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357504.1611910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whh0n-0007xm-Sj; Thu, 09 Jul 2026 05:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357504.1611910; Thu, 09 Jul 2026 05:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whh0n-0007sh-M8; Thu, 09 Jul 2026 05:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1357504;
 Thu, 09 Jul 2026 05:09:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whh0m-0007mL-6I
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 05:09:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whh0l-00AI4q-74
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:09:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4f2cff-bab6-0a2a0a5309dd-0a2a45079eaa-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:09:23 +0200
Received: from [98.137.69.84] (helo=sonic314-21.consmr.mail.gq1.yahoo.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4f2d01-9c8e-0a2a45070019-62894554a526-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:09:22 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 05:09:20 +0000
Received: by hermes--production-ne1-7568ccb994-mqdhs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID da73cafa7d25cff72b3b6899257e7b9a; 
 Thu, 09 Jul 2026 05:09:16 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783573760; bh=UmUmWH59zwDkMLLGuuGvz0xwapBoT1O8sVu7oXOskMA=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=hGHrGkCZrQZCC7XLtuCMvJIdut61Pe/EmUDh0iLkCd/+jW65mcTW6JH0XjzA6jvabpZsVqk641YUUGNH39EU5YeFPCeapQB3t4JdY1Rct3CaNTqamO+JBrgBTNPbByTSaEnjnMgMObZZOa7xm2LDa3dN9QZikCwv8Kk7ACNiMQK9E4eO+DDeIh7+bH95LQ7C2splnR5CJp0YpkJNZ83ZoGhLS/cluKUChART3xYV63nJlVkoUkwGYWbX3q0duIpLgePeqZgdU57ZFJn19PHolewmNVHjTI+QdCnib38GOXoEEnS1MCf1lVpKyrNz+p2leiMb+TUPQF/HXHMdhJI1Qw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783573760; bh=9xClvDzp3a1vB5OzI9ZBLOxM/ZtVUMYTi9D1WxSqNGH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=s2wHTm8b6Q9HGZDmxBeolGQ2/STF0XVsaH9gI2V5oPJJRKskqgwrFrjhFcyEDEpejw4+bNvJuzeQ4a6RRW3x195EwNLiDx8JwH/r/QWF7ZxXfeAo8jfK410urEhyjsBx2FAm5VOJOiX04Hb4D6qEy2P9ukoaNaDdTUuV/Je4XzLD/lLKX8Ze5uJJp/y2ImG/jpIccVU4j+cT42PrvzPerlVq6Z/bXXZJL9YukN4hpTY0SbqVWdiYelS6OxpkftqFHl9IuZOkyqCrqmiWxrbqFJtJNv1uIHXD/Gd2t48K4dgU2WE7LcweqOqRZuH8DpqH9FKj0YqX/GHowV6RX+MLiA==
X-YMail-OSG: M2AD1sEVM1n8ckvxeNh8b1S.UEC2tMUHrV5UUtXVp3HMLDkQ_7RGScJZvo1jjHS
 EfcWrN1N7dnF3zCvb0zBX5GW7.LZj5aYUaEIZyHGnV0njwihcIXuu.jyzgD7NEXSrPHAwlSKauUe
 dG8cvXDlYcAeDoIgiLLSfY6NKoUVPq9V9JsWcUOy_lZIPSGLufQm8QeOFTPE9RmKMv5j._GyKphp
 af5KHl7DqDB9FCu3Dp9Da_729wBsZ7PqfF0w65WiQ6sh6X6K9IUNUR7_cgE52M1uzABiSf7xDQqo
 Pw5ijPjRIukt.GOFWQdx_YcvTsPN_5194MdLclO3HW.XGKWXyA3A28.rw_0QjKcUOKH8omNK5GiW
 pd2mpKldi.bsotvIlXHzJ2bUvoqk9MiKvF_QpIKJgYW7aOyPlBIQkF3OkDK.h4ajiU_8Cw9.RtgW
 VFpYK6KZzIH3TQG9LM453gdE6wWL88B6S7pX5Wnwk1zxWzmGSg0gKy6wzMS9U2.bES_CPUEIvDJe
 rdAsk9aH0MgUkvXgvYP4Quqm9LRqDW2o7lnuIMIYS2sfu42Xnglr7GSPzwuODhUDgUVYlP5x4yi8
 Vc1e3wrbM9yDaZkrlx0qPgFbHSDwlk4p598CZaleRyybmMYfVQoYTvwb.fOk8PZMx0Ky0cUk8.YM
 4cSBPETMZLbNzzbuoTGRHaZ6qddca1yTh1J19z66PH4fBHTf3w7lrd5Zo.TmoUS07AKJnOpegRLE
 2zMfy3zxZn_0sRlXNl.b6V5Zdksk.D9dq9pCbw2EhHzEA4yx_yIXKvl3nrpjP8VNtJZHWOicVecG
 37g6pdMuM32l.fcpkzMqSVYWfGEMja1rP0gBOglfbKFK5w4AygzahleZQEsJxfVtLQ40B8kJtnQw
 6BqJLnkUnfKgUmNfz1W8kMxMDsJNYvI0LTZdTQQaWxhXYuyKHUaW4cFWlZiP5SDUxMnuU9NJ8es_
 WSbVUAhZtVCpOaw1V3mFgCzH2gm7aS9mkFwBCHsW3r_q0DgRNJsZNE0lODZQS1z0AtAivHH48sJI
 uwvE44Il5mV9EJ4bQXyb.9bSVH2ayQjGrpovFLJFanaWodUsWfUGSknEdJNCuTqKFeTw9IDSXSyJ
 eO98oqiQRkt1TOk1q7RVVeGxO4Z22nUCAyZmH3ZsMS46hoIuUXpLy0JJeKW4w_lSZhyFUz.xjYp3
 8k0mNsWx5Y.rQNmoFoSBhiRwkg94xNIFxXzF48agN9Ag9xMVtnlY3HnSSLqNKEPCpoEJiFPN5iFo
 AMojO0LOZit1N8FEVOsZ_HDUavMA6yWclKvBjp4pset97LUREWJXAvcsWNdD0y4BVybqWLDwuzs5
 .JromwszZQRmswsj9DWt191vbBuwXIJwym9WLSUZcPAbqutg9R5m.i2XbJbvSQEWiUYsreM_zOvc
 OaOLbsw9u0gUM_I0LJDKtJnMxTh7pmzDR0_Yvfoa1NvyzhJzTD0tL5XITV0qNizdZD03L.K7Ale7
 jL.oNyBvsWh40_U.eodZVPzLbwgXPKopfvXzAQhi_geuMWOFxMaJAJaNLhvyZaIAerKHsGHXCd1I
 rkSSuS3y7B1iKy06flwelHce0QrmujnOsN9zbLxSrboz9kbaxCCMrnhIwi7S3wqivwm.x.JPxOmV
 YWWUHxZ3k7V0T57nxVZyUDCCLRfDJmSZzN78tNvR4eRro.6H90GadGypP9jDL4w4n2_qZ9w17LJW
 Js8gKvxuZLC65uz8r.3q7fTjzc.8HaiH0FXy25ViX0v1EgS7Kcxe8vzJ63ceLS0dvBOgkaKechkl
 FzJcsIONxOpVg_PzLRMykYuCYCAsYVCTemyxGIxutTHZUrYEmTSI4c3y_iTgJuPal4B81oDqwgqa
 0Dksj.wVwUiNCQ4_lJ0mzeiObB0sm6IHIVpeI5JiWuEgZRr244fsinTP79cfAZftm0lzy3MqscEv
 jaVuTHPjX.c3jGEy5KsbPZQkkWj74g0.YrHFBEXDrY.HzSRhniqMpHpiyd_xQRq0Z3A7vt1QQe.H
 klVQGSK91OCdctFkP.athI26.gnWQWufh6Qy5GyfRXp0709_J8EZxKspyE10UL.UW.U5Aa4v1Cpc
 flIU0FlQVEU0Yut56zAl4E_WtMWG0mcmFYesn5oj9HM7_G2e27nxGw3JU4LTF.cVbAqpczSIdmm4
 1BWb7IfOOAUkQQorbZYYglwJS96nkZ._2ff3sWiB.hvxRftpxR2YpyZSDO0jzvh7hzDwX2byEShg
 5hhJ6zOmRP4t_x1s2jlkXQ8Fs5lCVL0LcAw--
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 95c2e078-b625-436e-bd84-c2e244a36491
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 3/3] xen/igd: fixup device id before registering rom
Date: Thu,  9 Jul 2026 01:09:10 -0400
Message-ID: <20260709050910.8217-4-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709050910.8217-1-brchuckz@aol.com>
References: <20260709050910.8217-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783573763-7E93A25E-0E9C0C70/0/0
X-purgate-type: clean
X-purgate-size: 3201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,gmail.com];
	DKIM_TRACE(0.00)[aol.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3416672CB34

With the current implementation, Seabios does not see the fixup of
the device id done here and consequently Seabios does not load the
VGA bios and the guest screen does not light up until the guest OS
graphics driver is loaded. So there is no VGA output from the passed
through Intel IGD from either Seabios or the guest bootloader with
the current implementation in cases when the device id needs fixing.

Fix this by waiting until after doing fixup of the device id before
registering the option ROM. With this patch, Seabios sees the fixup
done here and loads the VGA bios, and both Seabios and the guest
bootloader light up the guest screen in cases when fixup of the
device id is needed.

Also, remove unused header hw/core/loader.h

Fixes: 881213f ("xen, gfx passthrough: retrieve VGA BIOS to work")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 hw/xen/xen_pt_graphics.c |  3 +++
 hw/xen/xen_pt_load_rom.c | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 54f0d54..9e9ab55 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -222,6 +222,9 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
         }
     }
 
+    pci_register_bar(&s->dev, PCI_ROM_SLOT, 0, &s->dev.rom);
+    s->dev.has_rom = true;
+
     /* Currently we fixed this address as a primary for legacy BIOS. */
     physical_memory_write(0xc0000, bios, bios_size);
 }
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index 319efca..407b630 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -4,14 +4,22 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/core/loader.h"
 #include "hw/pci/pci.h"
 #include "xen_pt.h"
 
 /*
- * Scan the assigned devices for the devices that have an option ROM, and then
- * load the corresponding ROM data to RAM. If an error occurs while loading an
- * option ROM, we just ignore that option ROM and continue with the next one.
+ * Normally xen_pt_register_regions will handle loading the option ROM,
+ * but in some cases, such as for the Intel IGD, the option ROM might
+ * need to be modified.
+ *
+ * For such cases, use this function to get a pointer to the option ROM
+ * from sysfs. Caller has the responsibility to edit the option ROM as
+ * needed, call pci_register_bar to register the modified option ROM,
+ * and set has_rom to true for the PCI device.
+ *
+ * This function must be called before xen_pt_register_regions is called
+ * because if xen_pt_register_regions is called first, it will register
+ * the option ROM and any attempt to register it again will fail.
  */
 void *pci_assign_dev_load_option_rom(PCIDevice *dev,
                                      int *size, unsigned int domain,
@@ -76,8 +84,6 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
         goto close_rom;
     }
 
-    pci_register_bar(dev, PCI_ROM_SLOT, 0, &dev->rom);
-    dev->has_rom = true;
     *size = st.st_size;
 close_rom:
     /* Write "0" to disable ROM */
-- 
2.52.0


