Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187F464DF68
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463634.721874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rmH-0008LC-1v; Thu, 15 Dec 2022 17:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463634.721874; Thu, 15 Dec 2022 17:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rmG-0008IL-Uy; Thu, 15 Dec 2022 17:12:12 +0000
Received: by outflank-mailman (input) for mailman id 463634;
 Thu, 15 Dec 2022 17:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vu2t=4N=citrix.com=prvs=3415489ca=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1p5rmF-0007rI-AW
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 17:12:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aae069b-7c9b-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 18:12:09 +0100 (CET)
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
X-Inumbo-ID: 9aae069b-7c9b-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671124329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iz134rqvwTvscS9CWxWtMb5PUbEKwnQkr/UCyWzFbGs=;
  b=cwler39l1zu+KGJymcTlH13sXrQdTWMwrwtAxgABZ58N1OUppi0H0PWV
   PdLnGhvZ8uL8t11PHYHaCZxHvkcW9J1iX280UKlvfwrD1UBhKrHhU+vZh
   hquos4FJgsY8Fa/cBkn8eNPXCIXHpySX7/3mcNm8FAtP+CXCxAbepKLOU
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88593916
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NDUmsqB1d1zGmhVW/zvjw5YqxClBgxIJ4kV8jS/XYbTApDtx1j0Am
 jMdXG6Bb6uNZjSmeNhxPovj90IFu8ODndI3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlB4wRjDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwb40KjkSz
 9IjBi0/UDqjoO2G27uVY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/Cp84muami2O5czBCol+PuYI84nTJzRw327/oWDbQUozaGJQOzx/Gz
 o7A103YPz0rHd6S8ziErHuBgdGSogykAo1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmPwKfJ5weSBkAfUyVMLtchsacLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aAnBWBjdeXwE/YxY33fPDh44DlRvhZ4M2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD3271k5JAVdoKiN2bGKuOGphsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRO8AtLlHarXswPyZ8OlwBdmB2ycnT3
 r/CIa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmrfVA/Qjl6V6SNqV7jEqQ895loei7z1
 inVcidlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:Czgwdqyz2Y+KN4Jj1TaRKrPwEr1zdoMgy1knxilNoHtuH/Bw9v
 rDoB1/73XJYVkqOU3I9erwWpVoa0msjKKdmLNhW4tKPzOHhILLFu9fBOLZqlXd8kvFh4lgPM
 xbAstD4bPLYmSTtqzBkWyF+twbsb26GfCT7tvj8w==
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="88593916"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: <jennifer.herbert@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/2] acpi: Add TPM2 interface definition.
Date: Thu, 15 Dec 2022 17:09:34 +0000
Message-ID: <20221215170934.123889-3-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221215170934.123889-1-jennifer.herbert@citrix.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20221215170934.123889-1-jennifer.herbert@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch introduces an optional TPM 2 interface definition to the ACPI table,
which is to be used as part of a vTPM 2 implementation.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 tools/firmware/hvmloader/config.h |  1 +
 tools/firmware/hvmloader/util.c   |  7 ++++++
 tools/libacpi/Makefile            |  2 +-
 tools/libacpi/acpi2_0.h           | 26 ++++++++++++++++++++++
 tools/libacpi/build.c             | 35 ++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h           |  1 +
 tools/libacpi/ssdt_tpm2.asl       | 36 +++++++++++++++++++++++++++++++
 7 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 tools/libacpi/ssdt_tpm2.asl

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc5..4dec7195f0 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -56,6 +56,7 @@ extern uint8_t ioapic_version;
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
+#define ACPI_CRB_HDR_ADDRESS 0xFED40034UL
 
 extern uint32_t pci_mem_start;
 extern const uint32_t pci_mem_end;
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 87bc2d677f..6e5d3609b9 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -1009,6 +1009,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->table_flags |= ACPI_HAS_TPM;
         config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
         break;
+    case 2:
+        config->table_flags |= ACPI_HAS_TPM;
+        config->crb_hdr = (uint16_t *)ACPI_CRB_HDR_ADDRESS;
+
+        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT, TPM_LOG_SIZE >> PAGE_SHIFT);
+        memset((void *)(TPM_LOG_AREA_ADDRESS), 0, TPM_LOG_SIZE);
+        break;
     }
 
     config->numa.nr_vmemranges = nr_vmemranges;
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index 60860eaa00..125f29fb54 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -25,7 +25,7 @@ C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
-H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_laptop_slate.h)
+H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
 
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
 MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 2619ba32db..f4eb4d715b 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -121,6 +121,30 @@ struct acpi_20_tcpa {
 };
 #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
 
+/*
+ * TPM2
+ */
+struct acpi_20_tpm2 {
+    struct acpi_header header;
+    uint16_t platform_class;
+    uint16_t reserved;
+    uint64_t control_area_address;
+    uint32_t start_method;
+    uint8_t start_method_params[12];
+    uint32_t log_area_minimum_length;
+    uint64_t log_area_start_address;
+};
+#define TPM2_ACPI_CLASS_CLIENT      0
+#define TPM2_START_METHOD_CRB       7
+
+#define TPM_CRB_ADDR_BASE           0xFED40000
+#define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + 0x40)
+
+#define TPM_LOG_AREA_ADDRESS        0xFED50000
+
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 << 10)
+#define TPM_LOG_SIZE                (64 << 10)
+
 /*
  * Fixed ACPI Description Table Structure (FADT) in ACPI 1.0.
  */
@@ -431,6 +455,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_SIGNATURE ASCII32('R','S','D','T')
 #define ACPI_2_0_XSDT_SIGNATURE ASCII32('X','S','D','T')
 #define ACPI_2_0_TCPA_SIGNATURE ASCII32('T','C','P','A')
+#define ACPI_2_0_TPM2_SIGNATURE ASCII32('T','P','M','2')
 #define ACPI_2_0_HPET_SIGNATURE ASCII32('H','P','E','T')
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
@@ -444,6 +469,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_RSDT_REVISION 0x01
 #define ACPI_2_0_XSDT_REVISION 0x01
 #define ACPI_2_0_TCPA_REVISION 0x02
+#define ACPI_2_0_TPM2_REVISION 0x04
 #define ACPI_2_0_HPET_REVISION 0x01
 #define ACPI_2_0_WAET_REVISION 0x01
 #define ACPI_1_0_FADT_REVISION 0x01
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index d313ccd8cf..d4f25a68d2 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -19,6 +19,7 @@
 #include "ssdt_s3.h"
 #include "ssdt_s4.h"
 #include "ssdt_tpm.h"
+#include "ssdt_tpm2.h"
 #include "ssdt_pm.h"
 #include "ssdt_laptop_slate.h"
 #include <xen/hvm/hvm_info_table.h>
@@ -352,6 +353,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_tcpa *tcpa;
     unsigned char *ssdt;
     void *lasa;
+    struct acpi_20_tpm2 *tpm2;
 
     /* MADT. */
     if ( (config->hvminfo->nr_vcpus > 1) || config->hvminfo->apic_mode )
@@ -449,6 +451,39 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
                              tcpa->header.length);
             }
             break;
+
+        case 2:
+            if (!config->crb_hdr ||
+                config->crb_hdr[0] == 0 || config->crb_hdr[0] == 0xffff)
+                break;
+
+            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
+            if (!ssdt) return -1;
+            memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
+
+            tpm2 = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tpm2), 16);
+            if (!tpm2) return -1;
+            memset(tpm2, 0, sizeof(*tpm2));
+            table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tpm2);
+
+            tpm2->header.signature = ACPI_2_0_TPM2_SIGNATURE;
+            tpm2->header.length    = sizeof(*tpm2);
+            tpm2->header.revision  = ACPI_2_0_TPM2_REVISION;
+            fixed_strcpy(tpm2->header.oem_id, ACPI_OEM_ID);
+            fixed_strcpy(tpm2->header.oem_table_id, ACPI_OEM_TABLE_ID);
+            tpm2->header.oem_revision = ACPI_OEM_REVISION;
+            tpm2->header.creator_id   = ACPI_CREATOR_ID;
+            tpm2->header.creator_revision = ACPI_CREATOR_REVISION;
+            tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
+            tpm2->control_area_address = TPM_CRB_ADDR_CTRL;
+            tpm2->start_method = TPM2_START_METHOD_CRB;
+            tpm2->log_area_minimum_length = TPM_LOG_AREA_MINIMUM_SIZE;
+            tpm2->log_area_start_address = TPM_LOG_AREA_ADDRESS;
+
+            set_checksum(tpm2,
+                         offsetof(struct acpi_header, checksum),
+                         tpm2->header.length);
         }
     }
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index 9143616130..b5d08ff09b 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -80,6 +80,7 @@ struct acpi_config {
 
     uint8_t tpm_version;
     const uint16_t *tis_hdr;
+    const uint16_t *crb_hdr;
     /*
      * Address where acpi_info should be placed.
      * This must match the OperationRegion(BIOS, SystemMemory, ....)
diff --git a/tools/libacpi/ssdt_tpm2.asl b/tools/libacpi/ssdt_tpm2.asl
new file mode 100644
index 0000000000..1801c338df
--- /dev/null
+++ b/tools/libacpi/ssdt_tpm2.asl
@@ -0,0 +1,36 @@
+/*
+ * ssdt_tpm2.asl
+ *
+ * Copyright (c) 2018-2022, Citrix Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+/* SSDT for TPM CRB Interface for Xen with Qemu device model. */
+
+DefinitionBlock ("SSDT_TPM2.aml", "SSDT", 2, "Xen", "HVM", 0)
+{
+    Device (TPM)
+    {
+        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+        {
+            Memory32Fixed (ReadWrite,
+                0xFED40000,         // Address Base
+                0x00001000,         // Address Length
+                )
+        })
+        Method (_STA, 0, NotSerialized)  // _STA: Status
+        {
+            Return (0x0F)
+        }
+    }
+}
-- 
2.31.1


