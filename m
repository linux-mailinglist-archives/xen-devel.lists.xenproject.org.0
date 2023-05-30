Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E371658A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541217.843733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q40qi-0006d7-RR; Tue, 30 May 2023 15:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541217.843733; Tue, 30 May 2023 15:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q40qi-0006a9-OO; Tue, 30 May 2023 15:01:24 +0000
Received: by outflank-mailman (input) for mailman id 541217;
 Tue, 30 May 2023 15:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGug=BT=citrix.com=prvs=50771f348=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1q40qh-0006Zz-T9
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:01:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5d334a5-fefa-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 17:01:21 +0200 (CEST)
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
X-Inumbo-ID: d5d334a5-fefa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685458881;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rGvKnRwZHB6g8/WuMVkxc8zOkepepG1ZDwTftjDFvso=;
  b=A2PKGUYyYtp429/RIJlvNuy08niF5By0z9VGYfYGtAU/j63qxwMYV5fJ
   +h7X6jo2mRgg0Oi3jEU+BjNYjkhAJ5FrGmUPBaKFsSsYeFe6axq91foKF
   CVauUNAmtiDaS8IPCGtTUA/eN4NYuOJpn+VbTnHUCBGch2wFMTT1hEaT8
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110269648
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zKyT+q82s9/tFWzRr4wkDrUD3HmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 zYbXW7XafiOa2WhLo9/YIXj/EMCvZeAmN5kGgA+pSw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKsT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklu7
 KEWGhdcfyqpgtinnuqaUedFvMo8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAnH7kaHtcoV2Yv7U+52z7xw1tyrn9dtHSf7RmQO0Mxx7C+
 DOYozSR7hcyKoXOlyCJ2WCXlLXLwS/Zar4bO6G26as/6LGU7jNKU0BHPbehmtG9i0ijS5dcJ
 lYS9y4Gs6c/7gqoQ8P7Uhn+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 kOGm8PBAT1praGPTnSc5vGYoFuaMzA9JGsDaClUCwcIi/HvqZ8+yBLGSM1uFoaxj9voCXfxx
 SyHqG41gLB7pcwB2ri//FvHqymxvZWPRQkwji3VUXii9RhRf5O+asqj7l2zxfxHNoeCCF6ao
 GIDhdOd/cgJF5iGkCHLS+IIdJms5vCKNxXGjFJvFoVn/DOok1a7f4dW7SpWPkplMs8YPzTuZ
 Sf7qVMPzJxeJn2naelweY3ZI8cty7LpGfzmW+rSY94IZYJ+HDJr5wk3OxTWhTq01hFxz+dmY
 8zznduQ4WgyKb06wgiRFvYn+7oR135m5HjdbKr10EHyuVaBX0K9RbAAOVqIS+k26qKYvQnYm
 +pi29u2JwZ3C7OnPHSOmWIHBRVTdCVgW8iqwyBCXrTbSjeKDl3NHBM4LVkJX4V+15pYme7Tl
 p1Wch8JkQGv7ZErxOjjV5yCVF8NdcwnxZ7YFXZ2VbpN55TESdjH0UvnX8FrFYTLDcQ6pRKOc
 9ELet+bHtNEQSnd9jIWYPHV9dIyKU/72FjUZ3P/OFDTmqKMoCSQq7fZkvbHrnFSXkJbS+Niy
 1Ff6u8racVaHFkzZConQPmu00mwrRAgdBFaBiP1zi1oUBy0quBCcnWh5sLb1ulQcX0vMBPGj
 VfJafrZzMGRy7IIHC7h3vnY/tv5SrsvRCK33QDztN6LCMUTxUL7qacobQpCVW+1uL/ckEl6W
 dho8g==
IronPort-HdrOrdr: A9a23:gfkKx6lsxKzKBHpnQpEpx0xOkx3pDfIj3DAbv31ZSRFFG/Fw9v
 re+cjzsCWe4gr5N0tNpTntAsa9qArnhPlICOoqTNWftWvd2FdARbsKhebfKlvbdREWndQttp
 uIHZIeNPTASWNXpeuS2njdL+od
X-Talos-CUID: =?us-ascii?q?9a23=3AvZt3xWuhJARTDv/3DCOa7Nc56IsFayDT/lCBMnW?=
 =?us-ascii?q?SDFx4FuW0UlG5wq17xp8=3D?=
X-Talos-MUID: 9a23:Oh7r0Ao3r8fUPrOsJj0ezy87ZZly74+8M1JXlckKmfu4PANsNSjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110269648"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Juergen Gross
	<jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Jones
	<pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>
Subject: [PATCH v2] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
Date: Tue, 30 May 2023 16:01:06 +0100
Message-ID: <20230530150106.2703849-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since firmware doesn't indicate the iBFT in the E820, add a reserved
region so that it gets identity mapped when running as Dom 0 so that it
is possible to search for it. Move the call to reserve_ibft_region()
later so that it is called after the Xen identity mapping adjustments
are applied.

Finally, instead of using isa_bus_to_virt() which doesn't do the right
thing under Xen, use early_memremap() like the dmi_scan code does.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:
* Fix style issue
* Make added e820 entry conditional on ISCSI_IBFT_FIND

 arch/x86/kernel/setup.c            |  2 +-
 arch/x86/xen/setup.c               | 27 ++++++++++++++++++---------
 drivers/firmware/iscsi_ibft_find.c | 24 +++++++++++++++++-------
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 16babff771bd..616b80507abd 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -796,7 +796,6 @@ static void __init early_reserve_memory(void)
 
 	memblock_x86_reserve_range_setup_data();
 
-	reserve_ibft_region();
 	reserve_bios_regions();
 	trim_snb_memory();
 }
@@ -1032,6 +1031,7 @@ void __init setup_arch(char **cmdline_p)
 	if (efi_enabled(EFI_BOOT))
 		efi_init();
 
+	reserve_ibft_region();
 	dmi_setup();
 
 	/*
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index c2be3efb2ba0..07c7039bdd66 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -764,17 +764,26 @@ char * __init xen_memory_setup(void)
 	BUG_ON(memmap.nr_entries == 0);
 	xen_e820_table.nr_entries = memmap.nr_entries;
 
-	/*
-	 * Xen won't allow a 1:1 mapping to be created to UNUSABLE
-	 * regions, so if we're using the machine memory map leave the
-	 * region as RAM as it is in the pseudo-physical map.
-	 *
-	 * UNUSABLE regions in domUs are not handled and will need
-	 * a patch in the future.
-	 */
-	if (xen_initial_domain())
+	if (xen_initial_domain()) {
+		/*
+		 * Xen won't allow a 1:1 mapping to be created to UNUSABLE
+		 * regions, so if we're using the machine memory map leave the
+		 * region as RAM as it is in the pseudo-physical map.
+		 *
+		 * UNUSABLE regions in domUs are not handled and will need
+		 * a patch in the future.
+		 */
 		xen_ignore_unusable();
 
+#ifdef CONFIG_ISCSI_IBFT_FIND
+		/* Reserve 0.5 MiB to 1 MiB region so iBFT can be found */
+		xen_e820_table.entries[xen_e820_table.nr_entries].addr = 0x80000;
+		xen_e820_table.entries[xen_e820_table.nr_entries].size = 0x80000;
+		xen_e820_table.entries[xen_e820_table.nr_entries].type = E820_TYPE_RESERVED;
+		xen_e820_table.nr_entries++;
+#endif
+	}
+
 	/* Make sure the Xen-supplied memory map is well-ordered. */
 	e820__update_table(&xen_e820_table);
 
diff --git a/drivers/firmware/iscsi_ibft_find.c b/drivers/firmware/iscsi_ibft_find.c
index 94b49ccd23ac..e3c1449987dd 100644
--- a/drivers/firmware/iscsi_ibft_find.c
+++ b/drivers/firmware/iscsi_ibft_find.c
@@ -52,9 +52,9 @@ static const struct {
  */
 void __init reserve_ibft_region(void)
 {
-	unsigned long pos;
+	unsigned long pos, virt_pos = 0;
 	unsigned int len = 0;
-	void *virt;
+	void *virt = NULL;
 	int i;
 
 	ibft_phys_addr = 0;
@@ -70,13 +70,20 @@ void __init reserve_ibft_region(void)
 		 * so skip that area */
 		if (pos == VGA_MEM)
 			pos += VGA_SIZE;
-		virt = isa_bus_to_virt(pos);
+
+		/* Map page by page */
+		if (offset_in_page(pos) == 0) {
+			if (virt)
+				early_memunmap(virt, PAGE_SIZE);
+			virt = early_memremap_ro(pos, PAGE_SIZE);
+			virt_pos = pos;
+		}
 
 		for (i = 0; i < ARRAY_SIZE(ibft_signs); i++) {
-			if (memcmp(virt, ibft_signs[i].sign, IBFT_SIGN_LEN) ==
-			    0) {
+			if (memcmp(virt + (pos - virt_pos), ibft_signs[i].sign,
+				   IBFT_SIGN_LEN) == 0) {
 				unsigned long *addr =
-				    (unsigned long *)isa_bus_to_virt(pos + 4);
+				    (unsigned long *)(virt + pos - virt_pos + 4);
 				len = *addr;
 				/* if the length of the table extends past 1M,
 				 * the table cannot be valid. */
@@ -84,9 +91,12 @@ void __init reserve_ibft_region(void)
 					ibft_phys_addr = pos;
 					memblock_reserve(ibft_phys_addr, PAGE_ALIGN(len));
 					pr_info("iBFT found at %pa.\n", &ibft_phys_addr);
-					return;
+					goto out;
 				}
 			}
 		}
 	}
+
+out:
+	early_memunmap(virt, PAGE_SIZE);
 }
-- 
2.31.1


