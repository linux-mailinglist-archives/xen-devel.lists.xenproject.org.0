Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17A9BD0DB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830416.1245407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LhV-00035X-Cp; Tue, 05 Nov 2024 15:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830416.1245407; Tue, 05 Nov 2024 15:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LhV-000340-A3; Tue, 05 Nov 2024 15:42:37 +0000
Received: by outflank-mailman (input) for mailman id 830416;
 Tue, 05 Nov 2024 15:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlyn=SA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1t8LhT-00033u-OJ
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:42:35 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a22962-9b8c-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 16:42:31 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fc96f9c41fso59302021fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:42:31 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.152.50])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef8c6532sm21327941fa.121.2024.11.05.07.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 07:42:28 -0800 (PST)
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
X-Inumbo-ID: 91a22962-9b8c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkxYTIyOTYyLTliOGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODIxMzUxLjQzOTMzOSwic2VuZGVyIjoib2xla3N0eXNoQGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730821350; x=1731426150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c0HTXNi9gUQihZmAzaTOUYAdYouLWPx63xU2TGwafCc=;
        b=iiLsqsFNfx6PryJwfP8Og66+gDkkwfc/hcfgXKSMPPDa2QuJrbGDdzQqnpRCX6eslP
         6TBgyLpL4NAzq8ODhfiuqh5/fgGlL5o7HsmYkib/+FUhv+9ArzE9XU6iHz3Dh0VJUxqG
         VBaWfy2JR9d/FoPf4AvWPTyx9Kh8w3AyoKaXchVp1i/cKt7dSaaSO1ECkusJW0XQTmJB
         AWjBixODFHYg7FxBmHIOBPC9Uuse7e0vOqkSoMrx7Bp4Pz88LDqvZIs8QWKX0dQc4PL3
         0ewtUHTIokqTApSX1w3T1stJgQacXQ4byk55mS+7wHdwcXWeICHkLw5vSTGjlcDA3eNH
         ALGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730821350; x=1731426150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0HTXNi9gUQihZmAzaTOUYAdYouLWPx63xU2TGwafCc=;
        b=QD4FONW81Xm+1/D1bvaYWlZKsq2FX4sIE/HoIA59EPYd5/phXV5VsX3ea7ztxNtJsY
         uL+mql7Yfk81WuRqRlvKfjZwrLPxB25VyUCH+SKpNRTbRX9GVA4EZFqR6kjLCqL4E+JW
         gj72IQjAyJPB8wDogkPVeLeiKxkGFBNdPwEKCgNSW62AZml75Aju9gEh+OMbmXJRs90T
         j83xex2J+N26Q+FUcDBJBYeBSzGBt5tFRPT7MyjqFZUL17i2M/i/52aMTcZ8UVPsR6Xs
         j9z4z/ZLT2m1jLqoP+G7APH3g3zYrcQ+S6x5uVUGgSSZ+x0zdkVCdGzS9jRg6G7/9NG7
         9GUw==
X-Gm-Message-State: AOJu0Yw3C/aSp8fodmxdvfwqBtFZmwZd3ZEfK5rV0T2I60yrgeTzD+Hg
	RV3FipMkzygoeiSGEzVce/wTb+kE0oNhbHucGfAt3PYOkFHmqWNo62ORKA==
X-Google-Smtp-Source: AGHT+IF21N/C/tWgzOxyx1suEDfZ99009JYf9Z+j4VCdJKdDmP9LiVgLTvi58lSG953Yhkm7pbOj0w==
X-Received: by 2002:a05:651c:2115:b0:2f7:cac8:9e38 with SMTP id 38308e7fff4ca-2fedb46e118mr59758921fa.18.1730821349778;
        Tue, 05 Nov 2024 07:42:29 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>,
	Hisao Munakata <hisao.munakata.vt@renesas.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V2] docs: fusa: Add requirements for Device Passthrough
Date: Tue,  5 Nov 2024 17:41:10 +0200
Message-Id: <20241105154110.2175555-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Add common requirements for a physical device assignment to Arm64
and AMD64 PVH domains.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Previous discussion (V1) here:
https://lists.xenproject.org/archives/html/xen-devel/2024-10/msg00534.html

  V2:
    A lot of changes... Reworked the document significantly. Incorporated review
    comments done for V1: The main changes are:
     - split complex requirements
     - clarify existing requirements
     - generalize requirements
     - add more requirements
     - drop redundant requirements
---
---
 .../reqs/design-reqs/common/passthrough.rst   | 432 ++++++++++++++++++
 docs/fusa/reqs/index.rst                      |   1 +
 docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
 docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
 4 files changed, 495 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
 create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst

diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs/fusa/reqs/design-reqs/common/passthrough.rst
new file mode 100644
index 0000000000..58a140a0a1
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
@@ -0,0 +1,432 @@
+
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Device Passthrough
+==================
+
+The following are the requirements related to a physical device assignment
+[1], [2] to Arm64 and AMD64 PVH boot time domains.
+
+Requirements for both Arm64 and AMD64 PVH
+=========================================
+
+Configure IOMMU at boot
+-----------------------
+
+`XenSwdgn~passthrough_configure_iommu_at_boot~1`
+
+Description:
+Xen shall configure the IOMMU at domain creation time according to the stage-2
+(or 2nd stage) translation tables.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Provide interface for addition and removal of PCI devices
+---------------------------------------------------------
+
+`XenSwdgn~passthrough_provide_if_for_add_rm_pci_devs~1`
+
+Description:
+Xen shall provide hypercalls to allow the hardware domain to inform Xen about
+the appearance and disappearance of PCI devices.
+
+Rationale:
+The hardware domain enumerates and discovers PCI devices.
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Discover PCI devices from Xen
+-----------------------------
+
+`XenSwdgn~passthrough_discover_pci_devs_from_xen~1`
+
+Description:
+Xen shall discover PCI devices (enumerated by the firmware beforehand) at boot.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Support assignment of PCI devices
+---------------------------------
+
+`XenSwdgn~passthrough_support_assign_pci_devs~1`
+
+Description:
+Xen shall support the assignment of PCI devices to the domains. The PCI device
+is always implied as DMA-capable and interrupt-driven.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Support deassignment of PCI devices
+-----------------------------------
+
+`XenSwdgn~passthrough_support_deassign_pci_devs~1`
+
+Description:
+Xen shall support the deassignment of PCI devices from the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign PCI device from domain
+-------------------------------
+
+`XenSwdgn~passthrough_deassign_pci_dev_from_dom~1`
+
+Description:
+Xen shall deassign a specified PCI device from a domain during its destruction.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign single device to single domain
+-------------------------------------
+
+`XenSwdgn~passthrough_assign_single_dev_to_single_dom~1`
+
+Description:
+Xen shall assign a single device to a single domain. Xen shall fail to create
+a new domain if the device to be passed through is already assigned to
+the existing domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign devices sharing resources to same domain
+-----------------------------------------------
+
+`XenSwdgn~passthrough_assign_devs_sharing_res_to_same_dom~1`
+
+Description:
+Xen shall assign devices that share some resources (interrupts or IOMMU
+connections) to the same domain. Xen shall fail to create a new domain if
+the device to be passed through shares resources with the device already
+assigned to the existing domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Enable IOMMU to perform DMA Remapping for device
+------------------------------------------------
+
+`XenSwdgn~passthrough_enable_iommu_to_perform_dma_remapping_for_dev~1`
+
+Xen shall enable IOMMU to perform stage-2 (or 2nd stage) address translations
+for the DMA operations done by a DMA-capable device when assigning it
+to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Use IOMMU to enforce DMA operations from device
+------------------------------------------------
+
+`XenSwdgn~passthrough_use_iommu_to_enforce_dma_ops_from_dev~1`
+
+Description:
+Xen shall use the IOMMU to enforce DMA operations done by a DMA-capable device
+assigned to a domain to be restricted to the memory of the given domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Use IOMMU to deny DMA operations from device
+--------------------------------------------
+
+`XenSwdgn~passthrough_use_iommu_to_deny_dma_ops_from_dev~1`
+
+Description:
+Xen shall use the IOMMU to deny DMA operations done by a DMA-capable device
+not assigned to any domain (deassigned from a domain).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Map device memory region
+------------------------
+
+`XenSwdgn~passthrough_map_dev_mem_region~1`
+
+Description:
+Xen shall map the device memory (i.e. MMIO) region into stage-2 (or 2nd stage)
+translation tables when assigning a specified device to a domain so the domain
+can configure and use the device.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deliver MSIs to domain
+----------------------
+
+`XenSwdgn~passthrough_deliver_msis_to_dom~1`
+
+Xen shall inject associated with the MSI-capable (i.e. PCI) device interrupts
+(MSIs) into the domain to which the device is assigned whenever interrupts
+are generated.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Requirements for Arm64 only
+===========================
+
+Support assignment of platform devices
+--------------------------------------
+
+`XenSwdgn~passthrough_support_assign_dt_devs~1`
+
+Description:
+Xen shall support the assignment of platform devices to the domains.
+The platform device can be either non-DMA-capable or DMA-capable.
+The platform device can be either interrupt-less or interrupt-driven.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Support deassignment of platform devices
+----------------------------------------
+
+`XenSwdgn~passthrough_support_deassign_dt_devs~1`
+
+Description:
+Xen shall support the deassignment of platform devices from the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign platform device to domain
+--------------------------------
+
+`XenSwdgn~arm64_passthrough_assign_dt_dev_to_dom~1`
+
+Description:
+Xen shall assign a specified platform device to a domain during its creation
+using passthrough (partial) device tree.
+
+Rationale:
+
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree.
+ - The passthrough device tree shall entirely describe the platform device to
+   be passed through to a domain so the domain can discover and use the device.
+ - The intention of the platform device usage for the passthrough is specified
+   using device tree property ("xen,passthrough") in the device node described
+   in the host device tree.
+ - The memory region of the platform device and the corresponding guest address
+   for remapping are specified using the device tree property ("xen,reg") in
+   the device node described in the passthrough device tree.
+ - The path of the platform device node in the host device tree is specified
+   using the device tree property ("xen,path") in the device node described
+   in the passthrough device tree. Both interrupt mappings and IOMMU settings
+   are based on it.
+ - The allowance of the platform device assignment which is not behind an IOMMU
+   (for both non-DMA-capable and DMA-capable devices) is specified using
+   the device tree property ("xen,force-assign-without-iommu") in the device
+   node described in the passthrough device tree. The said property also allows
+   the interrupt-less platform device assignment (a device that has only
+   an memory region) without specifying the corresponding node in the host
+   device via device tree property ("xen,path").
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign platform device from domain
+------------------------------------
+
+`XenSwdgn~passthrough_deassign_dt_dev_from_dom~1`
+
+Description:
+Xen shall deassign a specified platform device from a domain during its
+destruction.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign PCI device to domain on Arm64
+------------------------------------
+
+`XenSwdgn~passthrough_assign_pci_dev_to_dom_arm64~1`
+
+Description:
+Xen shall assign a specified PCI device to a domain during its creation using
+passthrough (partial) device tree.
+
+Rationale:
+
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree.
+ - The PCI device to be passed through is specified using device tree property
+   ("xen,pci-assigned") in the "passthrough" node described in the passthrough
+   device tree.
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Support creation of direct mapped domains
+-----------------------------------------
+
+`XenSwdgn~passthrough_support_creation_direct_mapped_doms~1`
+
+Description:
+Xen shall support the creation of direct mapped (guest frame number == machine
+frame number) domains using passthrough (partial) device tree.
+
+Rationale:
+The assignment of DMA-capable device which is not behind an IOMMU is allowed
+for the trusted direct mapped domains only.
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deliver SPIs to domain
+----------------------
+
+`XenSwdgn~passthrough_deliver_spis_to_dom~1`
+
+Xen shall inject associated with the platform device interrupts (SPIs) into
+the domain to which the device is assigned whenever interrupts are generated.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Requirements for AMD64 PVH only
+===============================
+
+Assign PCI device to domain on AMD-x86
+--------------------------------------
+
+`XenSwdgn~passthrough_assign_pci_dev_to_dom_x86~1`
+
+Description:
+Xen shall assign a specified PCI device to a domain during its creation using
+Hyperlaunch device tree.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Enable IOMMU to perform Interrupt Remapping for device
+------------------------------------------------------
+
+`XenSwdgn~passthrough_enable_iommu_to_perform_irq_remapping_for_dev~1`
+
+Xen shall enable the IOMMU to perform filtering (permission checking) and
+Interrupt Remapping for the device interrupts when assigning a specified device
+to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Use IOMMU to enforce interrupt generation from device
+-----------------------------------------------------
+
+`XenSwdgn~passthrough_use_iommu_to_enforce_irq_gen_from_dev~1`
+
+Description:
+Xen shall use the IOMMU to ensure that the device can only generate interrupts
+for the domain to which it is assigned.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Notes
+=====
+
+The AMD64 PVH-specific requirements are written under the assumption that once
+the Hyperlaunch feature is completed, Xen shall assign a PCI device to boot
+time domains. This is not the case today, where the PCI device can be passed
+through only to domains launched by a control (toolstack) domain.
+
+The Arm64-specific requirements are written under the assumption that once
+the dom0less PCI Passthrough feature is completed, Xen shall assign a PCI device
+to boot time domains. This is not the case today, where only the platform device
+Passthrough is supported.
+
+[1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough.txt;hb=HEAD
+[2] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough-noiommu.txt;hb=HEAD
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 183f183b1f..19c2f26b2b 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -10,3 +10,4 @@ Requirements documentation
    market-reqs
    product-reqs
    design-reqs/arm64
+   design-reqs/common
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index f456788d96..37a443395b 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -47,3 +47,36 @@ Comments:
 
 Needs:
  - XenProd
+
+Run AMD-x86 domains
+-------------------
+
+`XenMkt~run_x86_domains~1`
+
+Description:
+Xen shall run AMD-x86 domains.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Domain device assignment
+------------------------
+
+`XenMkt~domain_device_assignment~1`
+
+Description:
+Xen shall assign device to each domain.
+
+For example, it shall assign GPU to domain A, MMC to domain B. Only the domain
+assigned to a device, shall have exclusive access to the device.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/common/reqs.rst b/docs/fusa/reqs/product-reqs/common/reqs.rst
new file mode 100644
index 0000000000..9304399e4d
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/common/reqs.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domain Creation And Runtime
+===========================
+
+Device Passthrough
+------------------
+
+`XenProd~device_passthrough~1`
+
+Description:
+Xen shall provide mechanism for assigning a physical device to the domains.
+
+For example:
+
+- PCI passthrough
+- MMC passthrough
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~run_x86_domains~1`
+ - `XenMkt~domain_device_assignment~1`
+
+Needs:
+ - XenSwdgn
-- 
2.34.1


