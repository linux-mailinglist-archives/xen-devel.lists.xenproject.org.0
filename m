Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 06plAATKT2qXoQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 18:19:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FE73362D
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 18:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b="PHuO18g/";
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358344.1612534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrSZ-0002Hj-IL; Thu, 09 Jul 2026 16:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358344.1612534; Thu, 09 Jul 2026 16:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrSZ-0002ET-DE; Thu, 09 Jul 2026 16:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1358344;
 Thu, 09 Jul 2026 16:18:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whrSY-0002Bw-JL
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 16:18:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whrSX-00CbhJ-WC
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:18:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9d9-5cb7-0a2a0a5109dd-0a2a4504812a-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:45 +0200
Received: from [98.137.68.147] (helo=sonic302-21.consmr.mail.gq1.yahoo.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9e4-b1e5-0a2a45040019-6289449386fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:45 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 16:18:43 +0000
Received: by hermes--production-ne1-7568ccb994-pgg8z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e91c25460b5bcef5e32390743f7fb9e1; 
 Thu, 09 Jul 2026 16:18:38 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783613923; bh=NjzxgWYBhBDPccqwhPPakgGCHJbF/Oi59PNz/FTey5U=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=PHuO18g/I5iYnOfQIVSRLWKyeo2iCMloTvx5+lXG2qV0bULcTAGOI4OmbCop+ztt1cRcMXUkCaw4F92WaYZ6skoYHBqkVBPhSTWQGuoYNGRqBnUA8Y3Jhrin8/38jaY+uctg2GGEfaCo4jGlghMwtD65+QBMIBSGVuQT7YakSj5WEaq408JZ12G+aNU7FNIs81OA//DO2Heockdg0U44MqTN6SzOjse6bo4LmxPUOczjhur8phInLkWOhTawJvGwCZLARMUK5ES57v7nSzxNlp8nZT2ISTdB85pt4MCTvH2mQCsrLcvo46trbPSIoCEIdjm1W7PFXz36wFu6U+Vykg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783613923; bh=Xl5UUP6heRHfJ8Onch0/iWYn1uKw2wGFHWxnlLcOHDy=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=bOMMEcUh9wmtbT18lfuP/P4Oenff5m9OfyHPwnCrye51v2jz/OsWRxc0Mwl5JrzBl3uVRUAHJT/FuexNMTg2I4dTgOMnd8nbgNs2gWoMJ3SOWoMQwZjK/+QH6inFgQ5QgHVE/UPEct0mfQDqyPfJoeYlobbhpi+MzcyGQEg85UOT6GAc/U4Gk+tUfJN4GR9BzLyOpZcZtwch9ZynVNQfuhiORb2N0il5gtlmtjt0ArU2Murn99xZJYHozoVcBtEmvIDict37Wgk7enOVeQNUu0+speWE1uRX3mBM63omRz5jy1pO4Kq9M6oh8zA+wrpWP5IiHZSZ3Lks7e+5crtKdw==
X-YMail-OSG: 3tIgTM0VM1miw.Bg87GxNRNIZzn9cSlNuAeqHdxBMPeyQy5imEcADUoBcuuqZCX
 5zBmO_GgpZLfDzpDLqzCoDU3vAFnYArJutpOkmFzxt1fcZxbU.3RXwT4hhOj_lHrIqrGXz4MaX81
 E9Al13md4pyIq7ag0QGfSuWQUaEMi3RS0haQk8a.zMV36EW.4B.BlMRYtqQwItY3UJXunxAmkiQ.
 SSFFRQdBduyKdtgcJjx67V2Jut61s2Dh5_CgwEEyvTuaNo8D49VRRTfaiieMQiUxKJEFWZpDxHgG
 ao_qtb.T7Am3PXA.2LTxxAYEQBciBIUDvfCzmQIcu.Q12VtAOLGTYl1bVnSyRXYeJpuO9s09B8Gz
 sCng6NUWZMmoTf1D67AILE8lk6Ui5ifGOsp4wsw1CRrfKbdOe.edKucYDrVyutq_0TB3YMZM.c_d
 CqnyNGFHiNa_7vV5jo3xWjTWr2a0DQCWF4XpOETaxL2JfEP4Aw4IdzBsYVASO1VROxXe590C_j4k
 ZiTlsfOh8OrELz48vCKp5L1kgpM7_hStlvern3hPxYQ5VzX3OgQiPar.NmSC4u5bPSdQ5Dx5SldX
 z.dPCnjN2b3uSY6lcvCLMms2OhscfCAAuA7io_4fPCYrbIl0QDC6GEB4BassCX8Oz2zimKPGLuYF
 d_c_pqpWzSwitZ79zCG1nzsI4FvK7zuOs5PPV963jvoXe4ocO_1BBjl.2.V471KC.hw42GNNGM7j
 HlCvnwp2fcLd1EFSxfIVENbqTR5TQUaL6oVjjzAUabk0UdliHJrWdqIrxt1OafhtO3aN4l9FvHL0
 iuxe3IwEh_wqK0B2TSd7aqfClxuynwfFuGGtZlL7v2OazH7Efb4OSFYbPEGH4KvmwslUQBUjtsUu
 vNuoFT42WbhzPAtClEmmcmMV6GOYrBX6G6pqA1rGiNhkikwg7j.7KBwhpOchU3_uM.VZR.hTivDz
 r7foOuX66QBECLloyT3_8HdnSVRlWFsF54FYcx0C.cF2jDHLsUoBkMQ2yyvzHP1Pk0r0nAOPWn__
 jGkDFM4928kljPAknpV6kLCJjsv8wBBd24GzNIjg3SLGQGE0p66mwsvdOy4gTgQ8q7t.egSRdRkj
 4JZxpKq0oB8XRHkpJ8l1yJr_BaiRTbmXiIYrtw9FYOWwrl2jT3hRLmUqgklRnbbdfFW21T9HWOgm
 1ORAroEFkqTz3NTP86v_ksyZWm.2oIY2.U7GR3QkWeczfNRSDkIa8Oh1eRn0io0p4JT0QV04tHqt
 ZFmRGQkb7doizInW6kiOEeoJStab0_TrUT1X_8TWEatZphieOrJjHyYg3dqYSR7uLfJ1Q0bZxnZz
 CfLRgi8UTx8WUutJJaleCXO6VemvNpIV9xU2sRna5JVlKjtBoyqNs9vGDUKIu7il3ulAgy.y06Ov
 Lu2yE7KefvztYOibRVCG_mE8k9ouP02TOZv3Fk7OTbWom0o6HUCBwEFLJtPyqvpRYdB73K9SlwTa
 EoJdUUiIeBJLGnoszHA5AVzcRmyUyPZeJLA.uiuMyu5.KiPXglYfJkRiRbSBducJLJbIInE_5k7E
 juakvPbVXNpVvO.Z08eLK9kyMEbPqggLEYGHFyLXEgb6N.MMaAjf1p4vfa4b_BKen_ZJ0x1HJLRt
 5nrP9XO_GPCpGM1LltX3gf.oSigI4oF5uLyAOvCaP7jpT6AZbDcR9KAYWmaEWcz7su3.JdUICMdr
 C9l12xw3hzYgDceYW7N5tW.lSsu_BAeCtk1qzXaWWjHg9HjLodMbg4R8mQWGfkgxPcgRimx44RAr
 AdcJp5VMnRkXEF0azSW8Up1DeSGyg5Lhy1mSCV17pUEUaKcFAX7K0t2FfS4gMGJZwDy8C2q198pQ
 FIDrb54I77XY262fywuIgRLOjqQEWig7sQn.pUsmuJNM6YNCoY7NDKtQABKcDKxEYhUiTVf8XrSf
 B55sBeennmKettCkvnCIglv2FM5nsUS3lmA8gNeG4VkNb6_yxwo_cIZNmXP5g9CcienYPljsedaU
 wp7CXsU.pR3kmHKQoFO_cgNQ4sB05fdI68ipOHGDkP4zI4bw.V7u8lpZzYviE8htqFP9FHZEsH9g
 qw2BAxn7NKgWtbyXFqgy_tnV7mYjpmHbo4gk6zBUCIzEMEu7GSCLyKWVJk8fhh9HZG5oWtsTtgs4
 AUK8SeO_277aLrjCNOa1.c9UfanPyi4GFgsBGH4fRlhy7N8WQeZyj35wsq03qpBqJU3cLqj1PzLF
 EMKPt8xrOZmytqLq0Liie6UHLMF4XpTGcyTLnI7O3
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: f78416a5-1708-4bda-9a80-a47dc8b7966b
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 3/3] xen/igd: fixup device id before registering rom
Date: Thu,  9 Jul 2026 12:18:31 -0400
Message-ID: <20260709161831.17753-4-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709161831.17753-1-brchuckz@aol.com>
References: <20260709161831.17753-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783613925-775A8FE7-A28A73AC/0/0
X-purgate-type: clean
X-purgate-size: 3251
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:stable@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nongnu.org,lists.xenproject.org,kernel.org,xenproject.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[aol.com:+];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 474FE73362D

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

Also, remove unused header hw/core/loader.h.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v2:
  - add a period to the end of the last sentence of the commit message
  - add stable to Cc list

 hw/xen/xen_pt_graphics.c |  3 +++
 hw/xen/xen_pt_load_rom.c | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 2ef941e..aface0b 100644
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


