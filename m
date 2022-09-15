Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8D5BA1EC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 22:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407668.650250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYvfg-0005ox-OT; Thu, 15 Sep 2022 20:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407668.650250; Thu, 15 Sep 2022 20:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYvfg-0005mQ-Jp; Thu, 15 Sep 2022 20:41:16 +0000
Received: by outflank-mailman (input) for mailman id 407668;
 Thu, 15 Sep 2022 20:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaRG=ZS=citrix.com=prvs=250bec243=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1oYvff-0005Wf-2j
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 20:41:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc7e9695-3536-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 22:41:13 +0200 (CEST)
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
X-Inumbo-ID: bc7e9695-3536-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663274473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a81udNHz/IlPqVKBLEW5GyDm0ULIJu6/GbwCobxYlU8=;
  b=CeSkpd05aSPdG6oYylmBbfr/4TSiUcO/LMiW8StM2AUt5NNXmhINg8U5
   k+bMMiJwUbI3aP6jyjt/QfX0MbeN1eUeMEUIVbuqIsmFvhv1qTlyHMaVS
   QGn9EarOAlFbi8ffLWEmZtsHN4tiXHNcPxjPvGdSRRD7yTCDsiLemwmZU
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83155908
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XQR+jaIYO6UYFy/KFE+RvJUlxSXFcZb7ZxGr2PjKsXjdYENS0DYCx
 zNJUWzQPKqOMWukLt4lPojl8klXsZHcyt9qSgdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/Pa9Us01BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEzq5IMWMfP6Ah/cFvGz1R2
 OEhDD0KV0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HbhnGZRxBN01RCJ8kluqymlH0ciFCqULTrq0yi4TW5FwqieWwYYKFEjCMbe5snBep5
 X/bxUP4AkBELd3c8haI1X3504cjmgukAdlPRdVU7MVCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGS0SvHtUhv+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9RCm7y5W9rx6LPg8NNzMdSDI9aQYC2oy2yG0stS4jXuqPAYbs0IOuQWyqm
 23UxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvZ5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51gLusECZyr1Mf8fj2eN5yMClPCIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL9rxJJdxmUjSM0uPGs2gp/lmuJLCDEOopUAtbgbfN71psfveyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7dzjm8VBT6UjKlvFq
IronPort-HdrOrdr: A9a23:GEbk3qhJsuFPLZ+UWUFLbyqM5XBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.93,319,1654574400"; 
   d="scan'208";a="83155908"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <wl@xen.org>,
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jennifer Herbert
	<jennifer.herbert@citrix.com>
Subject: [PATCH 1/2] acpi: Make TPM version configurable.
Date: Thu, 15 Sep 2022 20:40:28 +0000
Message-ID: <20220915204029.1227112-1-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch makes the TPM version, for which the ACPI libary probes, configurable.
If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
I have also added to hvmloader an option to allow setting this new config, which can
be triggered by setting the platform/tpm_verion xenstore key.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 docs/misc/xenstore-paths.pandoc |  8 ++++
 tools/firmware/hvmloader/util.c | 13 ++++++-
 tools/libacpi/build.c           | 68 ++++++++++++++++++---------------
 tools/libacpi/libacpi.h         |  4 +-
 4 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index 5cd5c8a3b9..7270b46721 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -269,6 +269,14 @@ at the guest physical address in HVM_PARAM_VM_GENERATION_ID_ADDR.
 See Microsoft's "Virtual Machine Generation ID" specification for the
 circumstances where the generation ID needs to be changed.
 
+
+#### ~/platform/tpm_version = INTEGER [HVM,INTERNAL]
+
+The TPM version to be probed for.
+
+A value of 1 indicates to probe for TPM 1.2. If unset, or an
+invalid version, then no TPM is probed.
+
 ### Frontend device paths
 
 Paravirtual device frontends are generally specified by their own
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cf..87bc2d677f 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
         config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
 
-    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
+    config->table_flags |= (ACPI_HAS_TPM | ACPI_HAS_IOAPIC |
                             ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
                             ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
                             ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
     config->acpi_revision = 4;
 
-    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+    s = xenstore_read("platform/tpm_version", "0");
+    config->tpm_version = strtoll(s, NULL, 0);
+
+    switch( config->tpm_version )
+    {
+    case 1:
+        config->table_flags |= ACPI_HAS_TPM;
+        config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+        break;
+    }
 
     config->numa.nr_vmemranges = nr_vmemranges;
     config->numa.nr_vnodes = nr_vnodes;
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index fe2db66a62..d313ccd8cf 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -409,38 +409,46 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
     }
-
-    /* TPM TCPA and SSDT. */
-    if ( (config->table_flags & ACPI_HAS_TCPA) &&
-         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
-         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
+    /* TPM and SSDT. */
+    if (config->table_flags & ACPI_HAS_TPM)
     {
-        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
-        if (!ssdt) return -1;
-        memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
-        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
-
-        tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
-        if (!tcpa) return -1;
-        memset(tcpa, 0, sizeof(*tcpa));
-        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
-
-        tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
-        tcpa->header.length    = sizeof(*tcpa);
-        tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
-        fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
-        fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
-        tcpa->header.oem_revision = ACPI_OEM_REVISION;
-        tcpa->header.creator_id   = ACPI_CREATOR_ID;
-        tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
-        if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
+        switch (config->tpm_version)
         {
-            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
-            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
-            memset(lasa, 0, tcpa->laml);
-            set_checksum(tcpa,
-                         offsetof(struct acpi_header, checksum),
-                         tcpa->header.length);
+        case 1:
+            if (!config->tis_hdr ||
+                config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
+                config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff)
+                break;
+
+            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
+            if (!ssdt) return -1;
+            memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
+
+            tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
+            if (!tcpa) return -1;
+            memset(tcpa, 0, sizeof(*tcpa));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
+
+            tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
+            tcpa->header.length    = sizeof(*tcpa);
+            tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
+            fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
+            fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
+            tcpa->header.oem_revision = ACPI_OEM_REVISION;
+            tcpa->header.creator_id   = ACPI_CREATOR_ID;
+            tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
+
+            if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
+            {
+                tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
+                tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
+                memset(lasa, 0, tcpa->laml);
+                set_checksum(tcpa,
+                             offsetof(struct acpi_header, checksum),
+                             tcpa->header.length);
+            }
+            break;
         }
     }
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index a2efd23b0b..9143616130 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -27,7 +27,7 @@
 #define ACPI_HAS_SSDT_PM           (1<<4)
 #define ACPI_HAS_SSDT_S3           (1<<5)
 #define ACPI_HAS_SSDT_S4           (1<<6)
-#define ACPI_HAS_TCPA              (1<<7)
+#define ACPI_HAS_TPM               (1<<7)
 #define ACPI_HAS_IOAPIC            (1<<8)
 #define ACPI_HAS_WAET              (1<<9)
 #define ACPI_HAS_PMTIMER           (1<<10)
@@ -78,8 +78,8 @@ struct acpi_config {
     struct acpi_numa numa;
     const struct hvm_info_table *hvminfo;
 
+    uint8_t tpm_version;
     const uint16_t *tis_hdr;
-
     /*
      * Address where acpi_info should be placed.
      * This must match the OperationRegion(BIOS, SystemMemory, ....)
-- 
2.31.1


