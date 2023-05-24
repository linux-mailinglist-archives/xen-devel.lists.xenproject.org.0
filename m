Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269E470FB59
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 18:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539174.839798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1r0N-0006dh-Sx; Wed, 24 May 2023 16:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539174.839798; Wed, 24 May 2023 16:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1r0N-0006bE-Q1; Wed, 24 May 2023 16:06:27 +0000
Received: by outflank-mailman (input) for mailman id 539174;
 Wed, 24 May 2023 16:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V2qZ=BN=citrix.com=prvs=5010cee81=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1q1r0L-0006b8-Op
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 16:06:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecf495ba-fa4c-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 18:06:23 +0200 (CEST)
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
X-Inumbo-ID: ecf495ba-fa4c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684944383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tm65vq3RdyIRKBQDq/1y/ORB5HYwi09XnCHiE+t3B2o=;
  b=IXOyRW1O1dwyTZFgkjs6FBkkW6963VO7lDUxOdBOy9fNuwTVoKa4cFf1
   T7ktKkPK07YpHcX/ZRkMBQ0aaSgTvC4yJz4WiOHmv1D3ijgXVtFFWoDZo
   qlxUyslgFWoprcmAfngHgxwwSXR4wfHO0Bjr9UlbKN28Aj1UPJVMjvF0g
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109010816
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ZJU7g65duXdmHzo6yR3dbwxRtHzAchMFZxGqfqrLsTDasY5as4F+v
 jccWGqBOfbbZmukKIgja4+0pElTusKEydY3SlZu/ngyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 NEVGSwWSw242s2OzJWmS+Mvuv0aM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrmP4aCYerFuaqLAo6mzX5AdwzKLsIJzefdniqcB9xx7J/
 juerz2nav0cHPuixD/ZtVu2uuqM3jHWU94CU7uk2fE/1TV/wURMUUZLBDNXu8KRjk+4RsIaK
 EEO/CcqhbY9+VbtTdTnWRC85nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neVkNf5LThutqCJU3Wb96fSoT7aESINBWYGZCICHU0J7rHLrIgtg1TPR9B4HaiditzzBCG2w
 jaWoSx4jLIW5eYJ2L+85kvvmC+3q97CSQtdzg/QRGO+qARieJSieZer+HDc9/9LKIvfRV6E1
 FABms6R68gUAJ2NnTDLS+IIdJmx5fGDPSb0m1NjH5A9sT+q/haLbdAOyDJzPkFkNoADYzCBS
 EzUvxlY6LdQMWGsYKsxZJi+Y/nG1oC5S46jDKqNKIMTPN4oLlTvEDxSiVC49k3goVQ3tLwEZ
 LijfeGxDHxZNZ1e02/jLwsC6oMDyic7zGLVYJn0yRW7zLaTDEKopac53EimNb5gsv7dyOnB2
 5MGbpbRlU0DOAHrSnOPmbP/O2zmOpTS6Xrej8VMPtCOLQN9cI3KI6+AmOhxE2CJckk8qwspw
 p1fchUAoLYcrSedQelvVpyEQO2HYHqHhShnVRHAxH7xs5TZXa6h7b0Ea7w8dqQ9+epowJZcF
 qdVJ5XeXKQTEWqWoVzxiKURS6Q7LnyWaf+mZXL5MFDTgbY7L+A2xjMUVlS2r3RfZsZGncA/v
 6ehxmvmfHb3fCw7VJy+QKv2nzuMUY01xLoas73gfoMCJy0BMeFCd0TMsxPAC51Qd0iYnWvGi
 m57w34w/IHwnmP8y/GR7YjskmtjO7AidqaGNwE3NYqLCBQ=
IronPort-HdrOrdr: A9a23:o7Kw36o2R/qRvJjUU7PAEJUaV5oJeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MBThHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaerIGuP3iJxAWN2uqUuFkTsaEJ2IMT0JdzpyfSVNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AqSPEPWn0YOBFKzhT5B2DEIZaQmvXOVTwwUbMOGq?=
 =?us-ascii?q?lMjtGcLGyVF6au59dqtU7zg=3D=3D?=
X-Talos-MUID: 9a23:E7Tvtggk1lYhpJwDOK5m0MMpE/pl5vjpIVoxlNZFqeSPaTw3PSuyg2Hi
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="109010816"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Peter Jones <pjones@redhat.com>, "Konrad
 Rzeszutek Wilk" <konrad@kernel.org>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
Date: Wed, 24 May 2023 17:05:58 +0100
Message-ID: <20230524160558.3686226-1-ross.lagerwall@citrix.com>
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

It tested this to work under Xen and native Linux.

 arch/x86/kernel/setup.c            |  2 +-
 arch/x86/xen/setup.c               |  8 +++++++-
 drivers/firmware/iscsi_ibft_find.c | 24 +++++++++++++++++-------
 3 files changed, 25 insertions(+), 9 deletions(-)

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
index c2be3efb2ba0..daab59df3b99 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -772,8 +772,14 @@ char * __init xen_memory_setup(void)
 	 * UNUSABLE regions in domUs are not handled and will need
 	 * a patch in the future.
 	 */
-	if (xen_initial_domain())
+	if (xen_initial_domain()) {
 		xen_ignore_unusable();
+		/* Reserve 0.5 MiB to 1 MiB region so iBFT can be found */
+		xen_e820_table.entries[xen_e820_table.nr_entries].addr = 0x80000;
+		xen_e820_table.entries[xen_e820_table.nr_entries].size = 0x80000;
+		xen_e820_table.entries[xen_e820_table.nr_entries].type = E820_TYPE_RESERVED;
+		xen_e820_table.nr_entries++;
+	}
 
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


